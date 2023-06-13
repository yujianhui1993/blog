---
title: Git操作规范
date: 2022-10-15 18:49:36
tags:
  - Git 规范
categories:
  - 规范
# cover: https://cover.png
# feature: true
comments: false
---

# Git规范

### 写好git commit提交有什么好处呢？


  - 查看提交的log也非常的优雅，这个就不多提了


  - 方便查找日志记录，通过简单的过滤便能定位到具体想要查找的log


  - 方便问题回溯，通过git log就能查找到当时提交的代码文件，以及修改的代码


  - 其实如果使用过github的release, 可以直接根据feat和fix来过滤提取日志发布版本


### 如何提交git commit

  1. 创建自己分支 (Yjh/{type}/xxx) 头部为提交人缩写 type为提交类型 xxx为模块描述

  2. 编写 commit 内容，内容应该尽量精简描述

  type 值一般有以下几种：

    - feat：新功能 feature
    - bug：测试反馈 bug 列表中的 bug 号
    - fix： 修复 bug
    - ui：更新UI；
    - docs： 文档注释变更
    - style： 代码格式(不影响代码运行的变动)；
    - refactor： 重构、优化(既不增加新功能，也不是修复bug)；
    - perf： 性能优化；
    - release：发布；
    - deploy：部署；
    - test： 增加测试
    - chore： 构建过程或辅助工具的变动
    - revert： 回退
    - build： 打包



## GIT 常用操作

### 创建存储库

      创建一个新的本地存储库
      $ git init [项目名称]

      克隆存储库(代码仓库)
      $ git clone <git_url>

      将存储库克隆到指定目录
      $ git clone <git_url> 指定目录

      将存储库克隆到指定目录，并指定分支
      $ git clone <git_url> -b <分支名称> 指定目录

### 使用分支

      列出所有本地分支
      $ git branch

      列出所有分支，本地和远程
      $ git branch -av

      切换到 my_branch，并更新工作目录
      $ git checkout my_branch

      创建一个名为 new_branch 的新分支
      $ git checkout -b new_branch

      删除名为 my_branch 的分支
      $ git branch -d my_branch

      将分支 A 合并到分支 B
      $ git checkout branchB
      $ git merge branchA

      标记当前提交
      $ git tag my_tag

      从远程分支中创建并切换到本地分支
      $ git checkout -b <branch-name> origin/<branch-name>

### 做出改变

      在工作目录中显示修改后的文件，为您的下一次提交暂存
      $ git status

      暂存文件，准备提交
      $ git add [file]

      暂存所有更改的文件，准备提交
      $ git add .

      将所有暂存文件提交到版本化历史记录
      $ git commit -m "commit message"

      将所有跟踪的文件提交到版本化历史记录
      $ git commit -am "commit message"

      取消暂存文件，保留文件更改
      $ git reset [file]

      将所有内容恢复到最后一次提交
      $ git reset --hard

      已更改但未暂存内容的差异
      $ git diff

      已 commited 但尚未提交的内容的差异
      $ git diff --staged

      在指定分支之前应用当前分支的任何提交
      $ git rebase [branch]

### 配置

      设置将附加到您的提交和标签的名称
      $ git config --global user.name "name"

      设置将附加到您的提交和标签 tags 的电子邮件地址
      $ git config --global user.email "email"

      启用 Git 输出的一些着色
      $ git config --global color.ui auto

      在文本编辑器中编辑全局配置文件
      $ git config --global --edit

      显示本地 repo 配置设置
      $ git config --list

      删除全局设置
      $ git config --global --unset <entry-name>


### 重构文件名

      # 从工作目录中删除文件并暂存删除
      git rm <filename>

      # 从版本控制中删除文件但在本地保留文件
      git rm --cached <filename>

      # 更改文件名并准备提交
      git mv <filename-orig> <filename-renamed>


