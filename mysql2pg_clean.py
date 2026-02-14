import re
import os

def clean_mysql_syntax(line):
    """彻底清除MySQL特有语法"""
    # 替换反引号为双引号
    line = re.sub(r'`', '"', line)
    
    # 移除表级别的MySQL特有语法
    line = re.sub(r'\s+ENGINE\s*=\s*\w+', ' ', line, flags=re.IGNORECASE)
    line = re.sub(r'\s+DEFAULT\s+CHARSET\s*=\s*\w+', ' ', line, flags=re.IGNORECASE)
    line = re.sub(r'\s+CHARSET\s*=\s*\w+', ' ', line, flags=re.IGNORECASE)
    line = re.sub(r'\s+COLLATE\s*=\s*[\w_]+', ' ', line, flags=re.IGNORECASE)
    line = re.sub(r'\s+CHARACTER\s+SET\s*=\s*\w+', ' ', line, flags=re.IGNORECASE)
    line = re.sub(r'\s+ROW_FORMAT\s*=\s*\w+', ' ', line, flags=re.IGNORECASE)
    line = re.sub(r'\s+COMMENT\s*=\s*("[^"]*"|\'[^\']*\')', ' ', line, flags=re.IGNORECASE)
    line = re.sub(r'\s+USING\s+BTREE', ' ', line, flags=re.IGNORECASE)
    line = re.sub(r'\s+AUTO_INCREMENT\s*=\s*\d+', ' ', line, flags=re.IGNORECASE)
    
    # 移除字段级别的MySQL特有语法
    line = re.sub(r'\s+CHARACTER\s+SET\s+\w+', ' ', line, flags=re.IGNORECASE)
    line = re.sub(r'\s+COLLATE\s+[\w_]+', ' ', line, flags=re.IGNORECASE)
    line = re.sub(r'\s+COMMENT\s+("[^"]*"|\'[^\']*\')', ' ', line, flags=re.IGNORECASE)
    
    # 处理数据类型转换
    line = re.sub(r'\bint\((\d+)\)', 'INTEGER', line, flags=re.IGNORECASE)
    line = re.sub(r'\btinyint\((\d+)\)', 'SMALLINT', line, flags=re.IGNORECASE)
    line = re.sub(r'\bsmallint\((\d+)\)', 'SMALLINT', line, flags=re.IGNORECASE)
    line = re.sub(r'\bmediumint\((\d+)\)', 'INTEGER', line, flags=re.IGNORECASE)
    line = re.sub(r'\bbigint\((\d+)\)', 'BIGINT', line, flags=re.IGNORECASE)
    line = re.sub(r'\bdatetime\b', 'TIMESTAMP', line, flags=re.IGNORECASE)
    line = re.sub(r'\blongtext\b', 'TEXT', line, flags=re.IGNORECASE)
    line = re.sub(r'\bmediumtext\b', 'TEXT', line, flags=re.IGNORECASE)
    line = re.sub(r'\btinytext\b', 'TEXT', line, flags=re.IGNORECASE)
    line = re.sub(r'\bdouble\b', 'NUMERIC', line, flags=re.IGNORECASE)
    line = re.sub(r'\bblob\b', 'BYTEA', line, flags=re.IGNORECASE)
    # 清理多余空格
    line = re.sub(r'\s+,', ',', line)  # 移除逗号前的空格
    line = re.sub(r'\s+$', '', line)   # 移除行尾空格
    line = re.sub(r'^\s+', '', line)   # 移除行首空格
    line = re.sub(r'\s+', ' ', line)   # 合并多个空格为单个空格
    
    return line.strip()

def convert_mysql_to_pg(input_file, output_file):
    """转换MySQL脚本为PostgreSQL脚本"""
    try:
        with open(input_file, 'r', encoding='utf-8') as f_in, \
             open(output_file, 'w', encoding='utf-8') as f_out:
            
            for line in f_in:
                cleaned_line = clean_mysql_syntax(line)
                f_out.write(cleaned_line + '\n')
        
        print(f"转换完成！输出文件：{output_file}")
        return True
        
    except Exception as e:
        print(f"转换失败：{str(e)}")
        return False

if __name__ == "__main__":
    input_file = "E:\\pythonProject\\search\\mysql_script.sql"
    output_file = "E:\\pythonProject\\search\\pg_script.sql"
    
    if os.path.exists(input_file):
        convert_mysql_to_pg(input_file, output_file)
    else:
        print(f"输入文件不存在：{input_file}")