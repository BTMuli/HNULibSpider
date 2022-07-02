/*
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
 */

// 一些比较简单的封装
import 'dart:io';

// 输入数据判断是否为字符串类型
String readInputCheck(String out) {
  stdout.write(out);
  var input = stdin.readLineSync();
  if (input == null) {
    print("未检测到输入数据！请重新输入！");
    return "noData";
  }
  var res = int.tryParse(input);
  if (res == null) {
    print("数据输入类型错误！应输入数据类型为： int");
    return "falseType";
  }
  return input;
}

// 通过循环检查完成变量赋值
String readInput(String out) {
  bool flag = false;
  String res;
  do {
    res = readInputCheck(out);
    if (res != "noData" && res != "falseType") {
      var num = int.parse(res);
      if (num < 0) {
        print("输入数据错误！应输入自然数！");
      } else {
        flag = true;
      }
    }
  } while (!flag);
  return res;
}