### 同步

      从该 Git 远程获取所有分支
      $ git fetch [alias]

      将远程分支合并到当前分支以使其保持最新状态
      $ git merge [alias]/[branch]

      # 没有快进
      $ git merge --no-ff [alias]/[branch]

      # 仅快进
      $ git merge --ff-only [alias]/[branch]

      将本地分支提交传输到远程存储库分支
      $ git push [alias] [branch]

      从跟踪远程分支获取并合并任何提交
      $ git pull

      将另一个分支的一个特定提交合并到当前分支
      $ git cherry-pick [commit_id]


### 临时提交

      # 保存已修改和分阶段的更改
      $ git stash

      # 列出隐藏文件更改的堆栈顺序
      $ git stash list

      # 从存储堆栈顶部编写工作
      $ git stash pop

      # 丢弃存储堆栈顶部的更改
      $ git stash drop

      # 回到某个 stash 的状态
      $ git stash apply <stash@{n}>

      # 删除所有的 stash
      $ git stash clear


### 观察你的存储库

      显示当前活动分支的提交历史
      $ git log

      显示 branchA 上不在 branchB 上的提交
      $ git log branchB..branchA

      显示更改文件的提交，即使跨重命名
      $ git log --follow [file]

      显示 branchA 中的内容与 branchB 中的内容的差异
      $ git diff branchB...branchA

      以人类可读的格式显示 Git 中的任何对象
      $ git show [SHA]


### 忽略文件


      文件 .gitignore 指定了 Git 应该忽略的 未跟踪的 文件

      行首 #	全行注释，不支持行尾类注释 (转义 \#)
      行首 !	否定模式 (转义 \!)
      **	匹配任意路径
      *	匹配任意多个字符
      ?	匹配任意一个字符
      doc/**	匹配 doc 文件夹下的全部内容
      doc/**/a	匹配任意深度路径下的 a 文件或文件夹
      /	表示路径分隔符，不区分操作系统
      / 结尾	仅会匹配文件夹，否则会匹配文件和文件夹
      空行	不匹配任何文件
      行尾空格	默认被忽略，可使用\进行转义
      行首空格	被正常处理，不会被忽略
      当前 .gitignore 文件定义规则的优先级高于上级路径 .gitignore 定义规则的优先级；后定义的规则优先级高于前面定义规则的优先级

#### 忽略当前目录logs文件夹下的全部内容

      /logs/
      /logs/*
      /logs/**
#### 上述几条规则等效

#### 忽略 Mac 系统文件，包括任意子路径下的同名文件（夹）
      
      .DS_store

#### 忽略 node_modules 文件夹，包括任意子路径下的同名文件夹
      
      node_modules/

#### 忽略任意子路径下build、target文件夹，
#### 但不忽略src/main、src/test下的build、target文件夹

      build/
      !**/src/main/**/build/
      !**/src/test/**/build/
      target/
      !**/src/main/**/target/
      !**/src/test/**/target/

#### 使用 ! 重新包含指定文件（夹）

      !logs/.gitkeep


### 远程

      添加一个 git URL 作为别名
      $ git remote add [alias] [url]

      显示您设置的远程存储库的名称
      $ git remote

      显示远程存储库的名称和 URL
      $ git remote -v

      删除远程存储库
      $ git remote rm [remote repo name]
      更改 git repo 的 URL

      $ git remote set-url origin [git_url]


### 跟踪路径更改

      从项目中删除文件并暂存删除以进行提交
      $ git rm [file]

      更改现有文件路径并暂存移动
      $ git mv [existing-path] [new-path]

      显示所有提交日志，并指示任何移动的路径
      $ git log --stat -M


### git 配置 ssh 代理

      $ cat ~/.ssh/config
      Host gitlab.com
#### 直接使用 shadowsocks 提供的 socks5 代理端口

      ProxyCommand nc -X 5 -x 127.0.0.1:1080 %h %p 

      Host github.com
      ProxyCommand nc -X 5 -x 127.0.0.1:1080 %h %p


## Git 技巧

### 重命名分支

#### 重命名为new

      $ git branch -m <new>
      $ git branch -m <old> <new> #重命名分支
#### 推送并重置

      $ git push origin -u <new>
#### 删除远程分支

      $ git push origin --delete <old> #方法1
      $ git push origin :oldBranchName #方法2

### Log

#### 按内容搜索更改

      $ git log -S'<a term in the source>'
