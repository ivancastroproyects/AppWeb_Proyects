<template>
  <div>
    <h1>{{ header }}</h1>
      <form @submit.prevent="loginManager(username, password)">
        <label class="form" for='username'>Username:</label>
        <input class="form" type="text" v-model="username">
        <label class="form" for='password'>Password:</label>
        <input class="form" type="text" v-model="password">
        <button type="submit">Submit</button>
    </form>
  </div>
</template>

<script>
import UserService from '../services/userService'
export default {
  data () {
    return {
      header: 'Login',
      username: '',
      password: ''
    }
  },
  methods: {
    async loginManager (username, password) {
      try {
        await UserService.login({
          username: username,
          password: password
        })
        alert('Logged in')
        this.$store.commit('toggleLoggedin')
      } catch (e) {
        console.log(e)
        alert('error logging in')
      }
    }
  }
}
</script>

<style scoped lang='scss'>
* {
  font-size: 16px;
}

h1 {
  font-size: 3em;
}

form {
  width: 30em;
  height: 20em;
  margin: auto;
  button {
    display: block;
    margin: auto;
    width: 10em;
  }
  .form {
    margin-bottom: 1em;
    width: 10em;
    display: inline-block;
    line-height: 1.5em;
  }
}
</style>
