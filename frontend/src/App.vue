<template>
  <div id="app">
    <el-container>
      <el-header class="header">
        <h2 @click="$router.push('/')" style="cursor:pointer;">📝 我的个人博客</h2>
        <span class="header-sub">技术分享 · 学习记录 · 成长足迹</span>
      </el-header>
      <el-main style="padding:0; background:#f5f7fa;">
        <router-view/>
      </el-main>
    </el-container>
  </div>
</template>

<script setup>
</script>

<style>
* { margin: 0; padding: 0; box-sizing: border-box; }
.header {
  background: linear-gradient(135deg, #43e97b, #38f9d7);
  color: white;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 16px 30px !important;
}
.header h2 { font-size: 22px; }
.header-sub { font-size: 13px; opacity: 0.85; margin-top: 4px; }
</style>
