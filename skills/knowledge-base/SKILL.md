---
name: knowledge-base
description: "RAG知识库增强工具 - 检索PDF文档、搜索项目代码、查询技术资料"
trigger_keywords: "知识库检索、PDF搜索、文档查询、代码检索、RAG检索、语义搜索、技术文档查询"
auto_activate: true
priority: 4
---

# MCP RagFlow - 知识库检索工具

## 直接触发指令

当用户请求以下内容时自动激活此技能：
- "搜索知识库"
- "查询文档"
- "检索PDF"
- "搜索代码"
- "查找相关资料"
- "RAG搜索"

## 功能

让AI能够"阅读"您电脑里的PDF参考文档或旧项目代码，进行RAG检索增强。

## 特点

- **PDF解析**: 高精度解析PDF文档
- **代码理解**: 理解项目代码结构
- **语义搜索**: 基于语义的智能检索
- **上下文增强**: 为AI提供相关背景知识

## 使用场景

- 大型项目重构时理解旧代码
- 查阅PDF技术文档
- 检索产品需求文档
- 分析API文档
- 跨项目知识整合

## 使用方法

在Solo模式下直接请求：

```
Search the knowledge base for "authentication implementation"
```

```
What does the API documentation say about rate limiting?
```

```
Find the relevant code for user authorization
```

```
Explain the database schema from the documentation
```

```
Search for all mentions of "security" in the docs
```

## 工具说明

- **search**: 语义搜索知识库
- **get_documents**: 获取相关文档
- **list_collections**: 列出知识库集合
- **add_document**: 添加文档到知识库

## RagFlow是什么？

RagFlow是一个开源的RAG（检索增强生成）引擎，专门用于：
- 文档解析和预处理
- 语义分块
- 向量化存储
- 智能检索

## ⚠️ 必需配置 - RagFlow自建（推荐）

RagFlow是开源项目，可以免费自建。以下是Docker部署步骤：

### 1. 系统要求

- Docker Engine 24.0+
- Docker Compose v2.20+
- 4GB+ 可用内存
- 10GB+ 磁盘空间

### 2. 快速部署（3步完成）

```bash
# 步骤1: 克隆仓库
git clone https://github.com/infiniflow/ragflow.git
cd ragflow

# 步骤2: 配置Docker（如果需要）
# 编辑 docker-compose.yml 修改端口映射

# 步骤3: 启动服务
docker-compose up -d
```

### 3. 验证部署

```bash
# 检查服务状态
docker-compose ps

# 查看日志
docker-compose logs -f ragflow-server

# 测试API
curl http://localhost:9380/health
```

### 4. 默认配置

- **API服务端点**: http://localhost:9380
- **Web界面**: http://localhost:7000
- **默认端口**: 9380 (API), 7000 (Web)

### 5. 配置Trae连接

在MCP配置中已设置：

```bash
RAGFLOW_API_URL: "http://localhost:9380"
```

### 6. 使用流程

1. **访问Web界面**: 打开 http://localhost:7000
2. **创建知识库**: 点击"Create Knowledge Base"
3. **上传文档**: 上传PDF、Word、Markdown等文档
4. **配置分块策略**: 选择合适的文档切分方式
5. **开始索引**: 系统自动处理和索引文档
6. **开始使用**: 在Trae中发起检索请求

### 7. 故障排除

#### 服务无法启动
```bash
# 检查Docker状态
docker info

# 查看详细错误
docker-compose logs

# 重新构建
docker-compose down
docker-compose up -d --build
```

#### API连接失败
```bash
# 确认服务运行
curl http://localhost:9380/health

# 检查端口占用
lsof -i :9380

# 查看防火墙设置
sudo ufw status
```

#### 文档索引失败
- 检查文档格式是否支持
- 确认文件大小限制（默认50MB）
- 查看索引日志排查具体错误

### 8. 高级配置

#### 自定义端口
编辑 `docker-compose.yml`:
```yaml
services:
  ragflow-server:
    ports:
      - "9380:9380"  # 改为自定义端口
```

#### 增加资源限制
```yaml
services:
  ragflow-server:
    deploy:
      resources:
        limits:
          memory: 8G
```

### 9. 生产环境部署

#### 使用Docker Swarm
```bash
docker stack deploy -c docker-compose.yml ragflow
```

#### 配置HTTPS
使用Nginx反向代理：
```nginx
server {
    listen 443 ssl;
    server_name your-domain.com;

    location / {
        proxy_pass http://localhost:9380;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

### 10. 备份和恢复

```bash
# 备份数据
docker cp ragflow-server:/app/data ./backup/

# 恢复数据
docker cp ./backup/ ragflow-server:/app/data/
```

## 与Mem0结合使用

Mem0和RagFlow可以配合使用：

1. **Mem0**: 记住搜索过的内容和偏好
2. **RagFlow**: 提供准确的文档检索
3. **效果**: AI既记得您问过什么，又能找到准确的文档

## 性能优化

### 索引优化
- 使用合适的分块大小
- 启用并行处理
- 定期清理旧索引

### 查询优化
- 使用精确的关键词
- 尝试不同的表述
- 组合多个搜索

## 替代方案

如果不想自建，可以使用云服务：
- **Pinecone** (云端向量数据库)
- **Weaviate** (自建或云端)
- **Qdrant** (自建或云端)

但自建RagFlow是最经济、最可控的方案。

## 资源链接

- **GitHub**: https://github.com/infiniflow/ragflow
- **文档**: https://ragflow.io/docs
- **Docker Hub**: https://hub.docker.com/r/infiniflow/ragflow
- **社区**: https://github.com/infiniflow/ragflow/discussions

## 配置检查清单

- [ ] Docker和Docker Compose已安装
- [ ] 端口9380未被占用
- [ ] 服务已成功启动
- [ ] API健康检查通过
- [ ] 已创建知识库
- [ ] 已上传测试文档
- [ ] 索引完成
- [ ] 在Trae中测试检索功能
