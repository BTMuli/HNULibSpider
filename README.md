---
Date: 2022-06-29
Author: 目棃
Description: 说明文档
---

## 项目说明

本项目源自数据库综合实验选题——图书管理系统项目的图书数据获取爬虫，采用 Selenium 进行数据爬取。

因为数据库综合实验的那个版本涉及到 MySQL 的数据写入，所以这边的代码我又重新写了一遍，把输出文件改成了 JSON 格式。

## 配置说明

将项目 [Release](https://github.com/BTMuli/HNULibSpider/releases) 中的 `app.zip` 下载解压，然后打开其中的 `main.exe` 执行即可。

> 需有相关环境：
>
> + python: 3.10.4
> + chrome: 103.0.5060.66
> + chromedriver: 103.0.5060.53

## 源码说明

`lib` 目录下面的东西我没传上来，但是 Release 里面有，包括 `chromedriver` 跟应用的 `ico` 图标。