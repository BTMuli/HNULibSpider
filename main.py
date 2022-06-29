"""
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
"""

# 爬取 湖大图书馆 数据并写入 booksInfo.json
# 内置包
import json
from time import sleep
# 导入包
from selenium import webdriver
from selenium.webdriver.common.by import By


# 类定义
class Book:
    title = ''
    author = ''
    ISBN = ''
    PR = ''

    def __init__(self, t=None, a=None, i=None, p=None):
        if t is not None:
            self.title = t
        if a is not None:
            self.author = a
        if i is not None:
            self.ISBN = i
        if p is not None:
            self.PR = p

    def out(self):
        for name, value in vars(self).items():
            if value != '':
                print('%s: %s' % (name, value))


# 四位数
def getBooks(start, end):
    data: dict
    bookList = []
    url = 'https://opac.hnu.edu.cn/opac/book/200001'
    print("开始爬取数据...")
    for i in range(start, end):
        a = "%04d" % i
        url_b = url + a
        res = getBook(url_b, i)
        bookList.append(res)
    successBook = len(bookList)
    log = "\n爬取完成，共爬取 {0} 次，成功爬取 {1} 本图书\n".format(end - start, successBook)
    print(log)
    return bookList


# 简单封装一下
def getXpath(xpath):
    return browser.find_element(by=By.XPATH, value=xpath)


def getBook(url, i):
    out_num = "\n正在爬取第 {0} 本图书...\n".format(str(i))
    print(out_num)
    browser.get(url)
    sleep(2)
    # Xpath 定位跟数据获取
    title = getXpath('//*[@id="bookInfoTable"]/tbody//tr[@data-sort="40"]/td[2]/a').text
    author = getXpath('//*[@id="bookInfoTable"]/tbody//tr[@data-sort="40"]/td[2]').text
    if "/ " in author:
        author = author.split("/ ")[1]
    ISBN = getXpath('//*[@id="bookInfoTable"]/tbody/tr[@data-sort="10"]/td[2]').text.split(" ")[0]
    PR = getXpath('//*[@id="bookInfoTable"]/tbody//tr[@data-sort="50"]/td[2]/a').text
    book = Book(title, author, ISBN, PR)
    book.out()
    return book.__dict__


if __name__ == "__main__":
    # 浏览器初始化，用 Chrome
    chromePath = 'lib/chromedriver.exe'
    browser = webdriver.Chrome(executable_path=chromePath)
    # 文件
    with open('out/booksInfo.json', "a", encoding='utf-8') as outFile:
        # 程序主体
        booksData = getBooks(0, 5)
        json.dump(booksData, outFile, ensure_ascii=False, indent=4)
        outFile.close()
    # 关闭
    browser.close()
