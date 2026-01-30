---
name: document-conversion
description: "Microsoft文档转换工具 - Excel/Word/PPT转Markdown格式"
trigger_keywords: "文档转换、Excel转Markdown、Word转Markdown、PPT转换、Office转换、PDF转换、表格提取"
auto_activate: true
priority: 2
---

# MCP MarkItDown - 文档转换工具

## 直接触发指令

当用户请求以下内容时自动激活此技能：
- "转换Excel为Markdown"
- "转换Word文档"
- "提取PPT内容"
- "转换PDF文档"
- "Office转Markdown"
- "解析表格数据"

## 功能

将Excel、Word、PPT等Office文档瞬间转换为Markdown格式，便于AI阅读和处理。

## 支持的格式

- **Excel**: .xlsx, .xls
- **Word**: .docx, .doc
- **PowerPoint**: .pptx, .ppt
- **PDF**: .pdf
- **其他**: JSON, XML, CSV等

## 使用场景

- 将产品经理的Word需求文档转为Markdown
- 提取Excel数据报表
- 转换PPT演示文稿
- 处理PDF技术文档
- 解析复杂表格数据

## 使用方法

在Solo模式下直接请求：

```
Convert this Excel file to Markdown
```

```
Extract all text from the Word document
```

```
Convert the PowerPoint slides to Markdown format
```

```
Parse the PDF and extract the tables
```

## 工具说明

- **convert_file**: 转换单个文件
- **convert_and_summarize**: 转换并总结内容
- **extract_tables**: 提取表格数据
- **extract_images**: 提取图片

## 使用示例

### 转换Excel
```bash
mcp-markitdown convert data.xlsx --output data.md
```

### 转换Word
```bash
mcp-markitdown convert requirements.docx --output requirements.md
```

### 批量转换
```bash
mcp-markitdown convert *.xlsx --output-dir ./markdown/
```

## 输出格式

转换后的Markdown包含：
- 原始文档结构
- 表格转为Markdown表格
- 图片保存为base64或链接
- 代码块保持格式
- 列表和标题层级

## 无需配置

此工具无需API密钥，直接使用本地转换。
