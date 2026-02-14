#!/usr/bin/env python
# -*- coding utf-8 -*-
"""
@Time :2026/2/4 09:26
@Author : pine
@File :base.py
"""
from shlex import quote

import requests


class BaseSearchProvider:
    def __init__(self,provider_url):
        self.provider_url = provider_url
        self.headers= {
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36",
            "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
            "Accept-Encoding": "gzip, deflate, br",
            "Accept-Language": "zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6",
            "Connection": "keep-alive",
            "Upgrade-Insecure-Requests": "1",
            "Cache-Control": "max-age=0",
            "Pragma": "no-cache",
            "Sec-Fetch-Dest": "document",
            "Sec-Fetch-Mode": "navigate",
            "Sec-Fetch-Site": "none",
            "Sec-Fetch-User": "?1",
        }
    def search(self,query,max_results=10,content_limit=None):
        if not query.strip():
            raise ValueError("Search Query cannot be empty")
        #构建搜索URL
        cleaned_query = query.split('\r\n')[1] if '\r\n' in query else query
        url = self.provider_url.replace('%s',quote(cleaned_query))

        #发起请求
        response=requests.get(url,headers=self.headers,timeout=30)
        response.raise_for_status()

        #处理编码和解压缩
        html_content = self._process_response(response)
        #解析搜索结果
        search_items=self.parse_valid_urls(html_content)

        if max_results and max_results > 0:
            search_items = search_items[:max_results]
        valid_items=[item for item in search_items if item.url.startwith('http')]

    def _process_response(self,response):
        """处理响应，尝试多种方法解析内容"""
        pass
    def parse_valid_urls(self,html_content):
        """解析有效的url"""
        raise NotImplementedError("Subclasses must implement parse_valid_urls")

    def fetch_content(self,url):
        """从url中获取内容"""
        pass