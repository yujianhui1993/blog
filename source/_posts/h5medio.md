---
title: h5页面调用摄像头
date: 2023-01-01 18:49:36
tags:
  - 技术分享
categories:
  - 文章
# cover: https://cover.png
# feature: true
comments: false
---
# h5页面调用摄像头

## 调用摄像头的几个易难点

1. 本地可以部署后不行
>  navigator.mediaDevices 调用需要在 localhost,或者https 的环境下才能成功，如果是http的则将报错，无法调用成功。
2. video 的宽高设置
> video组件的宽高比是固定的，直接设置宽高是不能达到效果，我们需要 “object-fit: fill”, 将内容填充。这样设置的宽高才有效果。
3. video 呈现的画面镜像问题
> 这个需要翻转 利用 transform: rotateY(180deg)可以实现。
4. ios 无法调用问题
> 网上原有的方案中。在video.onloadedmetadata 方法中去调用 video.play() 可实现调起摄像头（在安卓手机上）。ios在升级后，这种方案已经无法调用了。我们需要调用 video.load() 后，延迟调用video.play() 延迟时间大概一秒左右。（底部有源码）
5. 保存图片镜像问题
> 利用canvas 保存video帧动画时，也会出现图片镜像问题，这时我们需要 context.scale(-1, 1) 左右镜像翻转，来实现。

## vue 封装的 h5中调用摄像头代码 使用方法
1. 引入组件（下方代码）

2. 暴露方法 getVideoCameraInfo() 返回 canvas的数据，由自己处理


### 代码 
```vue
<template>
  <div>
    <video
      ref="video"
      id="videoCamera"
      autoPlay
      muted
      :width="videoWidth"
      :height="videoHeight"
      playsInline>
    </video>
    <canvas 
      style="display: none"
      :width="videoWidth"
      :height="videoHeight"
      id="canvasCamera">
    </canvas>
    <div class="video-mark">
      <!-->插槽可自定义自己的遮罩层 <!-->
      <slot name="mark"></slot>
    </div>
  </div>
</template>

<script>
import { Toast } from 'vant';

export default {
  props: {
    // 设置video 的宽
    videoWidth: {
      type: [ Number, String],
      default: 300
    },
    // 设置video 的高
    videoHeight: {
      type: [ Number, String],
      default: 300
    }
  },

  mounted() {
    // 进入页面 自动调用摄像头
    this.initCamera();
  },

  methods: {
    async initCamera() {
      // 提示
      await this.initToast('初始化...', 0)
      // 校验兼容性
      await this.checkCompatible()
      // 创建video
      await this.createVideo()

    },

    // 生成video
    async createVideo() {
      const constraints = {
        audio: false,
        video: {
          width: this.videoWidth,
          height: this.videoHeight,
          facingMode: "user" // 前置优先
        }
      };
      // 正常支持版本
      navigator.mediaDevices.getUserMedia(constraints).then((stream) => {
        // 摄像头开启成功
        this.$refs.video.srcObject = stream;
        // ios 需要video load后才可以调用play
        // 调用play 需要延迟处理
        this.$refs.video.load()
        setTimeout(() => {
          this.$refs.video.play()
          Toast.clear();
        }, 1000);
      }).catch(err => {
        Toast.clear();
        console.log('error===>', err);
      });
    },

    // 校验兼容性
    async checkCompatible() {
      // 兼容性判断
      // 旧版本浏览器可能根本不支持mediaDevices,首先设置一个空对象
      if (navigator.mediaCapabilities === undefined) {
        navigator.mediaCapabilities = {};
      }
      // 一些浏览器实现了部分mediaDevices,不能值分配一个对象
      // 使用getUserMedia属性，就添加她
      if (navigator.mediaDevices.getUserMedia === undefined) {
        // eslint-disable-next-line func-names
        navigator.mediaCapabilities.getUserMedia = function(constraints) {
          // 首先获取现存的getUserMedia(如果存在)
          const getUserMedia =
            navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.getUserMedia;
          // 有些浏览器不支持，会返回错误信息
          // 保持接口一致
          if (!getUserMedia) {
            return Promise.reject(new Error("浏览器不支持！"));
          }
          // 否则，使用Promise将调用爆炸到旧的navigator.getUserMedia
          return new Promise((resolve, reject) => {
            getUserMedia.call(navigator, constraints, resolve, reject);
          });
        };
      }
    },

    // 获取
    getVideoCameraInfo() {
      // 获取 canvas 画布
      const canvas = document.getElementById('canvasCamera');
      const context = canvas.getContext('2d');

      // 位移来做镜像翻转
      context.translate(this.videoWidth, 0);
      context.scale(-1, 1); // 左右镜像翻转
      context.drawImage(this.$refs.video, 0, 0,  this.videoWidth, this.videoHeight);
      return canvas;
      // const image = canvas.toDataURL('image/png');
      // return image;
    },

    async initToast(msg, duration = 0) {
      Toast.loading({
        duration, // 持续展示 toast
        forbidClick: true,
        message: msg,
      });
    }
  },

  beforeDestroy() {
    // 关闭视频
    this.$refs.video.srcObject.getTracks()[0].stop();
  }
}
</script>

<style lang="scss" scoped>
.video-mark {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
}

video {
  display: block;
  object-fit: fill;
  transform: rotateY(180deg);
  -webkit-transform: rotateY(180deg);    /* Safari 和 Chrome */
  -moz-transform: rotateY(180deg);
}
</style>

```

## 附上压缩文件方法

> 引入 npm run browser-image-compression

### 使用方法
> import imageCompression from 'browser-image-compression'

```vue
  // 获取图片base64链接
  const options = {
    maxSizeMB: 0.05, //压缩大小 MB
    maxWidthOrHeight: 200, // 压缩尺寸
    useWebWorker: true,
    fileType: 'image/jpeg' // 文件类型
  }

 const compressedFile = await imageCompression(blob, options);
```
