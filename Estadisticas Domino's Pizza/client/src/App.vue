<template>
  <div id="app">
    <Nav></Nav>
    <router-view/>
  </div>
</template>

<script>
import Nav from '@/components/Nav'
export default {
  components: {
    Nav
  }
}
</script>

<style lang='scss'>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

button {
  border: 0 none;
  border-radius: 10px;
  color: #FFFFFF;
  background-color: #161616;
  margin: 10px;
  padding: 12px 12px;
  font-size: 0.8em;
  font-weight: 500;
  line-height: 1.3;
  cursor: pointer;
  opacity: 1;
  transition: opacity 300ms linear;
  width: 10vw;

  &:hover {
  opacity: 0.7;
  }
}
</style>
