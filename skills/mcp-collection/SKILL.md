---
name: mcp-collection
description: "MCP工具箱合集 - 包含联网搜索、文件操作、终端执行、GitHub集成、数据库连接、API测试、文档转换、记忆增强、知识库检索"
trigger_keywords: "MCP工具箱、安装配置、10个技能合集、工具集成、快速开始"
auto_activate: false
priority: 1
---

# MCP Skills 合集

## 直接触发指令

当用户请求以下内容时自动激活此技能：
- "安装所有MCP服务器"
- "配置MCP工具"
- "查看所有可用工具"
- "初始化MCP环境"

## 简介

本合集包含10个MCP（Model Context Protocol）服务器，为Trae IDE提供强大的扩展能力。

## 包含的技能

| # | 技能名称 | 功能 | 必要性 |
|---|---------|------|-------|
| 1 | [mcp-fetch](mcp-fetch/) | 联网搜索和网页抓取 | ⭐⭐⭐⭐⭐ |
| 2 | [mcp-filesystem](mcp-filesystem/) | 系统级文件操作 | ⭐⭐⭐⭐ |
| 3 | [mcp-shell](mcp-shell/) | 终端命令执行 | ⭐⭐⭐⭐⭐ |
| 4 | [mcp-github](mcp-github/) | GitHub深度集成 | ⭐⭐⭐⭐ |
| 5 | [mcp-postgres](mcp-postgres/) | PostgreSQL数据库连接 | ⭐⭐⭐ |
| 6 | [mcp-composio](mcp-composio/) | 万能工具箱(100+软件) | ⭐⭐⭐⭐ |
| 7 | [mcp-postman](mcp-postman/) | Postman API测试 | ⭐⭐⭐ |
| 8 | [mcp-markitdown](mcp-markitdown/) | Office文档转Markdown | ⭐⭐⭐ |
| 9 | [mcp-mem0](mcp-mem0/) | AI长期记忆 | ⭐⭐⭐⭐ |
| 10 | [mcp-ragflow](mcp-ragflow/) | 知识库RAG检索 | ⭐⭐⭐⭐⭐ |

## 快速开始

### 安装所有MCP服务器

```bash
cd /Users/pro/Documents/code
node install-mcp-skills.js
```

### 重启Trae IDE

安装完成后，重启Trae IDE使配置生效。

## 使用方法

在Trae Solo模式下，直接用自然语言描述您的需求：

```
Fetch the latest React documentation
```

```
Create a new component file
```

```
Run npm install
```

```
Create a Jira issue for this bug
```

```
Search the knowledge base for authentication
```

## 配置要求

### 必需API密钥的服务

| 服务 | 获取方式 | 用途 |
|-----|---------|------|
| GitHub | [GitHub Settings](https://github.com/settings/tokens) | PR、Issue管理 |
| Composio | [Composio官网](https://composio.dev/) | 第三方软件集成 |
| Postman | [Postman API Keys](https://postman.com/settings/api-keys) | API测试 |
| Mem0 | [Mem0官网](https://mem0.ai/) | 长期记忆 |
| RagFlow | [RagFlow部署](https://github.com/infiniflow/ragflow) | 知识库检索 |

### 数据库连接

PostgreSQL需要有效的连接字符串：
```
postgresql://user:password@localhost:5432/database
```

## 文件结构

```
.trae/
├── skills/
│   ├── mcp-fetch/          # 联网搜索
│   ├── mcp-filesystem/     # 文件系统
│   ├── mcp-shell/          # 终端执行
│   ├── mcp-github/         # GitHub集成
│   ├── mcp-postgres/       # 数据库连接
│   ├── mcp-composio/       # 万能工具箱
│   ├── mcp-postman/        # API测试
│   ├── mcp-markitdown/     # 文档转换
│   ├── mcp-mem0/           # 记忆外挂
│   └── mcp-ragflow/        # 知识库
├── rules/
│   └── mcp-skills.rules    # 通用规则
├── mcp-servers.json        # MCP服务器配置
└── mcp.json                # Trae MCP配置
```

## 文档

- [完整使用指南](../TRAE_MCP_SKILLS_README.md)
- [安装脚本](../install-mcp-skills.js)

## 常见问题

### Q: 如何禁用某个MCP服务器？
A: 编辑`.trae/mcp.json`，将对应服务器的`disabled`设为`true`。

### Q: 为什么有些功能无法使用？
A: 检查是否配置了所需的API密钥。

### Q: 如何更新MCP服务器？
A: 重新运行安装脚本或手动更新npm包。

## 反馈

如有问题或建议，请查看各个技能的详细文档。
