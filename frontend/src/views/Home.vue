<template>
  <div class="blog">
    <!-- 顶部横幅 -->
    <div class="banner">
      <h1>📝 我的博客</h1>
      <p>记录技术成长之路，分享学习心得</p>
    </div>

    <!-- 文章列表 -->
    <div v-for="a in articles" :key="a.id" class="article-card" @click="$router.push('/article/' + a.id)">
      <div class="card-left">
        <span class="cat-tag" :style="{background: a.catColor}">{{ a.category }}</span>
        <h3>{{ a.title }}</h3>
        <p>{{ a.summary }}</p>
        <div class="meta">
          <el-icon><Calendar /></el-icon> {{ a.date }}
          <el-icon><View /></el-icon> 阅读 {{ a.views }}
          <el-icon><ChatDotRound /></el-icon> {{ a.comments }} 条评论
        </div>
      </div>
      <div class="card-right" :style="{background: a.coverColor}">
        <span style="font-size:36px;">{{ a.icon }}</span>
      </div>
    </div>

    <!-- 分页 -->
    <div class="pagination">
      <el-pagination layout="prev, pager, next" :total="30" :page-size="5" />
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { Calendar, View, ChatDotRound } from '@element-plus/icons-vue'

const articles = ref([
  {
    id: 1,
    title: 'Spring Boot + Vue 3 前后端分离项目实战',
    summary: '从零搭建一个完整的订餐系统，涵盖RESTful API设计、JWT认证、Vue组件化开发等核心技术点，适合初学者入门前后端分离架构。',
    category: 'Java后端',
    catColor: '#e74c3c',
    date: '2024-06-20',
    views: 1256,
    comments: 23,
    icon: '☕',
    coverColor: 'linear-gradient(135deg, #667eea, #764ba2)'
  },
  {
    id: 2,
    title: 'Vue 3 Composition API 完全指南',
    summary: '深入理解 Vue 3 的组合式 API，对比 Options API 的优劣，掌握 ref、reactive、computed、watch 等核心概念，附带大量实战案例。',
    category: '前端开发',
    catColor: '#42b883',
    date: '2024-06-15',
    views: 892,
    comments: 18,
    icon: '💚',
    coverColor: 'linear-gradient(135deg, #f093fb, #f5576c)'
  },
  {
    id: 3,
    title: 'MySQL 索引优化实战经验总结',
    summary: '结合实际项目中的慢查询案例，讲解索引原理、EXPLAIN 分析方法、联合索引最左前缀原则，以及分库分表的基本思路。',
    category: '数据库',
    catColor: '#3498db',
    date: '2024-06-10',
    views: 1567,
    comments: 34,
    icon: '🗄️',
    coverColor: 'linear-gradient(135deg, #4facfe, #00f2fe)'
  },
  {
    id: 4,
    title: 'Git 工作流与团队协作最佳实践',
    summary: '从 Git 基本操作到分支策略（Git Flow / GitHub Flow），再到 Code Review 流程，全面介绍团队开发中 Git 的正确使用方式。',
    category: '工程工具',
    catColor: '#f39c12',
    date: '2024-06-05',
    views: 654,
    comments: 12,
    icon: '🔀',
    coverColor: 'linear-gradient(135deg, #fa709a, #fee140)'
  },
  {
    id: 5,
    title: '我的 2024 年技术学习路线规划',
    summary: '作为一名即将毕业的计算机专业学生，分享我制定的技术学习计划：Java 全栈方向的学习路径、面试准备、开源项目参与计划等。',
    category: '个人随笔',
    catColor: '#9b59b6',
    date: '2024-06-01',
    views: 2130,
    comments: 56,
    icon: '🎯',
    coverColor: 'linear-gradient(135deg, #a18cd1, #fbc2eb)'
  }
])
</script>

<style scoped>
.blog { padding: 24px; max-width: 900px; margin: 0 auto; }
.banner {
  background: linear-gradient(135deg, #667eea, #764ba2);
  border-radius: 14px;
  padding: 40px;
  color: white;
  margin-bottom: 28px;
  text-align: center;
}
.banner h1 { margin: 0 0 8px; font-size: 28px; }
.banner p { margin: 0; opacity: 0.85; }

.article-card {
  display: flex;
  justify-content: space-between;
  border: 1px solid #eee;
  border-radius: 12px;
  padding: 22px;
  margin-bottom: 16px;
  cursor: pointer;
  transition: all 0.25s;
  background: #fff;
}
.article-card:hover {
  box-shadow: 0 4px 20px rgba(0,0,0,0.08);
  transform: translateY(-2px);
}
.card-left { flex: 1; margin-right: 20px; }
.card-right {
  width: 100px;
  height: 100px;
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
}
.cat-tag {
  display: inline-block;
  color: white;
  padding: 2px 12px;
  border-radius: 12px;
  font-size: 12px;
  margin-bottom: 10px;
}
.card-left h3 { margin: 0 0 8px; font-size: 17px; line-height: 1.5; }
.card-left p { margin: 0 0 12px; color: #888; font-size: 13px; line-height: 1.6; }
.meta {
  display: flex; gap: 16px; align-items: center;
  color: #aaa; font-size: 13px;
}
.meta .el-icon { vertical-align: middle; margin-right: 2px; }
.pagination { text-align: center; margin-top: 30px; }
</style>
