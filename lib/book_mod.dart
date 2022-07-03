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

// 书籍类的声明跟相关功能
class ItemBook {
  String url;
  String title;
  String author;
  String isbn;
  String press;

  ItemBook(
      this.url,
      this.title,
      this.author,
      this.isbn,
      this.press
      );

  Map<String, String> toJson() {
    return {
      "链接": url,
      "标题": title,
      "作者": author,
      "ISBN": isbn,
      "出版社": press
    };
  }

  void out(){
    var map = toJson();
    map.forEach((key, value) {
      print("$key:\t$value");
    });
  }
}