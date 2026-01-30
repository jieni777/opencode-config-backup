---
name: filesystem
description: "系统级文件操作工具 - 读取写入文件、批量修改、搜索代码、重构项目"
trigger_keywords: "文件操作、读取文件、写入文件、搜索代码、重构项目、批量修改、创建文件、删除文件"
auto_activate: true
priority: 4
---

# MCP Filesystem - 文件系统工具

## 直接触发指令

当用户请求以下内容时自动激活此技能：
- "读取文件"
- "写入文件"
- "搜索代码"
- "批量修改"
- "创建文件"
- "列出目录"

## 功能

安全地读取、写入、搜索和管理硬盘上的文件。

## 使用场景

- 批量修改项目文件
- 读取配置文件
- 创建新文件
- 搜索项目中的特定代码
- 文件整理和重构

## 使用方法

在Solo模式下直接请求：

```
List all TypeScript files in the project
```

```
Read the package.json file
```

```
Create a new component file at src/components/Button.tsx
```

```
Search for all files containing "useEffect"
```

```
Delete the temporary files in the dist folder
```

## 工具说明

- **read_file**: 读取文件内容
- **read_multiple_files**: 批量读取多个文件
- **write_file**: 创建或修改文件
- **create_directory**: 创建目录
- **list_directory**: 列出目录内容
- **search_files**: 在目录中搜索文件
- **glob**: 使用glob模式搜索文件
- **grep**: 在文件中搜索文本

## 配置

已配置的允许目录：
- `/Users/pro/Documents`

如需访问其他目录，需要在MCP配置中显式添加。
