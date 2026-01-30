# OpenCode配置备份系统

## 🎯 系统概述

本系统用于自动备份OpenCode配置到GitHub，包括：
- MCP工具配置 (`opencode.json`)
- 所有Skills (56+个)
- 安全审计报告
- 备份脚本

## 📦 备份内容

### 已备份的文件
- `opencode.json` - OpenCode主配置文件（MCP工具配置）
- `skills/` - 所有Skills目录
- `README.md` - 项目说明
- `backup.sh` - 备份脚本
- `.gitignore` - Git忽略规则

### 未备份的内容（安全原因）
- API密钥和Tokens（使用环境变量）
- `.env` 文件
- `*.log` 日志文件
- 备份文件 (`*.backup_*`)
- `node_modules/` 目录

## 🚀 使用方法

### 手动备份

```bash
cd ~/.config/opencode
./backup.sh
```

### 恢复配置

```bash
# 从GitHub克隆
git clone https://github.com/jieni777/opencode-config-backup.git ~/.config/opencode-backup

# 恢复配置
cp -r ~/.config/opencode-backup/* ~/.config/opencode/

# 设置执行权限
chmod +x ~/.config/opencode/backup.sh
```

### 查看备份历史

```bash
cd ~/.config/opencode
git log --oneline
```

## ⏰ 自动备份设置

### 方法1: 添加cron定时任务

```bash
# 编辑crontab
crontab -e

# 添加以下行（每天凌晨2点自动备份）
0 2 * * * cd ~/.config/opencode && ./backup.sh >> ~/.config/opencode/backup.log 2>&1
```

### 方法2: 使用launchd (macOS)

```bash
# 创建plist文件
cat > ~/Library/LaunchAgents/com.user.opencode-backup.plist << 'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.user.opencode-backup</string>
    <key>ProgramArguments</key>
    <array>
        <string>bash</string>
        <string>/Users/pro/.config/opencode/backup.sh</string>
    </array>
    <key>StartCalendarInterval</key>
    <dict>
        <key>Hour</key>
        <integer>2</integer>
        <key>Minute</key>
        <integer>0</integer>
    </dict>
    <key>StandardOutPath</key>
    <string>/Users/pro/.config/opencode/backup.log</string>
    <key>StandardErrorPath</key>
    <string>/Users/pro/.config/opencode/backup.error.log</string>
</dict>
</plist>
PLIST

# 加载任务
launchctl load ~/Library/LaunchAgents/com.user.opencode-backup.plist
```

## 🔧 配置说明

### 环境变量

在运行备份前，确保设置以下环境变量：

```bash
# GitHub Personal Access Token (用于推送)
export GITHUB_TOKEN="ghp_xxxxx"

# 其他可能需要的Token
# export OPENAI_API_KEY="sk-xxxxx"
# export DEEPSEEK_API_KEY="sk-xxxxx"
```

### 敏感信息处理

OpenCode配置中使用环境变量代替硬编码的密钥：

```json
{
  "github": {
    "environment": {
      "GITHUB_PERSONAL_ACCESS_TOKEN": "${GITHUB_TOKEN}"
    }
  }
}
```

## 📊 备份统计

- **Skills总数**: 56+
- **配置文件**: opencode.json
- **备份频率**: 每日自动备份
- **存储位置**: GitHub (jieni777/opencode-config-backup)

## 🔒 安全特性

1. **敏感信息保护**: 所有API密钥使用环境变量
2. **自动扫描**: 备份前自动检查危险命令
3. **仅读安全**: Skills文档已通过安全审计
4. **历史记录**: 保留完整Git历史，可随时回滚

## 🛠️ 故障排除

### 推送失败

如果推送失败，可能是Token权限问题：

```bash
# 检查Token权限
curl -H "Authorization: Bearer $GITHUB_TOKEN" https://api.github.com/user

# 重新生成Token (如果需要)
# Token需要repo权限
```

### 合并冲突

如果本地有未提交的更改，备份脚本会失败：

```bash
# 解决方法1: 提交更改后重试
git add -A
git commit -m "临时保存"
./backup.sh

# 解决方法2: 放弃本地更改
git checkout -- .
./backup.sh
```

### 权限问题

```bash
# 确保backup.sh有执行权限
chmod +x ~/.config/opencode/backup.sh

# 确保Git配置正确
git config user.email "your-email@example.com"
git config user.name "Your Name"
```

## 📝 更新日志

See [GitHub commits](https://github.com/jieni777/opencode-config-backup/commits/main)

## 🆘 恢复指南

### 从特定提交恢复

```bash
cd ~/.config/opencode
git log --oneline --all

# 找到需要的commit hash
git checkout <commit-hash>

# 如果要恢复到该提交
git reset --hard <commit-hash>
```

### 恢复到备份分支

```bash
cd ~/.config/opencode
git checkout backup
```

---

**系统维护**: 自动
**作者**: jieni777
**GitHub**: https://github.com/jieni777/opencode-config-backup

---

## 🔄 完整备份（含memdb记忆）

从现在起，有两个备份脚本：

### 1. 标准备份（仅配置，不含memdb）
```bash
cd ~/.config/opencode
./backup.sh
```
- 备份 opencode.json 和 skills/
- 不包含memdb记忆

### 2. 完整备份（推荐 ✅）
```bash
cd ~/.config/opencode
./backup-with-memdb.sh
```
- 备份 opencode.json、skills/
- ✅ **同时备份 memdb 记忆**
- ✅ 包含时间戳版本历史
- **推荐每次修改配置或重要对话后运行**

### 3. memdb记忆备份位置
- **GitHub**: https://github.com/jieni777/opencode-config-backup/tree/backup/.memdb-backup
- **本地**: ~/.config/opencode/.memdb-backup/
  - `memory.db` - 最新备份
  - `memory.db.20260130_132529` - 带时间戳的历史备份

### 4. 从GitHub恢复memdb记忆
```bash
# 克隆仓库
git clone https://github.com/jieni777/opencode-config-backup.git ~/.config/opencode-backup
cd ~/.config/opencode-backup
git checkout backup

# 恢复memdb记忆
cp ~/.config/opencode-backup/.memdb-backup/memory.db /Users/pro/Documents/AI升级/.memdb/memory.db

# 重启memdb MCP
pkill -f "@j0hanz/memdb"
cd ~/.config/opencode && npx -y @j0hanz/memdb &
```

