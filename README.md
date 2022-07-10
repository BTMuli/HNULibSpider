---
Date: 2022-06-29
Update: 2022-07-10
Author: 目棃
Description: 说明文档
---

## 项目说明

本项目源自数据库综合实验选题——图书管理系统项目的图书数据获取爬虫，采用 Selenium 进行数据爬取。

因为数据库综合实验的那个版本涉及到 MySQL 的数据写入，所以这边的代码我又重新写了一遍，把输出文件改成了 JSON 格式。

项目还有一个分支 [dart](https://github.com/BTMUli/HNULibSpider/tree/dart) 用的是 Dart 语言实现的版本。

试着写了一些之后发现还是 python 比较容易上手，Dart 分支的后续应该没有更新的打算。

## 配置说明

将项目 [Release](https://github.com/BTMuli/HNULibSpider/releases) 中的 ZIP 文件下载解压，然后打开其中的 `main.exe` 执行即可。

爬取的数据将会在同级目录下生成的 `booksInfo.json` 中保存。

> **建议在相关环境下运行**：
>
> + python: 3.10.4
> + chrome: 103.0.5060.66
> + chromedriver: 103.0.5060.53（压缩包内含文件）

## 打包说明

本项目采用 `PyInstaller` 进行程序打包，相关命令如下:

```shell
pyinstaller -F main.py -i lib/cover.ico --distpath .
```

相关参数：

+ `-F` ：打包成一个`exe` 应用程序
+ `-i`：指定程序 `ico` 图标目录
+ `--distpath`：指定 `exe` 输出目录

## Tag 的处理

由于 Github 不支持对于已有 tag  的删除操作，所以需要在本地命令行 进行操作并同步到远程。

相关命令如下：

```sh
git push origin :refs/tags/[tagname]
```

如：

```sh
git push origin :refs/tags/alpha
```

## TODO

- [ ] GUI界面（不知道写不写的出来）
- [ ] 导出到 XLS （方便观看）
- [ ] 爬取范围调整（目前默认是 20000 往后）

## 包依赖

[`requirements.txt`](requirements.txt) 采用如下命令生成：

```shell
pip freeze > requirements.txt
```

包含个人开发过程中使用过的所有依赖。

## LICENSE

> 查完资料才发现应该换成 MIT 会好一点，不过小项目就算了。

本项目采用 `Apache License V2.0` 协议。

```text
Copyright 2022 BTMuli

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```