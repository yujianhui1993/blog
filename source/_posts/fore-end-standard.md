---
title: 前端命名规范
date: 2022-10-15 18:49:36
tags:
  - 命名规范
categories:
  - 规范
cover: '/post/fore-end-standard/web-cover.webp'
# feature: true
comments: false
---

# 前端命名规范
## 引入 Eslint、Prettier 规范

一个不好的命名，可能就会引起别人的错误理解；

遵循一套严格的命名规范，无论是对自己还是接手的他人，都会大大降低代码的维护成本，所以想要成为一名合格的前端开发，命名规范是必须的；

## 一些常见的不规则命名：

- 单词拼写错误：到底是 form 还是 from ？

- 中英文混用：到底用 dzTable 还是 addressList 呢？

- 以 1-9，a-z 命名：不同类型直接用 type1、type2、type3？

- 混用命名格式：一会 addressList 一会 addresslist 一会 addresses，这样不太好吧？

- 单复数不分: 到底 address 还是 addresses 啊？到底是 photoes 还是 photos ？

- 正反义词错用：到底用 showDialog 还是 isDialog 还是 visibleDialog ？

## 一些常见好的命名：

1. 驼峰式命名法介绍：

    - Pascal Case 大驼峰式命名法：首字母大写；

      - StudentInfo、UserInfo、ProductInfoCamel

    -  Case 小驼峰式命名法：首字母小写；

      - studentInfo、userInfo、productInfo

2. 文件资源命名：
    - 文件名不得含有空格；

      - 文件名建议只使用小写字母，不使用大写字母；

    - 名称较长时采用半角连接符(-)分隔；

            usr/dev/document/front-end/project-vue3

3. 变量命名
    - 命名方式：采用小驼峰式命名方法；

    - 命名规范：

      - 普通变量(number, string, date)；

      - 布尔类型：需要一个标识变量含义的前缀，比如has, is, wether, can, should等；

      - 数组/集合等复数形式：最好以s或list等能够标识复数形式的后缀结尾，标识当前变量是复数形式，提高可读性；

    - 常量全部大写，且用下划线来分割单词，eg：MAX_LENGTH = 1

4. 函数

    - 命名方式 : 小驼峰方式 lowerCamelCase ( 构造函数使用大驼峰命名法 )

    - 命名规则 : 前缀为动词，动词 
      
      eg：add / update / delete / detail / get

          // 更新数据
          function updateData(){
            return {};
          }

          // 获取用户信息
          function getUserInfo{
            return {}
          }

    - 附： 函数方法常用的动词: 

          get 获取 set 设置

          add 增加 remove 删除

          create 创建 destory 销毁

          start 启动 stop 停止

          open 打开 close 关闭

          read 读取 write 写入

          load 载入 save 保存

          begin 开始 end 结束

          backup 备份 restore 恢复

          import 导入 export 导出

          split 分割 merge 合并

          inject 注入 extract 提取

          attach 附着 detach 脱离

          bind 绑定 separate 分离

          view 查看 browse 浏览

          edit 编辑 modify 修改

          select 选取 mark 标记

          copy 复制 paste 粘贴

          undo 撤销 redo 重做

          insert 插入 delete 移除

          add 加入 append 添加

          clean 清理 clear 清除

          index 索引 sort 排序

          find 查找 search 搜索

          increase 增加 decrease 减少

          play 播放  pause 暂停

          launch 启动  run 运行

          compile 编译  execute 执行

          debug 调试  trace 跟踪

          observe 观察  listen 监听

          build 构建  publish 发布

          input 输入  output 输出

          encode 编码  decode 解码

          encrypt 加密  decrypt 解密

          compress 压缩  decompress 解压缩

          pack 打包  unpack 解包

          parse 解析  emit 生成

          connect 连接  disconnect 断开

          send 发送   receive 接收

          download 下载  upload 上传

          refresh 刷新  synchronize 同步

          update 更新  revert 复原

          lock 锁定  unlock 解锁

          check out 签出  check in 签入

          submit 提交  commit 交付

          push 推  pull 拉

          expand 展开  collapse 折叠

          enter 进入  exit 退出

          abort 放弃  quit 离开

          obsolete 废弃  depreciate 废旧

          collect 收集  aggregate 聚集

5. 常量命名全部大写，单词间用下划线隔开，力求语义表达完整清楚， 不要嫌名字长

        正例： MAX_STOCK_COUNT

        反例： MAX_COUNT


6. css 命名：

    - 样式类名使用小写字母，以半角连接符(-)分割；
    
    - id 采用驼峰式命名；
    
    - scss / less 中的变量、函数、混合、placeholder 采用驼峰式命名  