# VNKE.com 内容更新指南

## 快速开始

### 1. 进入项目目录
```bash
cd /Users/tom/.openclaw/workspace/vnke-site
```

### 2. 运行更新脚本
```bash
./update-content.sh
```

### 3. 按提示操作
脚本会引导你：
- 选择内容类型（商业冷知识 / 职场智慧）
- 输入要添加的数量（默认 10 条）
- 逐条输入内容（图标、标题、内容、标签）
- 自动提交到 GitHub

## 详细用法

### 添加 10 条商业冷知识
```bash
./update-content.sh business 10
```

### 添加 5 条职场智慧
```bash
./update-content.sh wisdom 5
```

### 手动编辑（高级用户）
直接编辑 `index.html` 中的两个数组：
```javascript
// 商业冷知识数组（约第 150 行）
const businessFacts = [ ... ];

// 职场智慧数组（约第 180 行）
const wisdomCards = [ ... ];
```

**格式：**
```javascript
{
    icon: "📱",           // 表情符号图标
    title: "iPhone 的秘密", // 简短标题
    content: "乔布斯把 iPhone 定价 499 美元...", // 内容（80 字内）
    tag: "定价策略"       // 分类标签
}
```

## 内容建议

### 商业冷知识方向
- 知名公司背后的故事
- 颠覆性的商业模式
- 营销策略的心理学
- 品牌建设的秘密
- 技术创新的影响

### 职场智慧方向
- 沟通与谈判技巧
- 时间与精力管理
- 职业发展规划
- 思维与决策方法
- 个人品牌建设

### 图标建议
- 📱 科技/产品
- ☕ 餐饮/零售
- 🚗 交通/出行
- 💰 金融/投资
- 🎮 娱乐/游戏
- 💼 职场/工作
- ⏰ 时间/效率
- 🎯 目标/规划
- 🤝 社交/人脉
- 📊 数据/分析

## 最佳实践

1. **每日更新**：每天添加 10 条新内容
2. **质量优先**：每条内容要有价值、有趣、有启发
3. **简洁明了**：标题吸引人，内容 80 字内
4. **标签分类**：使用一致的标签便于管理
5. **图标匹配**：图标与内容主题相关

## 自动提交

脚本会自动：
1. 备份原文件
2. 验证格式
3. 提交到 Git
4. 推送到 GitHub
5. 触发 GitHub Pages 重新部署

## 故障排除

### 脚本无法运行
```bash
chmod +x update-content.sh
```

### Git 提交失败
检查网络连接和 Git 配置：
```bash
git config --global user.email "your-email@example.com"
git config --global user.name "Your Name"
```

### 内容未显示
GitHub Pages 需要 1-2 分钟重新构建，刷新页面或等待片刻。

## 联系

如有问题，参考项目文档或联系维护者。

---
*最后更新: $(date)*