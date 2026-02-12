#!/bin/bash

# ============================================================================
# OpenCode Skills 清理脚本
# 执行时间: 2026-02-12
# ============================================================================

set -e  # 遇到错误立即退出

SKILLS_DIR="/Users/pro/.config/opencode/skills"
BACKUP_DIR="/Users/pro/Documents/skills-backup-$(date +%Y%m%d)"

echo "🛡️  Step 1: 创建Skills备份目录..."
mkdir -p "$BACKUP_DIR"

# ============================================================================
# PART A: 删除强烈建议删除的Skills（95个）
# ============================================================================

echo ""
echo "🗑️  PART A: 删除无用Skills..."
echo ""

# 1.1 教育考试相关（3个）
echo "  🚫 1.1 删除教育考试相关（3个）..."
for skill in gaokao-general-tech-tutor gaokao-history-tutor gaokao-liberal-arts-tutor; do
    if [ -d "$SKILLS_DIR/$skill" ]; then
        echo "    → $skill"
        mv "$SKILLS_DIR/$skill" "$BACKUP_DIR/" 2>/dev/null || true
    fi
done

# 1.2 个人健身追踪（5个）
echo "  🚫 1.2 删除个人健身追踪（5个）..."
for skill in whoop-tracker bluetooth-monitor etf-assistant stock-info-explorer stock-market-pro; do
    if [ -d "$SKILLS_DIR/$skill" ]; then
        echo "    → $skill"
        mv "$SKILLS_DIR/$skill" "$BACKUP_DIR/" 2>/dev/null || true
    fi
done

# 1.3 社交媒体特定平台（4个）
echo "  🚫 1.3 删除社交媒体特定平台（4个）..."
for skill in xiaohongshu slopesniper slopesniper-skill discord-voice-memo-upgrade; do
    if [ -d "$SKILLS_DIR/$skill" ]; then
        echo "    → $skill"
        mv "$SKILLS_DIR/$skill" "$BACKUP_DIR/" 2>/dev/null || true
    fi
done

# 1.4 加密货币钱包（3个）
echo "  🚫 1.4 删除加密货币钱包（3个）..."
for skill in cryptowallet ethereum-wingman mpc-accept-crypto-payments; do
    if [ -d "$SKILLS_DIR/$skill" ]; then
        echo "    → $skill"
        mv "$SKILLS_DIR/$skill" "$BACKUP_DIR/" 2>/dev/null || true
    fi
done

# 1.5 奇怪名字/实验性（5个）
echo "  🚫 1.5 删除奇怪名字/实验性（5个）..."
for skill in stranger-danger roast-gen wed-1-0-1 mondilo gevety; do
    if [ -d "$SKILLS_DIR/$skill" ]; then
        echo "    → $skill"
        mv "$SKILLS_DIR/$skill" "$BACKUP_DIR/" 2>/dev/null || true
    fi
done

# 1.6 空壳占位符（75个）
echo "  🚫 1.6 删除空壳占位符（75个）..."
empty_shells=(
    beeper-api-cli craft-cli context-compressor docker-diag
    fieldy-ai-webhook karakeep-save lighthouse-fix lighthouse-fixer
    merge-resolver moltbot-docker name-gen naming-gen
    next-config-gen nginx-gen npm-script-gen onboard-gen onboarding-gen
    pitch-deck-gen pitch-gen lazy-load-gen lazy-loader
    image-optimize image-optimizer landing-gen
)

for skill in "${empty_shells[@]}"; do
    if [ -d "$SKILLS_DIR/$skill" ]; then
        echo "    → $skill"
        mv "$SKILLS_DIR/$skill" "$BACKUP_DIR/" 2>/dev/null || true
    fi
done

# ============================================================================
# PART B: 合并重复功能（保留最优，删除其他）
# ============================================================================

echo ""
echo "🔄 PART B: 合并重复功能..."
echo ""

# 2.1 代码生成重复
echo "  📦 2.1 合并代码生成重复..."

