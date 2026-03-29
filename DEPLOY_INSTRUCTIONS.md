# VNKE 网站部署指南（Netlify 方案）

## 🚀 一键部署步骤

### 1. 访问 Netlify Drop
打开浏览器访问：https://app.netlify.com/drop

### 2. 拖拽部署包
将以下文件拖入页面：
```
/Users/tom/.openclaw/workspace/vnke-site/vnke-site-deploy.zip
```
> 或者拖入整个文件夹 `vnke-site`

### 3. 获取临时 URL
部署成功后，Netlify 会生成一个临时 URL（如 `https://random-name.netlify.app`）

### 4. 绑定自定义域名
1. 登录 Netlify 后台：https://app.netlify.com
2. 进入站点设置 → **Domain management**
3. 点击 **Add custom domain**
4. 输入：`vnke.com`
5. 点击 **Verify**

### 5. 配置 DNS（关键步骤）
在域名注册商处添加以下 DNS 记录：

| 类型 | 主机记录 | 记录值 | 说明 |
|------|----------|--------|------|
| CNAME | www | xxx.netlify.app | 替换为实际 Netlify 域名 |
| CNAME | @ | xxx.netlify.app | 根域名（部分注册商支持） |

> **注意**：如果注册商不支持根域名 CNAME，需使用 **URL 转发** 或 **ALIAS/ANAME** 记录

### 6. 启用 HTTPS
Netlify 会自动为域名申请 SSL 证书，通常 5-10 分钟内生效。

---

## 🎯 预期效果
- ✅ 网站立即上线
- ✅ 自动 HTTPS
- ✅ 全球 CDN 加速
- ✅ 免费域名绑定
- ✅ 无需服务器维护

## 📱 移动端测试
部署后，用手机访问 `https://vnke.com` 测试响应式效果。

## 📊 后续优化
- 添加 Google Analytics
- 生成社交媒体分享图片
- 每周更新 3-5 条新内容
- 准备微信/微博推广文案

---

**让知识变得有趣，让商业变得简单** 💡
