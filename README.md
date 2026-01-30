# OpenCode 完整配置备份

包含：
- **opencode.json** - MCP工具配置
- **skills/** - 所有Skills (56+个)
- **.memdb-backup/** - memdb记忆备份

## 备份内容

### MCP工具 (16个)
- sqlite, memdb, context7, playwright, github, filesystem

### Skills分类
- 上下文管理 (9个)
- 后端开发 (18个)
- 安全开发 (5个)
- OpenCode官方风格 (13个)
- 其他Skills (11个)

## 使用方法

### 恢复配置
```bash
git clone https://github.com/jieni777/opencode-config-backup.git ~/.config/opencode
cd ~/.config/opencode
git checkout backup
```

### 恢复memdb记忆
```bash
cp .memdb-backup/memory.db /Users/pro/Documents/AI升级/.memdb/memory.db
```

## 备份命令

```bash
# 完整备份（含memdb）
./backup-with-memdb.sh
```

---

**作者**: jieni777
**仓库**: https://github.com/jieni777/opencode-config-backup
