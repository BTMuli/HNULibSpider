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

// 内置包
import 'dart:core';
import 'dart:io';
import 'dart:convert';
// 导入包
import 'package:webdriver/sync_io.dart';
// 自定义包
import 'package:demo/base_func.dart';
import 'package:demo/book_mod.dart';

// 全局 Chrome 配置
WebDriver browser = createDriver(
    uri: Uri(port: 9515,host: 'localhost'),
    spec: WebDriverSpec.JsonWire
);

Object argsInput(){
  print("请输入图书编号 code");
  var input = readInput("请输入起始编号: ");
  var start = int.parse(input);
  input = readInput("请输入末尾编号: ");
  var end = int.parse(input);
  if( start <= end){
    print("数据输入成功！即将进行数据爬取...");
    return [start, end];
  }
  else{
    return false;
  }
}

WebElement getXpath(String xpath){
  return browser.findElementByXpath(xpath);
}

List<dynamic> getBook(String url, int count){
  print("\n正在爬取图书...");
  browser.get(url);
  var title = getXpath('//*[@id="bookInfoTable"]/tbody//tr[@data-sort="40"]/td[2]/a').text;
  var author = getXpath('//*[@id="bookInfoTable"]/tbody//tr[@data-sort="40"]/td[2]').text;
  if (author.contains("/ ")) {
    author = author.split("/ ")[1];
  }
  var isbn = getXpath('//*[@id="bookInfoTable"]/tbody/tr[@data-sort="10"]/td[2]').text.split(" ")[0];
  var press = getXpath('//*[@id="bookInfoTable"]/tbody//tr[@data-sort="50"]/td[2]/a').text;
  count++;
  var book = ItemBook(url, title, author, isbn, press);
  book.out();
  return [book, count];
}

List<ItemBook> getBooks(List<int> numInput){
  List<ItemBook> bookList = <ItemBook>[];
  var urlBase = 'https://opac.hnu.edu.cn/opac/book/200001';
  print("\n开始爬取数据...");
  var successBook = 0;
  var startCode = numInput[0];
  var endCode = numInput[1];
  for(var i = startCode;i<=endCode;i++){
    var urlTrans = urlBase + i.toString().padLeft(4,'0');
    var res = getBook(urlTrans, successBook);
    if(res.isNotEmpty){
      bookList.add(res[0]);
      successBook=res[1];
    }
  }
  var totalBook = endCode + 1 - startCode;
  var totalGet = bookList.length;
  print("爬取完成，共爬取 $totalBook 次，成功爬取 $totalGet 本图书");
  return bookList;
}

int main(){
  dynamic data = false;
  while(data == false) {
    data = argsInput();
  }
  var booksData = getBooks(data);
  var fileJson = File('booksInfo.json');
  if(!fileJson.existsSync()){
    print("未检测到输出文件 booksInfo.json，即将创建该文件...");
    fileJson.createSync();
    print("输出文件 booksInfo.json 创建完成！");
  }
  else {
    print("检测到输出文件 booksInfo.json ...");
  }
  // todo 文件输出
  for(var book in booksData){
    fileJson.writeAsStringSync("${jsonEncode(book)}\n",mode: FileMode.append, encoding: utf8);
  }
  return 0;
}