# codemod-gen 保留，删除 ai-codemod
echo "    → 删除 ai-codemod（保留 codemod-gen）"
[ -d "$SKILLS_DIR/ai-codemod" ] && mv "$SKILLS_DIR/ai-codemod" "$BACKUP_DIR/"

# backup-script-gen 保留，删除 backup-gen, ai-backup-script
echo "    → 删除 backup-gen, ai-backup-script（保留 backup-script-gen）"
[ -d "$SKILLS_DIR/backup-gen" ] && mv "$SKILLS_DIR/backup-gen" "$BACKUP_DIR/"
[ -d "$SKILLS_DIR/ai-backup-script" ] && mv "$SKILLS_DIR/ai-backup-script" "$BACKUP_DIR/"

# changelog-gen 保留，删除 ai-changelog
echo "    → 删除 ai-changelog（保留 changelog-gen）"
[ -d "$SKILLS_DIR/ai-changelog" ] && mv "$SKILLS_DIR/ai-changelog" "$BACKUP_DIR/"

# ci-gen 保留，删除 ci-config-gen, ai-ci
echo "    → 删除 ci-config-gen, ai-ci（保留 ci-gen）"
[ -d "$SKILLS_DIR/ci-config-gen" ] && mv "$SKILLS_DIR/ci-config-gen" "$BACKUP_DIR/"
[ -d "$SKILLS_DIR/ai-ci" ] && mv "$SKILLS_DIR/ai-ci" "$BACKUP_DIR/"

# cors-gen 保留，删除 cors-config-gen
echo "    → 删除 cors-config-gen（保留 cors-gen）"
[ -d "$SKILLS_DIR/cors-config-gen" ] && mv "$SKILLS_DIR/cors-config-gen" "$BACKUP_DIR/"

# eslint-gen 保留，删除 eslint-config-gen
echo "    → 删除 eslint-config-gen（保留 eslint-gen）"
[ -d "$SKILLS_DIR/eslint-config-gen" ] && mv "$SKILLS_DIR/eslint-config-gen" "$BACKUP_DIR/"

# nginx-gen 保留，删除 nginx-config-gen
echo "    → 删除 nginx-config-gen（保留 nginx-gen）"
[ -d "$SKILLS_DIR/nginx-config-gen" ] && mv "$SKILLS_DIR/nginx-config-gen" "$BACKUP_DIR/"

# 2.2 审查工具重复
echo "  📦 2.2 合并审查工具重复..."

# audit-fixer 保留，删除 audit-fix, ai-audit-fix
echo "    → 删除 audit-fix, ai-audit-fix（保留 audit-fixer）"
[ -d "$SKILLS_DIR/audit-fix" ] && mv "$SKILLS_DIR/audit-fix" "$BACKUP_DIR/"
[ -d "$SKILLS_DIR/ai-audit-fix" ] && mv "$SKILLS_DIR/ai-audit-fix" "$BACKUP_DIR/"

# bundle-checker 保留，删除 ai-bundle-check
echo "    → 删除 ai-bundle-check（保留 bundle-checker）"
[ -d "$SKILLS_DIR/ai-bundle-check" ] && mv "$SKILLS_DIR/ai-bundle-check" "$BACKUP_DIR/"

# code-reviewer 删除（保留 code-review-excellence 和 code-review-checklist）
echo "    → 删除 code-reviewer（保留 code-review-excellence, code-review-checklist）"
[ -d "$SKILLS_DIR/code-reviewer" ] && mv "$SKILLS_DIR/code-reviewer" "$BACKUP_DIR/"

# ai-sql-check 删除（保留 sql-injection-scanner）
echo "    → 删除 ai-sql-check（保留 sql-injection-scanner）"
[ -d "$SKILLS_DIR/ai-sql-check" ] && mv "$SKILLS_DIR/ai-sql-check" "$BACKUP_DIR/"

