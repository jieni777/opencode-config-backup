# 🚀 快速参考卡

## 核心需求 → 对应技能

### 1. LLM代码能力和上下文理解

| 需求 | 技能 | 调用方式 |
|------|------|----------|
| 管理上下文 | `context-manager` | `@context-manager` |
| 优化Token使用 | `context-window-management` | `@context-window-management` |
| 上下文驱动开发 | `context-driven-development` | `@context-driven-development` |

### 2. 跨会话任务衔接（重点！）

| 需求 | 技能 | 调用方式 |
|------|------|----------|
| **保存进度** | `context-management-context-save` | `@context-management-context-save` |
| **恢复进度** | `context-management-context-restore` | `@context-management-context-restore` |
| 建立长期记忆 | `agent-memory-systems` | `@agent-memory-systems` |
| 对话总结 | `conversation-memory` | `@conversation-memory` |

### 3. 安全开发

| 需求 | 技能 | 调用方式 |
|------|------|----------|
| API安全 | `api-security-best-practices` | `@api-security-best-practices` |
| 后端安全 | `backend-security-coder` | `@backend-security-coder` |
| 安全审计 | `security-auditor` | `@security-auditor` |
| 上线前检查 | `production-code-audit` | `@production-code-audit` |

### 4. 后端开发规范

| 需求 | 技能 | 调用方式 |
|------|------|----------|
| 架构设计 | `backend-architect` | `@backend-architect` |
| 开发规范 | `backend-dev-guidelines` | `@backend-dev-guidelines` |
| Python开发 | `python-pro` | `@python-pro` |
| FastAPI开发 | `fastapi-pro` | `@fastapi-pro` |
| 代码审查 | `code-review-excellence` | `@code-review-excellence` |

---

## 💬 对话示例

### 场景1：开始新会话，恢复之前的进度

```
请使用 @context-management-context-restore 恢复 KanMengou 项目上次的进度
```

### 场景2：开发过程中保存进度

```
我需要暂停工作了，请使用 @context-management-context-save 保存当前进度
保存关键信息：完成了Telegram Bot的群组功能
```

### 场景3：遇到安全相关问题

```
这个API接口需要加固，请使用 @api-security-best-practices 检查并提供改进建议
```

### 场景4：开发新功能

```
我需要开发一个新闻采集功能，请使用 @backend-dev-guidelines 的架构模式
并用 @fastapi-pro 帮我设计API
```

### 场景5：代码审查

```
代码写完了，请使用 @code-review-checklist 进行检查
```

---

## 🎯 最佳实践

### 每次会话开始时
``` 
请使用 @context-manager 建立本次对话的上下文
并用 @context-management-context-restore 检查是否有未完成的任务
```

### 每次会话结束时
```
请使用 @conversation-memory 总结本次会话的关键决策
并用 @context-management-context-save 保存进度
```

### 开发新功能时
```
1. 先用 @backend-architect 设计架构
2. 用 @backend-dev-guidelines 遵循规范
3. 用 @python-pro 编写代码
4. 用 @code-review-excellence 审查
5. 用 @api-security-best-practices 安全检查
```

---

## 📋 检查清单

- [ ] 会话开始时恢复上下文
- [ ] 使用规范化的开发流程
- [ ] 开发过程中保存关键进度
- [ ] 代码提交前进行审查
- [ ] 上线前进行安全审计
- [ ] 会话结束时总结和保存

---

**记住**：跨会话衔接的核心是 **@context-management-context-save** 和 **@context-management-context-restore**
