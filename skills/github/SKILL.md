---
name: github
description: "GitHub深度集成工具 - 管理PR、Issue、代码审查、仓库操作"
trigger_keywords: "GitHub、Pull Request、Issue管理、代码审查、提交记录、仓库操作、PR审查、创建Issue"
auto_activate: true
priority: 3
---

# MCP GitHub - GitHub集成工具

## 直接触发指令

当用户请求以下内容时自动激活此技能：
- "查看PR"
- "创建Issue"
- "审查代码"
- "管理GitHub"
- "提交代码"
- "查看提交记录"

## 功能

与GitHub深度集成，处理Pull Requests、Issue搜索和代码审查。

## 使用场景

- 查看和管理Pull Requests
- 搜索Issue和PR
- 提交代码审查评论
- 创建和管理Issue
- 查看提交历史
- 操作文件和目录

## 使用方法

在Solo模式下直接请求：

```
List all open pull requests in my repository
```

```
Search for issues labeled "bug" in the repository
```

```
Review this pull request #123
```

```
Create a new issue for the bug
```

```
Show me the recent commits
```

## 工具说明

- **list_pull_requests**: 列出PR
- **get_pull_request**: 获取PR详情
- **create_pull_request_review**: 创建PR审查
- **search_issues**: 搜索Issue
- **create_issue**: 创建Issue
- **list_commits**: 列出提交
- **get_file_content**: 获取文件内容
- **create_or_update_file**: 创建或更新文件

## ⚠️ 必需配置

需要GitHub Personal Access Token：

1. 访问 [GitHub Settings > Developer settings > Personal access tokens](https://github.com/settings/tokens)
2. 生成新Token（需要repo和workflow权限）
3. 在MCP配置中设置 `GITHUB_PERSONAL_ACCESS_TOKEN` 环境变量

## 使用前提

- GitHub Token需要相应的仓库权限
- 私有仓库需要repo权限
- Issue操作需要public_repo或repo权限
