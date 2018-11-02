<template>
  <div id="app">
    <sidebar/>
    <!--<img src="./assets/logo_me.png">-->
    <router-view/>
  </div>
</template>

<script>
import Sidebar from '@/components/UIComponents/SidebarPlugin/Sidebar'

export default {
  name: 'App',
  components: {Sidebar}
}
</script>

<style>
body {
  color: #FFFFFF;
}
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  margin-top: 60px;
  background-color: #2c3e50;
}
</style>
