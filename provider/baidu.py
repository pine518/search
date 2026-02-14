#!/usr/bin/env python
# -*- coding utf-8 -*-
"""
@Time :2026/2/4 09:26
@Author : pine
@File :baidu.py
"""
from provider.base import BaseSearchProvider


class BaiduSearchProvider(BaseSearchProvider):
    def __init__(self):
        self.provider_url = "https://www.baidu.com/s?wd=%s"
        super().__init__(self.provider_url)

    def parse_valid_urls(self,html_content):
        """解析有效的url"""
        pass