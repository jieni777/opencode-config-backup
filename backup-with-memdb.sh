#!/bin/bash
# OpenCode 配置 + memdb 记忆 完整备份脚本
# 功能：备份OpenCode配置和memdb记忆到GitHub

set -e

# 配置
REPO_DIR="$HOME/.config/opencode"
MEMDB_DIR="/Users/pro/Documents/AI升级/.memdb"
BACKUP_BRANCH="backup"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="$REPO_DIR/.memdb-backup"

echo "╔════════════════════════════════════════════════════════════╗"
echo "║        🔄 OpenCode + memdb 完整备份系统                    ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "⏰ 备份时间: $(date)"
echo ""

# 步骤1: 备份memdb记忆
echo "📦 步骤1: 备份memdb记忆..."
mkdir -p "$BACKUP_DIR"
MEMDB_BACKUP="$BACKUP_DIR/memory.db.${TIMESTAMP}"
cp "$MEMDB_DIR/memory.db" "$MEMDB_BACKUP"
echo "   ✅ 已备份memdb记忆: memory.db.${TIMESTAMP}"

# 步骤2: 复制最新memdb到备份目录（软链接方式）
rm -f "$BACKUP_DIR/memory.db"
cp "$MEMDB_DIR/memory.db" "$BACKUP_DIR/memory.db"
echo "   ✅ 已更新最新备份: memory.db"

# 步骤3: 切换到备份分支
cd "$REPO_DIR"
git checkout "$BACKUP_BRANCH" 2>/dev/null || git checkout -b "$BACKUP_BRANCH"
echo ""
echo "📝 步骤2: 更新Git备份..."

# 步骤4: 添加所有文件（包括memdb备份）
git add -A

# 步骤5: 检查是否有更改
if git diff --cached --quiet; then
    echo "   ✅ 没有新更改，无需备份"
else
    # 步骤6: 提交
    git commit -m "🔧 完整备份 - OpenCode配置 + memdb记忆 - $TIMESTAMP"
    echo "   ✅ 已提交更改"

    # 步骤7: 推送到GitHub
    echo ""
    echo "🚀 步骤3: 推送到GitHub..."
    git push origin "$BACKUP_BRANCH" || {
        echo -e "${RED}❌ 推送失败${NC}"
        exit 1
    }
    echo "   ✅ 已推送到GitHub"
fi

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║                    ✅ 完整备份完成                          ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "📊 备份内容:"
echo "   • opencode.json - MCP工具配置"
echo "   • skills/ - 所有Skills (56+个)"
echo "   • .memdb-backup/ - memdb记忆备份"
echo ""
echo "📁 备份位置:"
echo "   • GitHub: https://github.com/jieni777/opencode-config-backup"
echo "   • 本地: $REPO_DIR"
echo "   • memdb备份: $BACKUP_DIR"
echo ""
echo "📋 查看历史:"
echo "   cd $REPO_DIR && git log --oneline --all"

echo ""
echo "💡 下次运行此脚本即可备份最新的memdb记忆！"
