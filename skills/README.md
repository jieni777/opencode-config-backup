# OpenCode Skills 安装指南

## 📦 已安装的 Antigravity Skills

本目录包含从 antigravity-awesome-skills 精选的 **29个核心技能**，专门提升：

1. **LLM代码能力和上下文理解**
2. **跨会话任务衔接（记忆持久化）**
3. **安全开发**
4. **后端开发能力与规范**

---

## 🎯 技能分类

### 1. 上下文和记忆管理（解决跨会话衔接）

| 技能名称 | 功能 |
|----------|------|
| `context-manager` | 动态上下文管理、向量数据库、知识图谱 |
| `context-management-context-save` | 保存当前上下文状态 |
| `context-management-context-restore` | 恢复之前保存的上下文 |
| `context-window-management` | 上下文窗口优化和Token预算管理 |
| `context-driven-development` | 上下文驱动开发模式 |
| `code-refactoring-context-restore` | 重构时恢复代码上下文 |
| `agent-memory-mcp` | Agent内存系统（MCP工具） |
| `agent-memory-systems` | Agent长期记忆系统架构 |
| `conversation-memory` | 对话记忆管理 |

### 2. 后端开发规范和能力

| 技能名称 | 功能 |
|----------|------|
| `backend-architect` | 后端架构设计模式 |
| `backend-dev-guidelines` | 后端开发规范（Node.js/TS） |
| `async-python-patterns` | Python异步编程模式 |
| `fastapi-pro` | FastAPI专业开发 |
| `fastapi-templates` | FastAPI项目模板 |
| `python-pro` | Python 3.12+专业开发 |
| `python-patterns` | Python设计模式 |
| `python-testing-patterns` | Python测试模式 |
| `python-performance-optimization` | Python性能优化 |
| `api-patterns` | API设计最佳实践 |
| `api-design-principles` | API设计原则 |
| `clean-code` | 清洁代码规范 |
| `code-review-checklist` | 代码审查清单 |
| `code-review-excellence` | 高效代码审查 |

### 3. 安全开发

| 技能名称 | 功能 |
|----------|------|
| `api-security-best-practices` | API安全最佳实践 |
| `backend-security-coder` | 后端安全编码 |
| `security-auditor` | 安全审计流程 |
| `security-requirement-extraction` | 安全需求提取 |
| `production-code-audit` | 生产代码审计 |

---

## 🚀 使用方法

### 基础用法

在OpenCode中直接调用技能：

```
使用 @context-manager 帮助我管理这个项目的上下文
运行 @context-management-context-save 保存当前进度
用 @fastapi-pro 帮我设计这个API
使用 @api-security-best-practices 检查这个接口的安全性
```

### 上下文保存和恢复（跨会话衔接）

**会话开始时：**
```
请使用 @context-management-context-restore 恢复我上一个项目的上下文
```

**工作过程中：**
```
使用 @context-management-context-save 保存当前进度到项目X
```

**会话结束时：**
```
使用 @conversation-memory 总结本次会话的关键信息
```

### 后端开发流程

1. **开始前**：参考 `backend-dev-guidelines` 的BFRI评估表
2. **开发中**：使用 `python-pro` 和 `fastapi-pro` 指导编码
3. **审查时**：运行 `code-review-excellence` 进行检查
4. **上线前**：使用 `api-security-best-practices` 安全审计

---

## 📚 推荐工作流

### KanMengou项目开发流程

```markdown
1. 启动项目
   → 使用 @context-manager 建立项目记忆
   → 用 @backend-architect 设计整体架构

2. 开发新功能
   → 参考 @backend-dev-guidelines 的分层架构
   → 使用 @fastapi-pro 编写API
   → 用 @python-testing-patterns 编写测试

3. 代码审查
   → 运行 @code-review-checklist
   → 使用 @clean-code 检查代码质量

4. 安全检查
   → 使用 @api-security-best-practices
   → 运行 @security-auditor 进行审计

5. 保存进度
   → 使用 @context-management-context-save
   → 用 @conversation-memory 记录关键决策
```

---

## 🎓 学习建议

1. **优先阅读**：`context-manager` - 理解上下文工程
2. **开发参考**：`backend-dev-guidelines` - 遵循开发规范
3. **Python专家**：`python-pro` - 掌握现代Python
4. **安全第一**：`api-security-best-practices` - 安全开发

---

## 📖 详细文档

每个技能目录下都有详细的 `SKILL.md` 和 `resources/` 目录，包含：

- 最佳实践指南
- 代码示例
- 实施手册
- 检查清单

---

## 🔗 参考资源

- 原始仓库：https://github.com/sickn33/antigravity-awesome-skills
- 技能索引：CATALOG.md
- 技能包：BUNDLES.md

---

**维护**：当 antigravity-awesome-skills 更新时，可重新运行安装脚本同步最新技能。
