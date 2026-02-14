import re
import os
from typing import List, Tuple

class MySQLToPostgreSQLConverter:
    def __init__(self):
        self.table_count = 0  # 统计转换的表数量
        self.success_count = 0  # 成功转换的语句数
        self.failed_count = 0  # 转换失败的语句数
        self.processed_tables = set()  # 去重存储已转换的表名

    def convert_line(self, line: str) -> Tuple[str, bool]:
        """转换单条MySQL语句为PostgreSQL语句"""
        line = line.strip()
        if not line or line.startswith('--') or line.startswith('#'):
            return line, True  # 跳过注释和空行

        # 处理INSERT语句
        if line.upper().startswith('INSERT INTO'):
            table_match = re.search(r'INSERT INTO\s+["`]?(\w+)["`]?', line, re.IGNORECASE)
            if table_match:
                table_name = table_match.group(1)
                self.processed_tables.add(table_name)
                # 替换反引号为双引号
                converted_line = re.sub(r'`', '"', line)
                # 处理VALUES中的字符串引号
                converted_line = re.sub(r"\\'", "''", converted_line)
                return converted_line, True
            else:
                self.failed_count += 1
                return line, False

        # 处理CREATE TABLE语句
        elif line.upper().startswith('CREATE TABLE'):
            table_match = re.search(r'CREATE TABLE\s+["`]?(\w+)["`]?', line, re.IGNORECASE)
            if table_match:
                table_name = table_match.group(1)
                self.processed_tables.add(table_name)
                # 替换反引号为双引号
                converted_line = re.sub(r'`', '"', line)
                
                # 第一轮：移除表级别的MySQL特有语法
                converted_line = re.sub(r'\s+ENGINE\s*=\s*\w+', ' ', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\s+DEFAULT\s+CHARSET\s*=\s*\w+', ' ', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\s+CHARSET\s*=\s*\w+', ' ', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\s+COLLATE\s*=\s*[\w_]+', ' ', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\s+CHARACTER\s+SET\s*=\s*\w+', ' ', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\s+ROW_FORMAT\s*=\s*\w+', ' ', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\s+COMMENT\s*=\s*(["\'][^"\']*["\'])', ' ', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\s+USING\s+BTREE', ' ', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\s+AUTO_INCREMENT\s*=\s*\d*', ' ', converted_line, flags=re.IGNORECASE)
                
                # 第二轮：移除字段级别的MySQL特有语法
                converted_line = re.sub(r'\s+CHARACTER\s+SET\s+\w+', ' ', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\s+COLLATE\s+[\w_]+', ' ', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\s+COMMENT\s+(["\'][^"\']*["\'])', ' ', converted_line, flags=re.IGNORECASE)
                
                # 第三轮：特别处理字段定义中的字符集和排序规则（更精确的匹配）
                # 匹配字段名后的CHARACTER SET和COLLATE
                converted_line = re.sub(r'(\"[^\"]+\"\s+[^,)]*?)\s+CHARACTER\s+SET\s+\w+', r'\1', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'(\"[^\"]+\"\s+[^,)]*?)\s+COLLATE\s+[\w_]+', r'\1', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'(\"[^\"]+\"\s+[^,)]*?)\s+COMMENT\s+(["\'][^"\']*["\'])', r'\1', converted_line, flags=re.IGNORECASE)

                # 处理字段类型差异
                converted_line = re.sub(r'\bINT\((\d+)\)', 'INTEGER', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\bTINYINT\((\d+)\)', 'SMALLINT', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\bSMALLINT\((\d+)\)', 'SMALLINT', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\bMEDIUMINT\((\d+)\)', 'INTEGER', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\bBIGINT\((\d+)\)', 'BIGINT', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\bVARCHAR\((\d+)\)', r'VARCHAR(\1)', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\bCHAR\((\d+)\)', r'CHAR(\1)', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\bTEXT', 'TEXT', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\bLONGTEXT', 'TEXT', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\bMEDIUMTEXT', 'TEXT', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\bTINYTEXT', 'TEXT', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\bDATETIME', 'TIMESTAMP', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\bTINYINT\s+UNSIGNED', 'SMALLINT', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\bSMALLINT\s+UNSIGNED', 'INTEGER', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\bMEDIUMINT\s+UNSIGNED', 'BIGINT', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\bINT\s+UNSIGNED', 'BIGINT', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\bBIGINT\s+UNSIGNED', 'DECIMAL(20,0)', converted_line, flags=re.IGNORECASE)

                # 处理默认值语法
                converted_line = re.sub(r"DEFAULT '(.*?)'(?!')", r"DEFAULT '\1'", converted_line)

                # 最终清理：彻底清除所有残留的MySQL语法
                converted_line = re.sub(r'\s+ENGINE\s*=\s*\w+', ' ', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\s+CHARSET\s*=\s*\w+', ' ', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\s+COLLATE\s*=\s*[\w_]+', ' ', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\s+ROW_FORMAT\s*=\s*\w+', ' ', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\s+USING\s+BTREE', ' ', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\s+DEFAULT\s+CHARSET\s*=\s*\w+', ' ', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\s+CHARACTER\s+SET\s*=\s*\w+', ' ', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\s+AUTO_INCREMENT\s*=\s*\d+', ' ', converted_line, flags=re.IGNORECASE)
                
                # 清理字段级别的残留语法
                converted_line = re.sub(r'\s+CHARACTER\s+SET\s+\w+', ' ', converted_line, flags=re.IGNORECASE)
                converted_line = re.sub(r'\s+COLLATE\s+[\w_]+', ' ', converted_line, flags=re.IGNORECASE)
                
                # 清理多余的空格和逗号
                converted_line = re.sub(r'\s+,', ',', converted_line)  # 移除逗号前的空格
                converted_line = re.sub(r'\s+$', '', converted_line)  # 移除行尾空格
                converted_line = re.sub(r'^\s+', '', converted_line)  # 移除行首空格
                converted_line = re.sub(r'\s+', ' ', converted_line)  # 合并多个空格为单个空格
                converted_line = converted_line.strip()
                
                # 特殊处理：清理行末尾多余的空格和括号
                converted_line = converted_line.strip()
                while converted_line.endswith(' )'):
                    converted_line = converted_line[:-2] + ')'
                while converted_line.endswith('  )'):
                    converted_line = converted_line[:-3] + ')'

                return converted_line, True

            else:
                self.failed_count += 1
                return line, False

        # 处理ALTER TABLE语句
        elif line.upper().startswith('ALTER TABLE'):
            table_match = re.search(r'ALTER TABLE\s+["`]?(\w+)["`]?', line, re.IGNORECASE)
            if table_match:
                table_name = table_match.group(1)
                self.processed_tables.add(table_name)
                # 替换反引号为双引号
                converted_line = re.sub(r'`', '"', line)
                # 处理MODIFY COLUMN语法
                converted_line = re.sub(r'MODIFY COLUMN', 'ALTER COLUMN', converted_line, re.IGNORECASE)
                # 处理CHANGE COLUMN语法
                converted_line = re.sub(r'CHANGE COLUMN', 'RENAME COLUMN', converted_line, re.IGNORECASE)
                # 处理ADD COLUMN语法
                converted_line = re.sub(r'ADD COLUMN', 'ADD COLUMN', converted_line, re.IGNORECASE)
                # 处理字段类型
                converted_line = re.sub(r'\bINT\((\d+)\)', 'INTEGER', converted_line, re.IGNORECASE)
                converted_line = re.sub(r'\bVARCHAR\((\d+)\)', r'VARCHAR(\1)', converted_line, re.IGNORECASE)
                return converted_line, True
            else:
                self.failed_count += 1
                return line, False

        # 处理DROP TABLE语句
        elif line.upper().startswith('DROP TABLE'):
            table_match = re.search(r'DROP TABLE\s+["`]?(\w+)["`]?', line, re.IGNORECASE)
            if table_match:
                table_name = table_match.group(1)
                self.processed_tables.add(table_name)
                converted_line = re.sub(r'`', '"', line)
                return converted_line, True
            else:
                self.failed_count += 1
                return line, False

        # 处理其他SQL语句（SELECT, UPDATE, DELETE等）
        else:
            # 替换反引号为双引号
            converted_line = re.sub(r'`', '"', line)
            # 处理字符串中的单引号转义
            converted_line = re.sub(r"\\'", "''", converted_line)
            # 处理默认值
            converted_line = re.sub(r"DEFAULT '(.*?)'(?!')", r"DEFAULT '\1'", converted_line)
            converted_line = re.sub(r'\bDEFAULT\s+NULL\b', '', converted_line, flags=re.IGNORECASE)
            # 移除 USING BTREE
            converted_line = re.sub(r'\s+USING\s+BTREE', '', converted_line, flags=re.IGNORECASE)
            return converted_line, True

    def convert_file(self, input_path: str, output_path: str) -> dict:
        """批量转换文件并输出统计信息"""
        try:
            # 检查输入文件是否存在
            if not os.path.exists(input_path):
                return {"error": f"输入文件 {input_path} 不存在！"}

            with open(input_path, 'r', encoding='utf-8') as f_in, \
                 open(output_path, 'w', encoding='utf-8') as f_out:

                for line in f_in:
                    converted_line, success = self.convert_line(line)
                    f_out.write(converted_line + '\n')
                    if success:
                        self.success_count += 1
                    else:
                        self.failed_count += 1

            self.table_count = len(self.processed_tables)
            all_success = (self.failed_count == 0)
            return {
                "total_tables": self.table_count,
                "total_statements": self.success_count + self.failed_count,
                "success_statements": self.success_count,
                "failed_statements": self.failed_count,
                "all_converted": all_success
            }

        except Exception as e:
            return {"error": str(e)}

# 使用示例
if __name__ == "__main__":
    converter = MySQLToPostgreSQLConverter()
    input_file = "E:\pythonProject\search\mysql_script.sql"
    output_file = "pg_script.sql"

    # 检查输入文件是否存在
    if not os.path.exists(input_file):
        print(f"输入文件 {input_file} 不存在！")
    else:
        result = converter.convert_file(input_file, output_file)
        print("转换结果：")
        print(f"转换表数量：{result.get('total_tables', 0)}")
        print(f"总语句数：{result.get('total_statements', 0)}")
        print(f"成功语句数：{result.get('success_statements', 0)}")
        print(f"失败语句数：{result.get('failed_statements', 0)}")
        print(f"是否全部转换完成：{'是' if result.get('all_converted', False) else '否'}")
