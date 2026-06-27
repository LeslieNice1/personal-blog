# 个人博客系统

基于 Spring Boot + Vue 3 的个人博客平台，支持文章的发布、浏览、搜索等功能。

## 技术栈

### 后端
- Java 17 + Spring Boot 3.2
- MyBatis-Plus
- MySQL 8.0
- Lombok

### 前端
- Vue 3 + Vite
- Element Plus
- Axios
- Vue Router

## 功能模块

| 模块 | 功能 |
|------|------|
| 文章模块 | 文章列表、文章详情、发布文章、编辑文章 |
| 分类模块 | 文章分类管理 |
| 用户模块 | 用户注册、登录 |

## 快速启动

### 后端

```bash
mysql -u root -p < backend/sql/init.sql
cd backend
mvn spring-boot:run
```

### 前端

```bash
cd frontend
npm install
npm run dev
```

## 作者

曹成 - 2026 届本科应届生
