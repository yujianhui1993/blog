---
title: 实现三角角标的方式
date: 2022-01-01 18:49:36
top: true
tags:
  - 技术分享
categories:
  - 文章
cover: /post/triangle-subscript/sjjb.webp
# feature: true
comments: false
---

## 方式一
> 直接使用三角角标图片，通过定位的方式，定位到对应的位置

## 方式2
> 使用正方形方块，旋转45度角transform: rotate(45deg);，通过定位到对应位置。
> 其中对于父元素，我们需要使用 overflow: hidden;不然方块显示会操出父元素。


## 方式3
> 利用线性渐变方式
> background: linear-gradient(135deg, transparent 6px, #d2dff2 0) top left;
> 生成缺角的图块，在其底层添加一个背景层，这样两个层级合并，即可实现角标效果。

```vue

  <template>
    <div class="week-warning">
      <div class="week-warning__item--bg" v-for="(item, index) in weekList" :key="index">
        <div class="week-warning__item" :class="[nowDataCurrent[index], tableCurrent[index]]" @click="selectWeek(index)">
          <div>星期</div>
          <div class="week-warning__date">28</div>
          <div>2节课</div>
        </div>
      </div>
    </div>
  </template>
  <script>
  export default {
    props: {
      weekList: {
        type: Array,
        default: () => {
          return []
        }
      }
    },
    data() {
      return {
        tableCurrent: ['week-warning__current'],
        nowDataCurrent: ['', 'week-warning__item--current']
      }
    },

  methods: {
    selectWeek(index) {
      this.tableCurrent = []
      this.tableCurrent[index] = 'week-warning__current'
    }
  }
}
</script>

<style lang="scss" scoped>
  .week-warning {
    display: flex;

    &__item {
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 3px;
      height: 100%;
      background: #d2dff2;
      border-radius: 3px;

    &--current {
      background: linear-gradient(135deg, transparent 6px, #d2dff2 0) top left;
    }
    }
    &__item--bg {
      flex: 1;
      background: #457ec7;
      margin-left: 3px;
      margin-right: 3px;
      border-radius: 3px;
      font-size: 10px;
    }

    &__current {
      background: #457ec7;
      color: white;
    }

    &__date {
      font-weight: bold;
    }
  }
</style>

```