#### 显示特定文件随时间的变化

      $ git log -p <file_name>
#### 打印出很酷的日志可视化

      $ git log --pretty=oneline --graph --decorate --all
### Commit

      $ git commit -v --amend
      重写最后的提交信息

### 忽略文件的权限变化

      git config core.fileMode false
      不再将文件的权限变化视作改动


### 分支

#### 列出所有分支及其上游

      $ git branch -vv

#### 快速切换到上一个分支

      $ git checkout -

#### 只获取所有远程分支

      $ git branch -r

#### 从另一个分支签出单个文件

      $ git checkout <branch> -- <file>
#### 删除本地存在远程不存在的分支

      git remote prune origin


### Git 别名

      $ git config --global alias.co checkout

      $ git config --global alias.br branch
      
      $ git config --global alias.ci commit
      
      $ git config --global alias.st status


### 设置大小写敏感

#### 查看git 的设置

      $ git config --get core.ignorecase
#### 设置大小写敏感

      $ git config core.ignorecase false
#### 远程有俩相同目录，通过这种方式清除掉，然后提交记录
      
      $ git rm -r --cached <目录/文件>


### 撤销远程记录
#### 撤销一条记录   
    
      $ git reset --hard HEAD~1
#### 强制同步到远程仓库  

      $ git push -f origin HEAD:master


### 放弃本地修改内容

#### 如果有的修改以及加入暂存区的话

      $ git reset --hard 
#### 还原所有修改，不会删除新增的文件

      $ git checkout . 
#### 下面命令会删除新增的文件

      $ git clean -xdf


### 获取最近一次提交的 Hash

      $ git rev-parse HEAD # e10721cb8859b2c
      获取短 hash
      $ git rev-parse --short HEAD # e10721c


### 删除已经合并到 master 的分支

      $ git branch --merged master | grep -v '^\*\|  master' | xargs -n 1 git branch -d


### 把 A 分支的某一个 commit，放到 B 分支上

      # 切换到 B 分支
      $ git checkout <B>
      # 将 A 分支 <hash-id> 的内容 pick 到 B 分支
      $ git cherry-pick <hash-id>


#### 回到远程仓库的状态

      $ git fetch --all && git reset --hard origin/master


### 修改远程 Commit 记录

#### 表示要修改当前版本的倒数第三次状态

      $ git rebase -i HEAD~3
#### 将要更改的记录行首单词 pick 改为 edit

      pick 96dc3f9 提交 commit 描述内容 1
      pick f1cce8a 提交 commit 描述内容 2
      pick 6293516 提交 commit 描述内容 3
      # Rebase eeb03a4..6293516 onto eeb03a4 
      #                     (3 commands)
      #
      # Commands:
      # p, pick = 使用提交
      # r, reword = 使用提交，但编辑提交消息
      # e, edit = 使用提交，但停止修改
      # s, squash = 使用提交，但融合到先前的提交中
      # f, fixup = 像 squash，但丢弃此提交的日志消息
      # x, exec = 使用 shell 运行命令(该行的其余部分)
      # d, drop = 删除提交

      保存并退出，会弹出下面提示

      # 您现在可以修改提交，使用
      # 
      #   git commit --amend
      # 
      # 对更改感到满意后，运行
      # 
      #   git rebase --continue
      #
      # 1. 通过这条命令进入编辑更改 commit，保存退出
      $ git commit --amend
      # 2. 保存退出确认修改，继续执行下面命令, 
      $ git rebase --continue
      # 如果修改多条记录反复执行上面两条命令直到完成所有修改

      # 最后，确保没有人提交进行推送，最好不要加 -f 强制推送
      $ git push -f origin master


### 查看冲突文件列表

      $ git diff --name-only --diff-filter=U

### 关联远程分支

      $ git branch -u origin/mybranch
      或者在 push 时加上 -u 参数

      git push origin/mybranch -u
      关联之后，git branch -vv 就可以展示关联的远程分支名了, 同时推送到远程仓库直接：git push，不需要指定远程仓库


### 展示任意分支某一文件的内容

      $ git show <branch-name>:<file-name>