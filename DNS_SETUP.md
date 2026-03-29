# DNS 配置说明（用于绑定 vnke.com 到 Netlify）

## 🎯 目标
将 `vnke.com` 和 `www.vnke.com` 指向 Netlify 部署的站点。

## 📝 配置步骤

### 1. 获取 Netlify 分配的域名
部署完成后，Netlify 会分配一个临时域名，例如：
```
https://vnke-knowledge.netlify.app
```
（实际域名以部署结果为准）

### 2. 登录域名注册商后台
根据你购买 `vnke.com` 的注册商，登录管理后台：
- **阿里云**：https://dns.console.aliyun.com
- **腾讯云**：https://dnspod.cloud.tencent.com
- **GoDaddy**：https://www.godaddy.com
- **Namecheap**：https://www.namecheap.com

### 3. 添加 DNS 记录

#### 方案 A：支持 CNAME 根域名（推荐）
| 类型 | 主机记录 | 记录值 | TTL |
|------|----------|--------|-----|
| CNAME | @ | `vnke-knowledge.netlify.app` | 自动 |
| CNAME | www | `vnke-knowledge.netlify.app` | 自动 |

#### 方案 B：不支持 CNAME 根域名
| 类型 | 主机记录 | 记录值 | TTL |
|------|----------|--------|-----|
| A | @ | 75.2.60.5 | 自动 |
| CNAME | www | `vnke-knowledge.netlify.app` | 自动 |

> **说明**：`75.2.60.5` 是 Netlify 的固定 IP，用于根域名解析。

### 4. 等待生效
- DNS 传播时间：通常 5 分钟 - 24 小时
- Netlify 会自动检测并启用 HTTPS（约 5-10 分钟）

### 5. 验证配置
```bash
# 检查解析
dig vnke.com
dig www.vnke.com

# 检查 HTTPS
curl -I https://vnke.com
```

---

## ⚠️ 常见问题

### Q: 为什么 HTTPS 证书申请失败？
A: 确保 DNS 记录已生效，Netlify 需要验证域名所有权。

### Q: 根域名无法用 CNAME 怎么办？
A: 使用 A 记录指向 `75.2.60.5`，或使用注册商提供的 **ALIAS/ANAME** 功能。

### Q: 如何移除旧配置？
A: 删除所有指向 GitHub Pages 的 CNAME/A 记录，只保留 Netlify 配置。

---

**配置完成后，访问 https://vnke.com 即可看到新网站！** 🚀
