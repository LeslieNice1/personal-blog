<template>
  <div class="article-detail" v-if="article">
    <h2>{{ article.title }}</h2>
    <div class="meta">
      <span>作者ID：{{ article.authorId }}</span> |
      <span>阅读：{{ article.views }}</span> |
      <span>{{ article.createTime }}</span>
    </div>
    <hr/>
    <div class="content">{{ article.content }}</div>
  </div>
  <div v-else>加载中...</div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import axios from 'axios'

const route = useRoute()
const article = ref(null)

onMounted(() => {
  axios.get('/api/article/' + route.params.id).then(res => {
    article.value = res.data.data
  })
})
</script>

<style scoped>
.article-detail { padding:20px; max-width:900px; margin:0 auto; }
.meta { color:#999; margin:10px 0; }
.content { line-height:1.8; margin-top:20px; white-space:pre-wrap; }
</style>
