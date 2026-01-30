---
name: terminal
description: "终端命令执行工具 - 运行npm命令、执行脚本、操作Docker、管理项目依赖"
trigger_keywords: "终端执行、运行命令、npm安装、docker-compose、脚本执行、构建项目、测试运行"
auto_activate: true
priority: 4
---

# MCP Shell - 终端执行工具

## 直接触发指令

当用户请求以下内容时自动激活此技能：
- "运行npm install"
- "执行命令"
- "启动Docker"
- "运行测试"
- "构建项目"
- "执行脚本"

## 功能

直接在Trae的终端中执行命令，支持npm、docker、测试等操作。

## 使用场景

- 安装依赖：`npm install`
- 启动服务：`docker-compose up`
- 运行测试：`npm test`
- 构建项目：`npm run build`
- 执行脚本：`sh deploy.sh`

## 使用方法

在Solo模式下直接请求：

```
Run npm install to install dependencies
```

```
Start the database with docker-compose up
```

```
Execute the unit tests for this project
```

```
Build the production version
```

```
Run the linter to check code quality
```

## 工具说明

- **run_command**: 执行单个命令
- **run_command_with_input**: 执行需要用户输入的命令

## ⚠️ 安全提示

- 此工具可以执行任意系统命令
- 请确保您信任执行的命令
- 避免执行可能造成损害的命令（如rm -rf）

## 配置

默认命令超时：60秒

如需修改超时时间，可以在MCP配置中调整。
