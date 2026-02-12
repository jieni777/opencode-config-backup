# OpenCode 配置备份恢复指南

## 📋 当前备份状态

**最后备份时间**: 2026-02-12
**GitHub 仓库**: https://github.com/jieni777/opencode-config-backup
**分支**: main
**提交**: e50ee36

---

## 🔄 完整恢复流程

### 方式一：Git 克隆（推荐）

```bash
# 完整克隆
git clone https://github.com/jieni777/opencode-config-backup.git ~/.config/opencode

# 如果已存在配置，先备份
cp -r ~/.config/opencode ~/.config/opencode-backup-$(date +%Y%m%d)

# 覆盖配置
cp -r opencode-config-backup/* ~/.config/opencode/
```

### 方式二：选择性恢复

```bash
# 只恢复配置文件
cd opencode-config-backup
cp opencode.json oh-my-opencode.json AGENTS.md ~/.config/opencode/

# 恢复Skills（完整覆盖）
cp -r skills/* ~/.config/opencode/skills/

# 恢复记忆数据库
cp .memdb-backup/memory.db ~/.config/opencode/.memdb/
```

---

## 📁 备份内容清单

### 核心配置文件
- ✅ `opencode.json` - MCP 工具配置
- ✅ `oh-my-opencode.json` - AI 模型配置
- ✅ `AGENTS.md` - 全局强制规则
- ✅ `package.json` - 依赖管理

### MCP 工具（7个）
- ✅ sqlite - SQLite 数据库
- ✅ memdb - 记忆系统
- ✅ context7 - 文档查询
- ✅ playwright - 浏览器自动化
- ✅ github - GitHub 集成
- ✅ filesystem - 文件系统
- ✅ macos-use - macOS 桌面控制

### Skills 系统
- ✅ 260+ 个 Skills
- ✅ 完整目录结构
- ✅ 配置文件和依赖

### 记忆系统
- ✅ `.memdb-backup/` - memdb 数据库备份
- ✅ 历史记录
- ✅ 关联关系

---

## ⚠️ 重要注意事项

### 1. 敏感信息保护
- GitHub Token 使用环境变量 `${GITHUB_TOKEN}` 引用
- 本地使用时需设置环境变量
- **不要**将真实 Token 提交到 Git

### 2. 恢复后验证
```bash
# 1. 检查配置文件语法
cat ~/.config/opencode/opencode.json | python3 -m json.tool > /dev/null
echo "✓ JSON 语法正确"

# 2. 验证 Skills
ls ~/.config/opencode/skills/ | wc -l
echo "个 Skills 已安装"

# 3. 测试记忆系统
cd ~/.config/opencode && ./backup-with-memdb.sh
echo "✓ 记忆系统正常"
```

---

## 🔧 更新备份

当配置更改后，执行：

```bash
cd ~/.config/opencode

# 1. 添加所有更改
git add -A

# 2. 创建提交
git commit -m "备份: 配置更新 $(date +%Y-%m-%d)"

# 3. 推送到远程
git push origin main
```

---

## 🚨 故障恢复

### 客户端无法启动
1. 检查配置文件语法
2. 验证 JSON 格式：`python3 -m json.tool opencode.json`
3. 检查 Skills 目录完整性
4. 查看错误日志

### 记忆丢失
```bash
# 从备份恢复
cp ~/.config/opencode/.memdb-backup/memory.db ~/.config/opencode/.memdb/memory.db
```

### MCP 工具连接失败
1. 检查 `opencode.json` 中的工具配置
2. 验证环境变量已设置
3. 重新启动 OpenCode 客户端

---

## 📞 相关信息

- **OpenCode 官网**: https://opencode.ai
- **GitHub 仓库**: https://github.com/jieni777/opencode-config-backup
- **主要模型**: minimax-m2.1, deepseek-r1, kimi-k2.5
- **配置版本**: v1.0.0

---

**最后更新**: 2026-02-12
**维护者**: jieni777
