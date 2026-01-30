#!/bin/bash
# OpenCode配置自动备份脚本
# 功能：备份OpenCode配置并推送到GitHub

set -e

# 配置
REPO_DIR="$HOME/.config/opencode"
BACKUP_BRANCH="backup"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

echo "╔════════════════════════════════════════════════════════════╗"
echo "║           🔄 OpenCode配置自动备份系统                      ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "⏰ 备份时间: $(date)"
echo ""

# 切换到备份分支
cd "$REPO_DIR"
git checkout "$BACKUP_BRANCH" 2>/dev/null || git checkout -b "$BACKUP_BRANCH"

# 拉取最新
echo "📥 拉取最新备份..."
git pull origin "$BACKUP_BRANCH" 2>/dev/null || true

# 更新备份分支
echo "📝 更新配置备份..."
git add opencode.json skills/

# 创建提交
if git diff --cached --quiet; then
    echo "✅ 没有新更改，无需备份"
else
    git commit -m "🔧 OpenCode配置备份 - $TIMESTAMP"
    echo "✅ 已提交更改"
    
    # 推送到GitHub
    echo "🚀 推送到GitHub..."
    git push origin "$BACKUP_BRANCH" || {
        echo -e "${RED}❌ 推送失败，请检查GitHub Token${NC}"
        exit 1
    }
    echo "✅ 已推送到GitHub"
fi

echo ""
echo "🎉 备份完成!"
echo ""
echo "📊 当前状态:"
git log --oneline -5

echo ""
echo "💡 查看备份历史:"
echo "   git log --oneline --all"
echo ""
echo "💡 恢复配置:"
echo "   git checkout backup"
