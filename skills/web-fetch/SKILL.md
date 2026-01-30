---
name: web-fetch
description: "实时网络信息获取工具 - 搜索技术文档、抓取网页内容、获取API定义"
trigger_keywords: "联网搜索、获取文档、抓取网页、在线资料、API文档、搜索网页、浏览器搜索"
auto_activate: true
priority: 4
---

# MCP Fetch - 联网搜索工具

## 直接触发指令

当用户请求以下内容时自动激活此技能：
- "搜索XXX"
- "获取XXX的文档"
- "抓取网页内容"
- "从URL获取信息"
- "查找在线资料"
- "浏览网页"

## 功能

抓取和处理网页内容，供AI助手实时获取在线信息。

## 使用场景

- 获取最新技术文档
- 搜索在线参考资料
- 抓取网页内容进行分析
- 实时获取API文档

## 使用方法

在Solo模式下直接请求：

```
Fetch the latest React documentation from https://react.dev/
```

```
Search for "Trae IDE MCP configuration" on the web
```

```
Get the content of this URL: https://example.com
```

## 工具说明

- **fetch**: 抓取指定URL的网页内容
- **search**: 搜索网页内容（如果配置了搜索引擎API）

## 配置

此工具无需额外配置即可抓取公开网页。

如需使用搜索功能，需要配置搜索引擎API密钥。
