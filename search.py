#!/usr/bin/env python
# -*- coding utf-8 -*-
"""
@Time :2026/2/4 09:25
@Author : pine
@File :search.py
"""
import sys

def main():
    # python search.py <query> <engine>
    # python search.py "python3.12 新特性" baidu
    if len(sys.argv) <2:
        print("本脚本需要传递一个查询参数：Usage: python search.py <query> <engine>")
        print("目前支持的搜索引擎：baidu, google")
        return
    query=sys.argv[1]
    engine=sys.argv[2] if len(sys.argv)>2 else baidu

    print("hello world")

if __name__ == '__main__':
    main()