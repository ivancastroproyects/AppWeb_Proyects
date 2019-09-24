<template>
  <div class='nav'>
    <ul class='nav-list'>
      <li class='nav-item' v-for='(item, index) in items' @click='navigatePage(index)'
        :key=item[index]>{{ item }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data () {
    return {
      items: ['Home', 'Login', 'Register', 'Users', 'Pizza']
    }
  },
  methods: {
    navigatePage (i) {
      this.$router.push({ path: `/${this.items[i]}` })
    }
  }
}
</script>

<style scoped lang='scss'>

ul {
  list-style-type: none;
  padding: 0;
}
.nav-item {
  display: inline-block;
  margin: 0 10px;
  &:hover {
    cursor: pointer;
  }
}

</style>
