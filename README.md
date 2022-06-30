---
Date: 2022-06-29
Update: 2022-06-30
Author: 目棃
Description: 说明文档
---

## 项目说明

本项目源自数据库综合实验选题——图书管理系统项目的图书数据获取爬虫，采用 Selenium 进行数据爬取。

因为数据库综合实验的那个版本涉及到 MySQL 的数据写入，所以这边的代码我又重新写了一遍，把输出文件改成了 JSON 格式。

## 配置说明

将项目 [Release](https://github.com/BTMuli/HNULibSpider/releases) 中的 `app.zip` 下载解压，然后打开其中的 `main.exe` 执行即可。

> **建议在相关环境下运行**：
>
> + python: 3.10.4
> + chrome: 103.0.5060.66
> + chromedriver: 103.0.5060.53（压缩包内含文件）

## 源码说明

`lib` 目录下面的东西我没传上来，但是 Release 里面有，包括 `chromedriver` 跟应用的 `ico` 图标。

## 打包说明

本项目采用 `PyInstaller` 进行程序打包，相关命令如下:

```shell
pyinstaller -F main.py -i lib/cover.ico
```

相关参数：

+ `-F` ：打包成一个`exe` 应用程序
+ `-i`：指定程序 `ico` 图标目录

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