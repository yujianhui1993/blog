---
title: table 列表
date: 2022-10-15 18:49:36
tags:
  - 组件封装
categories:
  - 组件
# cover: https://cover.png
# feature: true
---
# table 列表

封装table列表并将分页封装其中 目的实现配置话开发。

## 演示案例
::: demo 对el-table 的二次封装，内置了分页pagination，数据配置化，也可通过插槽实现自定义样式。
```vue
<template>
  <div>
   <BaseTablePageData
      :dataSource="datalist"
      :pagination="page"
      :height="tableHeight"
      :columns="columns"
      @handleSelectionChange="handleSelectionChange"
      @handleSizeChange="handleSizeChange"
      @handleCurrentChange="handleCurrentChange"
    >
      <template slot="left">
        <el-table-column
          type="selection"
          width="50"
          align="center"
          headerAlign="center"
          fixed="left"
          :selectable="checkSelect"
        ></el-table-column>
        <el-table-column
          type="index"
          width="50"
          align="center"
          headerAlign="center"
          label="序号"
          fixed="left"
        ></el-table-column>
      </template>
      <template slot="action" slot-scope="scope">
        <el-button
          type="primary"
          size="mini"
          plain
          icon="el-icon-edit"
        >
          编辑
        </el-button>
        <el-button
          type="primary"
          size="mini"
          plain
          icon="el-icon-view"
        >
          查看
        </el-button>
      </template>
    </BaseTablePageData>
  </div>
</template>

<script>
  export default {
    data() {
      return { 
        tableHeight: "400px",
        selectSessionList: [],
         page: { //分页字段
          current: 1,
          size: 20,
          total: 0
        },

        columns: [
          {
            title: "科目名称",
            dataIndex: "kmmc",
            key: "kmmc",
            width: 100,
          },
          {
            title: "考试批次",
            dataIndex: "pcmc",
            key: "pcmc",
            showOverflowTooltip: true
          },
          {
            title: "场次名称",
            dataIndex: "cc",
            key: "cc",
            width: 100,
          },
          {
            title: "考试日期",
            dataIndex: 'ksrq',
            key: 'ksrq',
            width: 100,
            showOverflowTooltip: true
          },
          {
            title: "场次开始时间",
            dataIndex: "cckssj",
            key: 'cckssj',
            width: 120,
          },
          {
            title: "场次结束时间",
            dataIndex: "ccjssj",
            key: 'ccjssj',
            width: 120,
          },
          {
            title: "排序",
            dataIndex: "px",
            key: 'px',
            width: 60,
          },
          {
            title: "创建时间",
            dataIndex: "ctstamp",
            key: "ctstamp",
            width: 150,
            showOverflowTooltip: true
          },
          {
            title: "操作",
            key: "action",
            width: 200,
            fixed: "right",
          }
        ],
        datalist: [
          {
            uuid:"41705292c18f4c4a8e2eee36e19c2e91",
            pcUuid:"f453e14f-9e89-11ec-a315-2x2x1a666",
            pcmc:"2022年福建省高职院校分类考试招生职业技能测试",
            kmUuid:"a3f18353275745c9891c30e7e17cf5c5",
            kmmc:"英语",
            ksrq:"2022-09-22",
            cc:"第一场",
            cckssj:"11:00",
            ccjssj:"12:00",
            cssj:null,
            ctstamp:"2022-12-02 15:18:11",
            px:1
          },
          {
            "uuid":"afa5007aa4674992aa114b281f87cdaa",
            "pcUuid":"f453e14f-9e89-11ec-a315-2x2x1a666",
            "pcmc":"2022年福建省高职院校分类考试招生职业技能测试",
            "kmUuid":"a3f18353275745c9891c30e7e17cf5c5",
            "kmmc":"英语","ksrq":"2022-11-01",
            "cc":"第二场",
            "cckssj":"07:00",
            "ccjssj":"08:00",
            "cssj":null,
            "ctstamp":"2022-12-02 14:52:37",
            "px":2
          },
          {
            "uuid":"f7e31c8211c3428ba3bfcac2863fffa7",
            "pcUuid":"f453e14f-9e89-11ec-a315-2x2x1a666",
            "pcmc":"2022年福建省高职院校分类考试招生职业技能测试",
            "kmUuid":"a3f18353275745c9891c30e7e17cf5c5",
            "kmmc":"英语",
            "ksrq":"2022-11-01",
            "cc":"第三场",
            "cckssj":"09:00",
            "ccjssj":"11:00",
            "cssj":null,
            "ctstamp":"2022-12-02 14:52:37",
            "px":3
          },
          {
            "uuid":"7a9f426bbbf84fd6a15f0f2bf8227444",
            "pcUuid":"f453e14f-9e89-11ec-a315-2x2x1a666",
            "pcmc":"2022年福建省高职院校分类考试招生职业技能测试",
            "kmUuid":"a3f18353275745c9891c30e7e17cf5c5",
            "kmmc":"英语",
            "ksrq":"2022-12-29",
            "cc":"第四场",
            "cckssj":"09:00",
            "ccjssj":"12:00",
            "cssj":null,
            "ctstamp":"2022-11-29 16:34:35",
            "px":4
          }
        ],
      }
    },

    methods: {
      // 搜索回调方法
      search(data = {}) {
        console.log("data==>", data)
      },

      checkSelect() {
        return true
      },

      // 列表已勾选的场次
      handleSelectionChange(val) {
        this.selectSessionList = val
      },

      // 分页操作--修改每页展示条数
      async handleSizeChange(val) {
        this.page.size = val;
        this.page.current = 1;
        // 重新获取数据
        this.getSessionList(this.page)
      },

      // 分页操作--修改页数
      async handleCurrentChange(val) {
        this.page.current = val;
        this.getSessionList(this.page)
      }
    }
  }
</script>

```
:::


