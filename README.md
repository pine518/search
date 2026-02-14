# MySQL到PostgreSQL转换工具

## 功能说明

这是一个Python脚本，用于将MySQL SQL脚本自动转换为PostgreSQL兼容的SQL脚本。

## 支持的转换特性

### 数据类型转换
- `INT(n)` → `INTEGER`
- `TINYINT(n)` → `SMALLINT`
- `SMALLINT(n)` → `SMALLINT`
- `MEDIUMINT(n)` → `INTEGER`
- `BIGINT(n)` → `BIGINT`
- `VARCHAR(n)` → `VARCHAR(n)` (保持不变)
- `CHAR(n)` → `CHAR(n)` (保持不变)
- `TEXT/LONGTEXT/MEDIUMTEXT/TINYTEXT` → `TEXT`
- `DATETIME` → `TIMESTAMP`
- `DATE` → `DATE`
- `TIME` → `TIME`

### MySQL特有语法移除
- 移除 `ENGINE=InnoDB`
- 移除 `DEFAULT CHARSET=utf8`
- 移除 `COLLATE utf8_general_ci`
- 移除 `AUTO_INCREMENT=`
- 移除 `ON UPDATE CURRENT_TIMESTAMP`

### 语法调整
- 反引号 `` ` `` → 双引号 `"`
- 单引号转义 `\'` → `''`
- ALTER TABLE语法适配

## 使用方法

```bash
python mysql2pg.py
```

## 配置说明

在脚本中修改以下变量来指定输入输出文件：

```python
input_file = "path/to/your/mysql_script.sql"  # 输入的MySQL脚本文件
output_file = "postgresql_script.sql"         # 输出的PostgreSQL脚本文件
```

## 转换验证

脚本会自动进行语法验证，检查是否还存在以下MySQL特有语法：
- ENGINE= 语法
- DEFAULT CHARSET= 语法  
- COLLATE 语法
- AUTO_INCREMENT= 语法
- 反引号 ` 字符

## 注意事项

1. 转换后的脚本可能需要人工复查
2. 复杂的存储过程和函数需要手动调整
3. 特殊的MySQL函数可能需要替换为PostgreSQL等效函数
4. 建议在PostgreSQL环境中测试转换后的脚本

## 错误处理

如果转换过程中出现错误，脚本会：
- 统计成功和失败的语句数量
- 显示具体的错误信息
- 提供转换进度报告