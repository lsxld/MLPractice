# Git extension

## 什么是Git extension

Git extension 包含一系列git 的扩展命令，本质上是利用 git alias 配合脚本命令实现常用git功能的简化，使其更符合Perforce用户的习惯。他主要针对Git使用还未熟练的用户，帮助他们摆脱繁琐的各种git参数

## Git extension 目前包含哪些命令

* git submit
* git sync
* git filelog
* git diff2
* git opened
* git changes
* git tkdiff

后续根据大家反馈意见会增加更多的功能

### git submit

git submit 用于提交当前workspace 的改动，其主要解决了一下几个问题

* 大概率减少执行push时，因为有其他check in导致失败的情况
* 更符合"p4 submit"的习惯，可以直接编辑要check in的文件列表，避免"commit -a"导致的误提交不必要的文件
* 方便的提交到新的branch上，自动在msg中加入WIP，作为临时提交

常用场景:

* 在当前branch中提交改动
  `git submit`
* 将改动提交到新的branch上
  `git submit -b <new branch>`
* 直接提交所有改动
  `git submit -m "message" -a`

### git sync

git sync 用于更新整个workspace或某个文件到一个 commit

常用场景:

* 更新workspace到最新
  `git sync`
* 更新workspace到之前的一个commit
  `git sync -c <COMMIT>`
* 更新某个文件到一个commit, 注意，更新后会产生文件改动
  `git sync FILE@COMMIT`
* 切换到某个branch,并sync到最新
  `git sync -b BRANCH`

### git filelog

git log —oneline 的alias, 用于配合 git sync 或git diff2，查看某文件或目录的历史commit

### git diff2

用法:  git diff2  FILE  COMMIT1  COMMIT2

COMMIT可以用git filelog 查询

### git opened

git status -s 的alias，符合p4习惯

### git changes

git log —oneline 的alias，符合p4 习惯，可以 git changes -n10 查询顶上10个commit

### git tkdiff

git diff的扩展，用tkdiff展示，更容易查看

用法:

* 展示某文件与HEAD commit的区别
  `git tkdiff FILE`
* 展示某文件与历史COMMIT的区别
  `git tkdiff FILE@COMMIT`

也可用 gitdiff （没有空格） 代替 git tkdiff



## 关于今后submit策略的调整

目前所有人都在master 上工作，难免发生某人的check in导致 tree break的情况。 现在PoWei已经帮助我们建立了auto-merge的flow，我们会考虑在下一个project，要求所有人都切换到branch上工作，然后CI会auto-merge提交的改动到master。 完整的contribution flow请参考PoWei的 CONTRIBUTION.md文档，位于hawaii STEM下。这里我们将这个flow用 Git extension作简化:

1. 如果当前仍在 master上工作，需要将改动提交到一个新的branch上
   `git submit -b BRANCH`
2. 如果已经在branch上工作，只需要
   `git submit`
3. 更新当前branch，并且把其他人merge到master的改动都拿到当前branch中
   `git sync`
4. 需要切换到其他人建的branch进行开发
   `git sync -b BRANCH`

