---
title: vue项目基于openvvjs实现的人脸识别
date: 2023-05-10 10:00:00
tags:
  - 技术分享
top: true
categories:
  - 文章
cover: /blog/post/face-check/face-cover.png
# feature: true
comments: false
---

# vue项目基于openvvjs实现的人脸识别

> 之所以研究这个，是有一个项目中需要对上传的图片进行人脸验证，之前也有一个方案是video中增加实时人脸检测，但是优化的效果和体验不是很好。所以放弃了。
> 对于图片的检测那就相对来说简单了好多。其中也有很多第三方的api也支持识别。那为什么使用opencv,第一第三方的api只是单纯对接没有太多技术可言。第二opencv
> 我没有在vue 项目中使用过。对于我来说是个有趣的挑战。

## 项目开源 [demo](https://github.com/yujianhui1993/vue-face-opencv)

> 特别鸣谢：其中图片裁剪使用了开源的 vue-cropper，我在其中参考了几个版本，改了一点代码，由于这个是事后写的，参考的几位作者一时找不到了。如果有谁知道可联系我
> 我加上作者来源。

## 准备工作

1. OpenCVjs 文件
2. 人脸检测参考点文件（提供给opencv使用）


### OpenCVjs 文件

> 这个文件怎么获取，我代码中有提供，网上也有教程，如何去生成js文件。由于我的重心不在这，我也是采用了别人生成好的文件。你可以自己生成，也可以采用我的。

### 人脸检测文件

> 这份文件也是我网上搜索的 haarcascade_frontalface_default.xml, 目前用起来还可以。检测也正常。

## 开始开发

### 引入OpenCVjs

> 在项目的index.html 文件中添加。以下代码。 其中opencv.js 文件放在了static文件夹下

```javascript

  <script async src='static/opencv.js' onload="onOpenCvReady();"></script>
  <script>
    function onOpenCvReady() {
      console.log('opencv-start')
    }
  </script>

```

### 添加检测模型

> 这里有个问题 cv.FS_createDataFile 如果多次导入同一份文件，首次正常，后续就会抛异常。但是我没有找到如何清空的方法，所以我加了trycatch处理。
``` vue
  // 初始化导入训练model
  async initImportOpenCvModel() {
    // 获取文件
    const file = new URL('../../assets/xml/haarcascade_frontalface_default.xml', import.meta.url).href;
    // 将文件转化成buffer
    const doc = await this.getFile(file);
    const doc2 = new Uint8Array(doc);
    try {
      // 导入训练模型
      window.cv.FS_createDataFile('/', 'haarcascade_frontalface.xml', doc2, true, false, false);
    } catch (error) {
      console.log('error===>', error)
    }
  }
```

### 人脸检测

> 关于剪裁的这里不做介绍了。

``` vue

  // 校验图片人脸数
  async checkFaceNum() {
    // 加载 canvas的图片内容
    // 这里需要canves 去承接裁剪后的图片内容，我尝试过直接使用image的，但是没有成功。
    let src = window.cv.imread('canvesImg');
    // 设置灰度值
    let gray = new window.cv.Mat();
    window.cv.cvtColor(src, gray, window.cv.COLOR_RGBA2GRAY, 0);
    let faces = new window.cv.RectVector();
    let faceCascade = new window.cv.CascadeClassifier();

    faceCascade.load("haarcascade_frontalface.xml");
    let msize = new window.cv.Size(0, 0);
    // 根据模型数据校验人脸数据
    faceCascade.detectMultiScale(gray, faces, 1.1, 3, 3, msize, msize);
    // 清空
    src.delete();
    gray.delete();
    faceCascade.delete();
    // 返回数据
    return faces.size();
  },

```

### 遇到的难点

> 1. 导入检测文件，从开始的import, require, 到后面的URL, 终于导入成功了，后又发现导入后的文件格式对不上，opencv 需要buffer类型的数据。
> 后来对比html版本的，进行测试调整也总算把数据解决。
> 2. cv.imread() 需要接收 canves的内容，我记得他是可以接收imageid的，不知道是不是我记错了，所以这一步搞了我很久。后来也是参考的html的代码。
> 发现他是从canves中获取的。后来改成 canves 居然成功了。