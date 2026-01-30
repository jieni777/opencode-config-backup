---
name: api-testing
description: "Postman API测试工具 - 发送HTTP请求、测试API端点、验证响应"
trigger_keywords: "API测试、HTTP请求、POST请求、GET请求、API端点、请求测试、响应验证、API调试"
auto_activate: true
priority: 3
---

# MCP Postman - API测试工具

## 直接触发指令

当用户请求以下内容时自动激活此技能：
- "测试API"
- "发送HTTP请求"
- "验证API响应"
- "调试接口"
- "检查端点"
- "API集成测试"

## 功能

在Trae中直接触发API请求并获取响应，自动根据API返回结果修正前端调用逻辑。

## 使用场景

- 测试REST API端点
- 验证POST请求
- 检查响应状态码
- 调试API集成
- 自动化API测试

## 使用方法

在Solo模式下直接请求：

```
Test the GET /api/users endpoint
```

```
Send a POST request to /api/users with this JSON payload
```

```
Check if the /api/health endpoint returns 200
```

```
Run a collection of API tests
```

## 工具说明

- **api_call**: 执行HTTP请求
- **get_collection**: 获取Postman集合
- **run_collection**: 运行测试集合
- **get_environment**: 获取环境变量

## ⚠️ 必需配置

需要Postman API Key：

1. 访问 [Postman API Keys](https://postman.com/settings/api-keys) 获取Key
2. 配置：

```bash
trae --add-mcp '{"name":"postman","command":"npx","args":["-y","@postman/mcp-server-postman"],"env":{"POSTMAN_API_KEY":"your-api-key"}}'
```

## 使用示例

### 测试GET请求
```
GET https://api.example.com/users
Accept: application/json
```

### 测试POST请求
```
POST https://api.example.com/users
Content-Type: application/json

{
  "name": "John Doe",
  "email": "john@example.com"
}
```

### 验证响应
```
Verify the response status is 200
Verify response contains "id" field
```

## 最佳实践

- 使用环境变量管理不同环境的URL
- 保存常用请求为Collection
- 编写测试断言验证响应
