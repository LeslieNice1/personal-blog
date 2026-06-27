# 📝 个人博客系统

> 一个基于 Spring Boot + Vue 3 的个人博客平台，支持文章发布、浏览、评论等功能。

## ✨ 功能特性

- 📝 **文章管理**：发布、编辑、删除文章
- 📋 **文章列表**：分页浏览，支持按分类筛选
- 📖 **文章详情**：Markdown 风格渲染，代码高亮
- 💬 **评论系统**：读者互动，留言交流
- 🔍 **搜索功能**：按关键词搜索文章

## 🛠 技术栈

### 后端
- Spring Boot 3.x
- MyBatis
- MySQL
- Spring Security（JWT认证）

### 前端
- Vue 3 (Composition API)
- Vite
- Element Plus
- Vue Router
- Axios
- marked（Markdown解析）

## 🚀 快速启动

### 前端（无需后端即可预览！）

本项目已内置**演示数据**，无需配置后端和数据库即可查看完整界面效果！

```bash
# 1. 克隆项目
git clone https://github.com/LeslieNice1/personal-blog.git
cd personal-blog/frontend

# 2. 安装依赖
npm install

# 3. 启动开发服务器
npm run dev
```

访问：http://localhost:5174/ 即可查看完整界面！

### 后端（可选，完整功能需要）

```bash
# 1. 配置数据库（MySQL 8.0+）
# 创建数据库：personal_blog
# 导入 backend/src/main/resources/schema.sql

# 2. 修改配置文件
# 编辑 backend/src/main/resources/application.properties
# 填写你的数据库用户名和密码

# 3. 启动后端
cd backend
mvn spring-boot:run
```

后端运行在：http://localhost:8081/

## 📸 界面预览

### 文章列表页
![文章列表](./screenshots/home.png)

### 文章详情页
![文章详情](./screenshots/article-detail.png)

## 📂 项目结构

```
personal-blog/
├── backend/                # Spring Boot 后端
│   ├── src/main/java/      # Java 源代码
│   ├── src/main/resources/ # 配置文件、SQL脚本
│   └── pom.xml            # Maven 配置
└── frontend/              # Vue 3 前端
    ├── src/views/          # 页面组件
    ├── src/router/        # 路由配置
    ├── src/api/           # API 调用封装
    └── package.json       # npm 配置
```

## 🎯 核心功能讲解（面试必备）

### 1. Vue 3 Composition API 使用

使用 `ref`、`computed`、`onMounted` 等组合式 API：

```javascript
import { ref, computed, onMounted } from 'vue'

const articles = ref([])
const total = computed(() => articles.value.length)

onMounted(() => {
  // 页面加载时获取数据
  fetchArticles()
})
```

### 2. RESTful API 设计

```
GET    /api/article/list       获取文章列表（分页）
GET    /api/article/{id}      获取文章详情
POST   /api/article/create    发布新文章
PUT    /api/article/update     更新文章
DELETE /api/article/{id}     删除文章
```

### 3. 文章详情页渲染

使用 `marked` 库将 Markdown 转换为 HTML：

```javascript
import { marked } from 'marked'

const renderedContent = computed(() => {
  return marked(article.value.content)
})
```

## 📧 联系我

- GitHub：[@LeslieNice1](https://github.com/LeslieNice1)
- 邮箱：xxxx@example.com

---

⭐ 如果这个项目对你有帮助，欢迎给个 Star！
