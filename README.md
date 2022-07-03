---
Date: 2022-06-29
Update: 2022-07-03
Author: 目棃
Description: 说明文档
---

## 项目说明

本项目为项目 HNULibSpider 的分支项目，采用跟其不同的语言对同一个功能进行重构。

之前的项目采用 Python + Selenium ，而本项目采用 Dart + webdriver ，思路大致相似。

## 配置说明

将项目 [Release](https://github.com/BTMuli/HNULibSpider/releases) 中的 ZIP 文件下载解压，
先启动 `chromedriver.exe` 再打开 `main.exe` 执行即可。

> **建议在相关环境下运行**：
>
> + dart: >=2.17.5 <3.0.0
> + chrome: 103.0.5060.66
> + webdriver: 3.0.0
> + chromedriver: 103.0.5060.53（压缩包内含文件）

## 打包说明

本项目采用 Dart 自带的 `dart compile` 进行打包，相关语句如下：

```shell
dart compile exe bin/main.dart
```

由于该命令目前不支持 `-i` 即添加图标操作，所以这个分支的可执行文件都是默认图标。

## LICENSE

本项目采用与父项目一致的 `Apache License V2.0` 协议。

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