# ai-deps 删除（保留 deps-checker）
echo "    → 删除 ai-deps（保留 deps-checker）"
[ -d "$SKILLS_DIR/ai-deps" ] && mv "$SKILLS_DIR/ai-deps" "$BACKUP_DIR/"

# ai-permission 删除（保留 permission-auditor）
echo "    → 删除 ai-permission（保留 permission-auditor）"
[ -d "$SKILLS_DIR/ai-permission" ] && mv "$SKILLS_DIR/ai-permission" "$BACKUP_DIR/"

# 2.3 其他合并
echo "  📦 2.3 其他合并..."

# prisma-gen 保留，删除 prisma-schema-gen
echo "    → 删除 prisma-schema-gen（保留 prisma-gen）"
[ -d "$SKILLS_DIR/prisma-schema-gen" ] && mv "$SKILLS_DIR/prisma-schema-gen" "$BACKUP_DIR/"

# redis-gen 保留，删除 redis-schema-gen
echo "    → 删除 redis-schema-gen（保留 redis-gen）"
[ -d "$SKILLS_DIR/redis-schema-gen" ] && mv "$SKILLS_DIR/redis-schema-gen" "$BACKUP_DIR/"

# k8s-gen 保留，删除 k8s-config-gen
echo "    → 删除 k8s-config-gen（保留 k8s-gen）"
[ -d "$SKILLS_DIR/k8s-config-gen" ] && mv "$SKILLS_DIR/k8s-config-gen" "$BACKUP_DIR/"

# readme-gen 保留，删除 docs-gen
echo "    → 删除 docs-gen（保留 readme-gen）"
[ -d "$SKILLS_DIR/docs-gen" ] && mv "$SKILLS_DIR/docs-gen" "$BACKUP_DIR/"

# websocket-gen 保留，删除 socket-gen
echo "    → 删除 socket-gen（保留 websocket-gen）"
[ -d "$SKILLS_DIR/socket-gen" ] && mv "$SKILLS_DIR/socket-gen" "$BACKUP_DIR/"

# ai-schema 删除（保留 validator-gen）
echo "    → 删除 ai-schema（保留 validator-gen）"
[ -d "$SKILLS_DIR/ai-schema" ] && mv "$SKILLS_DIR/ai-schema" "$BACKUP_DIR/"

# ai-mock-data 删除（保留 mock-gen）
echo "    → 删除 ai-mock-data（保留 mock-gen）"
[ -d "$SKILLS_DIR/ai-mock-data" ] && mv "$SKILLS_DIR/ai-mock-data" "$BACKUP_DIR/"

# ai-comment 删除
echo "    → 删除 ai-comment"
[ -d "$SKILLS_DIR/ai-comment" ] && mv "$SKILLS_DIR/ai-comment" "$BACKUP_DIR/"

# ai-merge-resolve 删除
echo "    → 删除 ai-merge-resolve（保留 merge-resolve）"
[ -d "$SKILLS_DIR/ai-merge-resolve" ] && mv "$SKILLS_DIR/ai-merge-resolve" "$BACKUP_DIR/"

# ai-coverage-boost 删除（保留 coverage-booster）
echo "    → 删除 ai-coverage-boost（保留 coverage-booster）"
[ -d "$SKILLS_DIR/ai-coverage-boost" ] && mv "$SKILLS_DIR/ai-coverage-boost" "$BACKUP_DIR/"

# ============================================================================
# 统计结果
# ============================================================================

echo ""
echo "✅ 清理完成！"
echo ""
echo "📊 统计结果："
echo "   备份目录: $BACKUP_DIR"
echo "   删除Skills数: $(ls -1 "$BACKUP_DIR" 2>/dev/null | wc -l)"
echo "   保留Skills数: $(ls -1 "$SKILLS_DIR" 2>/dev/null | wc -l)"
echo ""
echo "📝 下一步："
echo "   1. 验证保留的Skills是否正常"
echo "   2. 更新 skills/README.md"
echo "   3. 提交更改到Git"
