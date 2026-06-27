<template>
  <div class="blog">
    <h2>文章列表</h2>
    <div v-for="a in articles" :key="a.id" class="article-card" @click="$router.push('/article/' + a.id)">
      <h3>{{ a.title }}</h3>
      <p>{{ a.summary }}</p>
      <small>阅读：{{ a.views }} | {{ a.createTime }}</small>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const articles = ref([])

onMounted(() => {
  axios.get('/api/article/list').then(res => articles.value = res.data.data)
})
</script>

<style scoped>
.blog { padding:20px; max-width:900px; margin:0 auto; }
.article-card { border-bottom:1px solid #eee; padding:15px 0; cursor:pointer; }
.article-card:hover { background:#f5f5f5; }
</style>
