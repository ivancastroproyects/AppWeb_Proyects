<template>
  <div>
    <h1>{{ header }}</h1>

    <div class="error" v-if="errors.length">
      <p>
        <b>Please correct the following error(s):</b>
        <ul>
          <li v-for="(error, i) in errors" :key="i">{{ error }}</li>
        </ul>
      </p>
    </div>

    <form @submit.prevent="createManager(username, password)">
      <label class="form" for='username'>Username:</label>
      <input class="form" type="text" v-model="username">
      <label class="form" for='password'>Password:</label>
      <input class="form" type="text" v-model="password">
      <label class="form" for='confirm password'>Confirm Password:</label>
      <input class="form" type="text" v-model="confirmedPw">
      <button type="submit">Submit</button>
    </form>
  </div>
</template>

<script>
import UserService from '../services/userService'
export default {
  data () {
    return {
      header: 'Register',
      username: null,
      password: null,
      confirmedPw: null,
      errors: []
    }
  },
  methods: {
    async createManager (username, password) {
      this.errors = []
      if (!this.username) {
        this.errors.push('Name required.')
        return
      }
      if (!this.password) {
        this.errors.push('Password required.')
        return
      }
      if (!this.confirmedPw || this.confirmedPw !== this.password) {
        this.errors.push('Please enter the same password again.')
        return
      }
      try {
        await UserService.register({
          username: username,
          password: password
        })
        alert('Manager has successfully registered')
      } catch (err) {
        alert(err)
      }
    }
  }
}
</script>

<style scoped lang='scss'>

* {
  font-size: 16px;
}

.error{
  color: red;
  ul {
    list-style: none;
  }
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

h1 {
  font-size: 3em;
}

</style>