### 参数描述
总的参数描述

| 参数 |    说明 |    类型 | 可选值 | 默认值 |
| ----- | ------ | ----- | :-----: |  :---:  |
| dataSource | 显示的数据 | Array | - | - |
| height | Table 的高度，默认为自动高度。如果 height 为 number 类型，单位 px；如果 height 为 string 类型，则这个高度会设置为 Table 的 style.height 的值，Table 的高度会受控于外部样式。 | String/Number | - | - |
| pagination | 分页数据(详情查看下方) | Object | - | - |
| columns | 表格列的配置描述，具体项见下表 | Array | - | - |


> pagination 配置

| 参数 |    说明 |    类型 | 可选值 | 默认值 |
| ----- | ------ | ----- | :-----: |  :---:  |
| current | 显示的页码 | Number | - | 1 |
| size | 每页显示条数 | Number | - | 20 |
| total | 总条数 | Number | - | 0 |


> columns 配置

| 参数 |    说明 |    类型 | 可选值 | 默认值 |
| ----- | ------ | ----- | :-----: |  :---:  |
| title | 列头显示文字 | String | - | - |
| width | 每列宽度 | Number | - | - |
| key | 插槽识别标识，可自定义设置列表数据样式,唯一不可重复 | String | - | - |
| dataIndex | 数据字段标识 | String | - | - |
| showOverflowTooltip | 默认情况下若内容过多会折行显示, 为true时多余的内容会在 hover 时以 tooltip 的形式显示出来。| Boolean | - | false |
| fixed | 列是否固定在左侧或者右侧，true 表示固定在左侧 ｜ String/Boolean | true, left, right | - |
| align | 对齐方式 | String | left/center/right | left |
| headerAlign | 表头对齐方式，若不设置该项，则使用表格的对齐方式 | String | left/center/right | - |


### slot

列表默认设置了插槽 方便自定义

| 参数 |    说明 |    类型 | 可选值 | 默认值 |
| ----- | ------ | ----- | :-----: |  :---:  |
| left | 列表左侧插槽，查看上方例子 | String | - | - |
| right | 列表右侧插槽，同上 | String | - | - |
| columns.key | columns列表数据插槽，查看上方例子，操作栏数据 | String | - | - |


### 事件

table 的操作事件

| 事件 |    说明 |    参数 | 
| ----- | ------ | ----- | 
| handleSelectionChange | 当列表有多选框时，勾选触发的事件,多选框的table-column 比较特殊，案例是已slot形式添加的。 | Array|
| handleSizeChange | 当用户修改页面显示条数时触发 | val |
| handleCurrentChange | 当用户修改页码时触发 | val |