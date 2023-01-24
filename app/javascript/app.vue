<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>




export default {
  name: 'app',
  created() {
    console.log('** App Created!! **') // createの確認用
  },
  mounted() {
    console.log('-- App Mounted!! --') // mountedの確認用
  },
  data() {
    return {
      title: 'Router'
    }
  }
}
</script>

<style scoped>
</style>
