# Skills 清理评估报告

## 执行时间
2026-02-12

## 任务1：删除强烈建议删除的Skills（95个）

### 1.1 教育考试相关（3个）
**删除列表：**
```
gaokao-general-tech-tutor
gaokao-history-tutor
gaokao-liberal-arts-tutor
```
**理由：** 高考辅导，与AI编程完全无关

### 1.2 个人健身追踪（5个）
**删除列表：**
```
whoop-tracker
bluetooth-monitor
etf-assistant
stock-info-explorer
stock-market-pro
```
**理由：** 金融和健康数据追踪，与开发无关

### 1.3 社交媒体特定平台（4个）
**删除列表：**
```
xiaohongshu
slopesniper
slopesniper-skill
discord-voice-memo-upgrade
```
**理由：** 特定平台集成，使用频率极低

### 1.4 加密货币钱包（3个）
**删除列表：**
```
cryptowallet
ethereum-wingman
mpc-accept-crypto-payments
```
**理由：** Web3开发才可能用到，普通开发用不到

### 1.5 奇怪名字/实验性（5个）
**删除列表：**
```
stranger-danger
roast-gen
wed-1-0-1
mondilo
gevety
```
**理由：** 名字奇怪，功能不明确

### 1.6 空壳占位符（75个）
**删除列表：**
```
beeper-api-cli
craft-cli
context-compressor
docker-diag
fieldy-ai-webhook
karakeep-save
lighthouse-fix
lighthouse-fixer
merge-resolver
moltbot-docker
// ... 更多空壳Skills
```

---

## 任务2：重复功能评估与合并（8组）

### 2.1 代码生成重复（评估标准）
**评估维度：**
- 实现完整度（src/目录）
- 社区活跃度
- 功能丰富度
- 与你当前技术栈匹配度

**分析结果：**

#### A. codemod-gen vs ai-codemod
| 指标 | codemod-gen | ai-codemod |
|------|------------|-----------|
| 实现度 | ⭐⭐⭐⭐ | ⭐⭐ |
| 功能丰富度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| 更新活跃度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| **决定** | **保留** | **删除** |

**保留理由：** codemod-gen 功能更完整，支持批量代码重构

#### B. backup-script-gen vs backup-gen vs ai-backup-script
| 指标 | backup-script-gen | backup-gen | ai-backup-script |
|------|------------------|------------|-----------------|
| 实现度 | ⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐ |
| 功能丰富度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| **决定** | **保留** | **删除** | **删除** |

**保留理由：** backup-script-gen 专精备份脚本生成，功能最完整

#### C. changelog-gen vs ai-changelog
| 指标 | changelog-gen | ai-changelog |
|------|--------------|-------------|
| 实现度 | ⭐⭐⭐⭐ | ⭐⭐ |
| 功能丰富度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| **决定** | **保留** | **删除** |

#### D. ci-gen vs ci-config-gen vs ai-ci
| 指标 | ci-gen | ci-config-gen | ai-ci |
|------|--------|--------------|------|
| 实现度 | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ |
| 功能丰富度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| **决定** | **保留** | **删除** | **删除** |

#### E. cors-gen vs cors-config-gen
| 指标 | cors-gen | cors-config-gen |
|------|----------|----------------|
| 实现度 | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| 功能丰富度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **决定** | **保留** | **删除** |

#### F. eslint-gen vs eslint-config-gen
| 指标 | eslint-gen | eslint-config-gen |
|------|------------|-----------------|
| 实现度 | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| 功能丰富度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **决定** | **保留** | **删除** |

#### G. nginx-gen vs nginx-config-gen
| 指标 | nginx-gen | nginx-config-gen |
|------|----------|-----------------|
| 实现度 | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| 功能丰富度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **决定** | **保留** | **删除** |

#### H. 其他合并建议
- prisma-gen ↔ prisma-schema-gen → **保留 prisma-gen**
- redis-gen ↔ redis-schema-gen → **保留 redis-gen**  
- k8s-gen ↔ k8s-config-gen → **保留 k8s-gen**
- docs-gen ↔ readme-gen → **保留 readme-gen**（功能更明确）
- socket-gen ↔ websocket-gen → **保留 websocket-gen**（更通用）

### 2.2 审查工具重复（评估标准）

#### A. code-review-excellence vs code-review-checklist vs code-reviewer
| 指标 | code-review-excellence | code-review-checklist | code-reviewer |
|------|----------------------|---------------------|---------------|
| 实现度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| 功能丰富度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| 实用性 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| **决定** | **保留** | **保留** | **删除** |

**说明：** code-review-excellence 和 code-review-checklist 功能互补，前者提供方法论，后者提供清单

#### B. production-code-audit vs security-auditor
| 指标 | production-code-audit | security-auditor |
|------|---------------------|-----------------|
| 实现度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| 专注度 | 生产代码 | 安全审计 |
| **决定** | **保留** | **保留** |

**说明：** 两个方向不同，生产代码审计更偏向代码质量，安全审计偏向安全性

#### C. audit-fix vs audit-fixer vs ai-audit-fix
| 指标 | audit-fixer | audit-fix | ai-audit-fix |
|------|------------|-----------|--------------|
| 实现度 | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ |
| 功能丰富度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| **决定** | **保留** | **删除** | **删除** |

#### D. bundle-checker vs ai-bundle-check
| 指标 | bundle-checker | ai-bundle-check |
|------|---------------|----------------|
| 实现度 | ⭐⭐⭐⭐ | ⭐⭐ |
| 功能丰富度 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| **决定** | **保留** | **删除** |

#### E. 其他审查工具
- ai-sql-check ↔ sql-injection-scanner → **保留 sql-injection-scanner**（更专业）
- ai-deps ↔ deps-checker → **保留 deps-checker**（功能完整）
- ai-permission ↔ permission-auditor → **保留 permission-auditor**（功能完整）

---

## 最终保留清单

### 核心开发类（必留）
```
fastapi-pro
python-pro
python-patterns
backend-architect
backend-dev-guidelines
api-design-principles
api-patterns
context-manager
```

### 代码质量类（必留）
```
code-review-excellence
code-review-checklist
production-code-audit
security-auditor
clean-code
coverage-booster
bundle-checker
deps-checker
sql-injection-scanner
permission-auditor
```

### 工具集成类（必留）
```
github
filesystem
database
api-testing
playwright
context7
terminal
```

### AI/模型类（必留）
```
model-orchestrator
ai-model-team
multi-agent-dev-skill
```

### Special类（按需）
```
ui-ux-pro-max
opencode-docs
opencode-config-safety
opencode-config-validator
```

### 精选生成类（合并后保留）
```
codemod-gen
backup-script-gen
changelog-gen
ci-gen
cors-gen
eslint-gen
nginx-gen
prisma-gen
redis-gen
k8s-config-gen
readme-gen
websocket-gen
```

---

## 执行统计

| 类别 | 原始数量 | 删除数量 | 保留数量 |
|------|---------|---------|---------|
| 总Skills | 256 | ~150 | ~100 |
| 教育类 | 3 | 3 | 0 |
| 健身/金融 | 5 | 5 | 0 |
| 社交媒体 | 4 | 4 | 0 |
| 加密货币 | 3 | 3 | 0 |
| 奇怪名字 | 5 | 5 | 0 |
| 空壳占位 | 75 | 75 | 0 |
| 重复代码生成 | 25 | 18 | 7 |
| 重复审查工具 | 15 | 8 | 7 |
