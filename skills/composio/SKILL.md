---
name: composio
description: "第三方软件集成工具箱 - 连接Slack、Jira、Linear、GitHub等100+平台"
trigger_keywords: "Slack通知、Jira任务管理、Linear同步、第三方集成、100+平台、工具连接、Notion同步"
auto_activate: true
priority: 3
---

# MCP Composio - 万能工具箱

## 直接触发指令

当用户请求以下内容时自动激活此技能：
- "发送Slack消息"
- "创建Jira Issue"
- "同步Linear任务"
- "连接第三方软件"
- "管理Notion"
- "集成GitHub"

## 功能

一个技能连接Slack、Jira、Linear、GitHub等100+第三方软件。

## 支持的平台

- **协作工具**: Slack, Discord, Teams
- **项目管理**: Jira, Linear, Asana, Trello
- **开发工具**: GitHub, GitLab, Bitbucket
- **文档工具**: Notion, Confluence, Google Docs
- **数据库**: Airtable, Supabase
- **更多**: 100+平台

## 使用场景

- 在Slack中发送消息
- 创建Jira Issue
- 更新Linear任务
- 管理GitHub PR
- 同步Notion文档

## 使用方法

在Solo模式下直接请求：

```
Send a message to the #engineering channel on Slack
```

```
Create a new Jira issue for this bug
```

```
Update the status of task PROJ-123 to Done
```

```
Add a comment to GitHub PR #456
```

## ⚠️ 必需配置

需要Composio API Key：

1. 访问 [Composio官网](https://composio.dev/) 注册账号
2. 获取API Key
3. 配置：

```bash
trae --add-mcp '{"name":"composio","command":"npx","args":["-y","composio-mcp"],"env":{"COMPOSIO_API_KEY":"your-api-key"}}'
```

## 集成平台

首次使用需要授权每个平台：
```bash
# 授权GitHub
composio add github

# 授权Slack
composio add slack

# 查看所有已授权应用
composio apps
```

## 示例场景

### Slack通知
```
Post a message to Slack: "Deployment completed successfully"
```

### Jira任务管理
```
Create a high-priority bug in Jira with title "Login fails on Safari"
```

### Linear同步
```
Update the state of issue ENG-456 to Done
```
