#!/bin/bash

# VNKE.com 内容更新脚本
# 用法: ./update-content.sh [类型] [数量]
# 类型: business (商业冷知识) 或 wisdom (职场智慧)
# 数量: 要添加的条数 (默认 10)

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
INDEX_FILE="$REPO_DIR/index.html"
BACKUP_FILE="$REPO_DIR/index.html.backup.$(date +%Y%m%d_%H%M%S)"

CONTENT_TYPE="${1:-business}"
ADD_COUNT="${2:-10}"

echo "🔧 VNKE.com 内容更新工具"
echo "=========================="
echo "类型: $CONTENT_TYPE"
echo "添加数量: $ADD_COUNT"
echo ""

# 备份原文件
cp "$INDEX_FILE" "$BACKUP_FILE"
echo "✅ 已备份原文件: $(basename "$BACKUP_FILE")"

# 提取当前内容数组
echo "📊 当前内容统计:"
BUSINESS_COUNT=$(grep -c '"icon":' "$INDEX_FILE" | head -1 || echo "0")
WISDOM_COUNT=$(grep -c '"icon":' "$INDEX_FILE" | tail -1 || echo "0")
echo "  商业冷知识: $BUSINESS_COUNT 条"
echo "  职场智慧: $WISDOM_COUNT 条"
echo ""

# 创建临时文件用于新内容
TEMP_FILE=$(mktemp)

if [ "$CONTENT_TYPE" = "business" ]; then
    echo "📝 添加商业冷知识 ($ADD_COUNT 条)"
    echo "格式: 图标 标题 内容 标签"
    echo "示例: 📱 iPhone定价 乔布斯把iPhone定价499美元... 定价策略"
    echo ""
    
    for ((i=1; i<=ADD_COUNT; i++)); do
        echo "--- 第 $i 条 ---"
        read -p "图标: " icon
        read -p "标题: " title
        read -p "内容: " content
        read -p "标签: " tag
        
        # 添加到临时文件
        echo "            { icon: \"$icon\", title: \"$title\", content: \"$content\", tag: \"$tag\" }," >> "$TEMP_FILE"
        echo ""
    done
    
    # 插入到 businessFacts 数组
    sed -i '' '/const businessFacts = \[/,/\];/ {
        /];/i\
'"$(cat "$TEMP_FILE")"'
    }' "$INDEX_FILE"
    
elif [ "$CONTENT_TYPE" = "wisdom" ]; then
    echo "📝 添加职场智慧 ($ADD_COUNT 条)"
    echo "格式: 图标 标题 内容 标签"
    echo "示例: 💼 谈判技巧 谈判时让对方先报价... 沟通"
    echo ""
    
    for ((i=1; i<=ADD_COUNT; i++)); do
        echo "--- 第 $i 条 ---"
        read -p "图标: " icon
        read -p "标题: " title
        read -p "内容: " content
        read -p "标签: " tag
        
        # 添加到临时文件
        echo "            { icon: \"$icon\", title: \"$title\", content: \"$content\", tag: \"$tag\" }," >> "$TEMP_FILE"
        echo ""
    done
    
    # 插入到 wisdomCards 数组
    sed -i '' '/const wisdomCards = \[/,/\];/ {
        /];/i\
'"$(cat "$TEMP_FILE")"'
    }' "$INDEX_FILE"
else
    echo "❌ 错误: 类型必须是 'business' 或 'wisdom'"
    exit 1
fi

# 清理临时文件
rm "$TEMP_FILE"

echo "✅ 内容已添加到 $INDEX_FILE"
echo ""

# 显示更新后的统计
NEW_BUSINESS_COUNT=$(grep -c '"icon":' "$INDEX_FILE" | head -1 || echo "0")
NEW_WISDOM_COUNT=$(grep -c '"icon":' "$INDEX_FILE" | tail -1 || echo "0")
echo "📊 更新后内容统计:"
echo "  商业冷知识: $NEW_BUSINESS_COUNT 条 (+$((NEW_BUSINESS_COUNT - BUSINESS_COUNT)))"
echo "  职场智慧: $NEW_WISDOM_COUNT 条 (+$((NEW_WISDOM_COUNT - WISDOM_COUNT)))"
echo ""

# 询问是否提交到 GitHub
read -p "🚀 是否提交到 GitHub? (y/n): " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "📤 提交到 GitHub..."
    git add index.html
    git commit -m "内容更新: 添加 $ADD_COUNT 条 $CONTENT_TYPE 内容"
    git push origin main
    echo "✅ 已提交并推送到 GitHub!"
    echo "🌐 等待 1-2 分钟让 GitHub Pages 更新..."
fi

echo ""
echo "🎉 更新完成!"
echo "📁 备份文件: $(basename "$BACKUP_FILE")"
echo "🌐 网站地址: https://vnke.com"