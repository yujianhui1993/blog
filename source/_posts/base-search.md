---
title: search 搜索框
date: 2022-10-15 18:49:36
tags:
  - 组件封装
categories:
  - 组件
cover: '/post/base-search/search-cover.webp'
# feature: true
comments: false
---
# search 搜索框

通用页面搜索使用，支持input slect date, 多条件时支持展开缩放功能

## 演示案例

### 示例一

:::details 通用页面搜索使用，支持input slect date, 多条件时支持展开缩放功能，只需配置搜索搜索项

```vue
<template>
  <div>
    <div>
      <BaseSearch :options.sync="options" @search="search">
      </BaseSearch>
    </div>
  </div>
</template>

<script>
  export default {
    data() {
      return { 
        // 配置搜索项
        options: {
          open: false, // 当搜索条件大于3个时，是否展开搜索条件。默认不展开
          data: [
            {
              label: '下拉选择',
              prop: "pcUuid", // 字段标识
              type: 'select', // 类型
              value: '', // 初始值
              clearable: false, // 是否可清空 默认可清空
              filterable: true, // 搜索框是否可输入文字搜索 默认不可以
              dicData: [{ // 数据配置项 目前只支持配置，不支持接口获取
                name: '下拉数据1',
                value: 1
              },{
                name: '下拉数据2',
                value: 2
              },{
                name: '下拉数据3',
                value: 3
              }]
            },
            {
              label: '输入测试',
              type: 'input', // 输入类型
              prop: 'cc',
              value: ''
            },
            {
              label: '开始时间',
              type: 'date', // 时间类型
              prop: 'ksrqks',
              value: '',
              pickerOptions: { // 时间选择配置项
                disabledDate: true, // 时间选择限制是否开启 未开启 则时间选择不限制
                compareValue: 'ksrqjs', // 开启后比较对象key 
                compareType: "<", // 限制规则 < ,> = 只支持三种
              }
            },
            {
              label: '结束时间', // 同上
              type: 'date',
              prop: 'ksrqjs',
              value: '',
              pickerOptions: {
                disabledDate: true,
                compareValue: 'ksrqks',
                compareType: ">",
              }
            },
          ]
        },
      }
    },

    methods: {
      // 搜索回调方法
      search(data = {}) {
        console.log("data==>", data)
      },
    }
  }
</script>
```
:::

### 示例二

:::details 通用页面搜索使用，支持input slect date, 多条件时支持展开缩放功能，只需配置搜索搜索项

```vue
<template>
  <div>
    <div>
      <BaseSearch :options.sync="options2" @search="search">
      </BaseSearch>
    </div>
  </div>
</template>

<script>
  export default {
    data() {
      return { 
        options2: {
          open: false, // 当搜索条件大于3个时，是否展开搜索条件。默认不展开
          data: [
            {
              label: '下拉选择',
              prop: "pcUuid", // 字段标识
              type: 'select', // 类型
              value: '', // 初始值
              clearable: false, // 是否可清空 默认可清空
              dicData: [{ // 数据配置项 目前只支持配置，不支持接口获取
                name: '下拉数据1',
                value: 1
              },{
                name: '下拉数据2',
                value: 2
              },{
                name: '下拉数据3',
                value: 3
              }]
            },
            {
              label: '输入测试',
              type: 'input', // 输入类型
              prop: 'cc',
              value: ''
            },
          ]
        }
      }
    },

    methods: {
      // 搜索回调方法
      search(data = {}) {
        console.log("data==>", data)
      },
    }
  }
</script>
```
:::

### 参数描述

> options配置


| 参数 |    说明 |    类型 | 可选值 | 默认值 |
| ----- | ------ | ----- | :-----: |  :---:  |
| open | 当搜索条件大于3个时，是否展开搜索条件。默认不展开 | Boolean | true/false | false |
| data | 查询条件数据集 | Array | - | - |


> data描述

| 参数 |    说明  |   类型 | 可选值 | 默认值 |
| ----- | ------ | ----- | :-----: |  :---:  |
| label | 搜索名称 | String| - | - |
| prop | 字段标识搜索返回的字段key | String | - | - |
| type | 类型 | input/select/date | - | - |
| value | 初始值 | String | - | - |
| clearable | 是否可清除 | Boolean |true/false | true |
| filterable | type=select有效 是否可输入 | Boolean |true/false | true |
| dicData | 下拉选择项 当type = select时必填。数据格式[{name: '', value: ''}...] | Array | - | - |


### 事件

| 事件 | 说明  | 参数
| --- | --- | --- |
| search | 当用户点击搜索按钮，或者下拉选择数据时触发事件 | data |