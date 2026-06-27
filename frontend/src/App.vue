<template>
  <div id="app">
    <el-container>
      <el-header>
        <h2 @click="$router.push('/')" style="cursor:pointer;">我的博客</h2>
      </el-header>
      <el-main>
        <router-view/>
      </el-main>
    </el-container>
  </div>
</template>
