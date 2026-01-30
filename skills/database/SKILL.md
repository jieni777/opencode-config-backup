---
name: database
description: "PostgreSQL/MySQL数据库连接工具 - 执行SQL查询、查看表结构、管理数据"
trigger_keywords: "数据库查询、SQL执行、表结构查看、PostgreSQL、MySQL、数据管理、数据库连接"
auto_activate: true
priority: 3
---

# MCP PostgreSQL - 数据库工具

## 直接触发指令

当用户请求以下内容时自动激活此技能：
- "查询数据库"
- "查看表结构"
- "执行SQL语句"
- "连接数据库"
- "查看数据内容"

## 功能

连接和查询PostgreSQL/MySQL数据库，查看表结构和运行查询。

## 使用场景

- 查看数据库表结构
- 执行SELECT查询
- 插入、更新、删除数据
- 查看数据库Schema
- 运行测试查询

## 使用方法

在Solo模式下直接请求：

```
Show me all tables in the database
```

```
Describe the users table structure
```

```
Run a query to count users by status
```

```
Get the last 10 orders from the database
```

## 工具说明

- **list_tables**: 列出所有表
- **describe_table**: 查看表结构
- **execute_query**: 执行SQL查询
- **execute_transaction**: 执行事务

## ⚠️ 必需配置

需要数据库连接字符串：

```bash
trae --add-mcp '{"name":"postgres","command":"npx","args":["-y","@modelcontextprotocol/server-postgres"],"env":{"POSTGRES_CONNECTION_STRING":"postgresql://user:password@localhost:5432/database"}}'
```

连接字符串格式：
- PostgreSQL: `postgresql://user:pass@host:port/dbname`
- MySQL: `mysql://user:pass@host:port/dbname`

## 安全建议

- 使用只读用户执行查询
- 避免在生产数据库上直接执行UPDATE/DELETE
- 敏感数据需要脱敏处理
