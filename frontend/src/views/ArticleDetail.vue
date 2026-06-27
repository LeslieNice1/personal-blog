<template>
  <div class="article">
    <!-- 返回按钮 -->
    <el-button text @click="$router.push('/')" style="margin-bottom:16px;">
      ← 返回文章列表
    </el-button>

    <article class="article-content">
      <div class="tag-row">
        <span class="cat-tag" style="background:#e74c3c;color:white;padding:4px 14px;border-radius:12px;font-size:13px;">Java后端</span>
        <span class="read-time">阅读约 8 分钟</span>
      </div>

      <h1>Spring Boot + Vue 3 前后端分离项目实战</h1>

      <div class="meta">
        <span>📅 2024-06-20</span>
        <span>👁 阅读 1256</span>
        <span>💬 23 条评论</span>
      </div>

      <el-divider />

      <div class="body">
        <h2>一、项目背景与目标</h2>
        <p>作为一名即将毕业的计算机专业学生，我决定通过实际项目来巩固所学的 Java 和前端技术。前后端分离是当前最主流的 Web 开发架构，掌握它对求职非常重要。因此，我选择从零搭建一个<strong>线上订餐系统</strong>，作为学习成果的展示。</p>

        <h2>二、技术选型</h2>
        <p>本项目采用以下技术栈：</p>
        <ul>
          <li><strong>后端：</strong>Spring Boot 3 + MyBatis + MySQL + Redis（缓存）</li>
          <li><strong>前端：</strong>Vue 3 (Composition API) + Vite + Element Plus + Axios</li>
          <li><strong>工具：</strong>Maven、npm、Git</li>
          <li><strong>部署：</strong>Nginx 反向代理 + Docker 容器化</li>
        </ul>

        <h2>三、核心功能实现</h2>

        <h3>3.1 RESTful API 设计</h3>
        <p>遵循 REST 规范设计接口，使用 HTTP 方法表达语义：</p>
        <pre class="code-block">GET    /api/restaurant/list     获取餐厅列表
GET    /api/restaurant/{id}     获取餐厅详情
GET    /api/menu/list?rid={id} 获取菜单
POST   /api/order/create       创建订单
GET    /api/order/user/{id}    查询用户订单</pre>

        <h3>3.2 购物车状态管理</h3>
        <p>购物车数据在前端使用响应式数组管理，同时持久化到 localStorage，解决刷新丢失问题。核心逻辑：</p>
        <pre class="code-block">const cart = ref(JSON.parse(localStorage.getItem('cart') || '[]'))

// 加入购物车时同步到 localStorage
function addToCart(item) {
  // ... 更新 cart 数组 ...
  localStorage.setItem('cart', JSON.stringify(cart.value))
}</pre>

        <h3>3.3 订单创建流程</h3>
        <p>订单创建涉及多个步骤：校验购物车 → 计算金额 → 锁定库存 → 生成订单号 → 扣减库存。这里使用了数据库乐观锁来防止超卖。</p>

        <h2>四、遇到的问题与解决方案</h2>

        <div class="problem-card">
          <h4>❌ 问题：跨域请求被浏览器拦截</h4>
          <p>前端运行在 localhost:5173，后端在 localhost:8080，浏览器因同源策略阻止了请求。</p>
          <h4>✅ 解决方案：</h4>
          <p>在 Spring Boot 后端添加 CORS 配置，允许指定来源的跨域请求；同时在 Vite 中配置 proxy 开发代理。</p>
        </div>

        <div class="problem-card" style="margin-top:16px;">
          <h4>❌ 问题：并发下单导致库存不一致</h4>
          <p>多个用户同时购买同一菜品，可能出现超卖。</p>
          <h4>✅ 解决方案：</h4>
          <p>使用乐观锁机制，在商品表增加 version 字段，更新时带上版本号条件。</p>
        </div>

        <h2>五、项目收获</h2>
        <ol>
          <li>深入理解了前后端分离架构的设计思想</li>
          <li>掌握了 Vue 3 Composition API 的使用技巧</li>
          <li>学会了 MyBatis 的 XML 映射和动态 SQL</li>
          <li>理解了 RESTful API 的设计规范</li>
          <li>积累了调试和排错的实际经验</li>
        </ol>
      </div>
    </article>
  </div>
</template>

<script setup>
import { ref } from 'vue'
</script>

<style scoped>
.article { max-width: 800px; margin: 0 auto; padding: 24px; }
.article-content { background:#fff; border-radius:12px; padding:32px; }
.tag-row { display:flex; align-items:center; gap:12px; margin-bottom:16px; }
.read-time { color:#999; font-size:13px; }
h1 { font-size:26px; line-height:1.5; margin:0 0 12px; }
.meta { display:flex; gap:20px; color:#999; font-size:13px; }

.body h2 { font-size:20px; margin-top:28px; padding-bottom:8px; border-bottom:2px solid #667eea; display:inline-block; }
.body h3 { font-size:17px; margin-top:22px; color:#333; }
.body p { line-height:1.9; color:#444; font-size:15px; margin-bottom:10px; }
.body ul, .body ol { padding-left:24px; line-height:1.9; color:#444; }
.body ul li, .body ol li { margin-bottom:6px; }
.code-block {
  background:#282c34; color:#abb2bf;
  border-radius:8px; padding:16px;
  font-family:'Consolas','Monaco',monospace;
  font-size:13px; line-height:1.7;
  overflow-x:auto; margin:12px 0;
}
.problem-card {
  background:#fff8f0; border-left:4px solid #f39c12;
  padding:18px; border-radius:0 8px 8px 0;
}
.problem-card h4 { margin:0 0 6px; font-size:15px; }
.problem-card p { margin:0 0 6px; font-size:14px; color:#555; line-height:1.7; }
</style>
