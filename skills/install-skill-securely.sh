#!/bin/bash
# OpenCode Skills 安全安装脚本
# 用途：安全地安装新的第三方Skills
# 使用方法: ./install-skill-securely.sh <git-url> [<skill-name>]

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "╔════════════════════════════════════════════════════════════╗"
echo "║         🔒 OpenCode Skills 安全安装脚本                    ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

if [ -z "$1" ]; then
    echo "用法: $0 <git-url> [<skill-name>]"
    echo ""
    echo "示例:"
    echo "  $0 https://github.com/user/skill-repo.git myskill"
    echo "  $0 https://github.com/anthropics/skills.git"
    exit 1
fi

REPO_URL="$1"
SKILL_NAME="${2:-}"
TEMP_DIR="/tmp/opencode-skills-check-$$"
SKILLS_DIR="$HOME/.config/opencode/skills"

echo "📦 克隆仓库到临时目录..."
git clone "$REPO_URL" "$TEMP_DIR" 2>/dev/null || {
    echo -e "${RED}❌ 克隆失败${NC}"
    exit 1
}

echo ""
echo "🔍 开始安全检查..."
echo ""

# 检查危险命令
echo "检查危险命令..."
DANGEROUS=$(grep -r "rm -rf\|chmod 777\|sudo\|eval \$\(" "$TEMP_DIR" 2>/dev/null || true)
if [ -n "$DANGEROUS" ]; then
    echo -e "${RED}⚠️  发现危险命令:${NC}"
    echo "$DANGEROUS"
    echo ""
    echo -e "${YELLOW}是否继续安装? (输入 'yes' 继续):${NC}"
    read -r confirm
    if [ "$confirm" != "yes" ]; then
        echo "❌ 安装已取消"
        rm -rf "$TEMP_DIR"
        exit 1
    fi
else
    echo -e "${GREEN}✅ 未发现危险命令${NC}"
fi

# 检查敏感信息
echo ""
echo "检查敏感信息..."
SENSITIVE=$(grep -r "api_key\|password\|secret\|token" "$TEMP_DIR" 2>/dev/null | grep -v "^#" | grep -v "example\|placeholder" || true)
if [ -n "$SENSITIVE" ]; then
    echo -e "${YELLOW}⚠️  发现可能敏感的信息:${NC}"
    echo "$SENSITIVE"
    echo ""
    echo -e "${YELLOW}是否继续安装? (输入 'yes' 继续):${NC}"
    read -r confirm
    if [ "$confirm" != "yes" ]; then
        echo "❌ 安装已取消"
        rm -rf "$TEMP_DIR"
        exit 1
    fi
else
    echo -e "${GREEN}✅ 未发现敏感信息${NC}"
fi

# 检查所有SKILL.md文件
echo ""
echo "检查所有SKILL.md文件..."
SKILL_FILES=$(find "$TEMP_DIR" -name "SKILL.md" 2>/dev/null | wc -l)
echo "找到 $SKILL_FILES 个SKILL.md文件"

if [ "$SKILL_FILES" -eq 0 ]; then
    echo -e "${YELLOW}⚠️  未找到SKILL.md文件，是否继续?${NC}"
    read -r confirm
    if [ "$confirm" != "yes" ]; then
        echo "❌ 安装已取消"
        rm -rf "$TEMP_DIR"
        exit 1
    fi
fi

# 安装Skills
echo ""
echo "📦 安装Skills..."

# 如果指定了skill名称，只安装该skill
if [ -n "$SKILL_NAME" ]; then
    if [ -d "$TEMP_DIR/$SKILL_NAME" ]; then
        cp -r "$TEMP_DIR/$SKILL_NAME" "$SKILLS_DIR/"
        echo -e "${GREEN}✅ 已安装: $SKILL_NAME${NC}"
    else
        echo -e "${RED}❌ 未找到skill: $SKILL_NAME${NC}"
        rm -rf "$TEMP_DIR"
        exit 1
    fi
else
    # 安装所有目录
    for dir in "$TEMP_DIR"/*/; do
        if [ -d "$dir" ] && [ -f "${dir}SKILL.md" ]; then
            skill_name=$(basename "$dir")
            cp -r "$dir" "$SKILLS_DIR/"
            echo -e "${GREEN}✅ 已安装: $skill_name${NC}"
        fi
    done
fi

# 清理
rm -rf "$TEMP_DIR"

echo ""
echo -e "${GREEN}🎉 安装完成!${NC}"
echo ""
echo "建议: 运行安全审计检查新安装的Skills"
echo "文件: $SKILLS_DIR/SECURITY_AUDIT_REPORT.md"
