<template>
  <div>
    <div v-if="this.$store.state.isLoggedin">
      <h1>{{ header }}</h1>
      <table class="tb">
        <tr>
          <th>User Name</th>
          <th>Gender</th>
          <th>Birthday</th>
          <th>Action</th>
        </tr>
        <tr v-for='(user, index) in usersData' :key='user[index]'>
          <td> {{ user.name }} </td>
          <td> {{ user.gender }} </td>
          <td> {{ user.birthday }} </td>
          <td>
            <button @click="showEditUser(user, index)" id="edit">Edit</button>
            <button @click="deleteUser(user.name, index)" id="delete">Delete</button>
          </td>
        </tr>
      </table>
      <!-- create user function below -->
      <button @click="createButtonClicked" class="create">Create User</button>
      <form v-if="isCreateClicked" @submit.prevent="createUser">
        <label for="Name">Name</label>
        <input type="text" v-model="newUser.name">

        <label for="Birthday">Birthday</label>
        <input type="date" v-model="newUser.bday">

        <label for="Gender">Gender</label>
        <select name="gender" v-model="newUser.gender">
          <option v-for="(g, index) in sex"
          :key="index" :value="{g}"> {{ g }}</option>
        </select>

        <button type="submit">Submit</button>
      </form>

      <!-- edit user function below -->
       <form v-if="isEditClicked" @submit.prevent="editUser">
        <label for="Name">Name</label>
        <input type="text" v-model="actualUser.name">

        <label for="Birthday">Birthday</label>
        <input type="date" v-model="actualUser.bday">

        <label for="Gender">Gender</label>
        <select name="gender" v-model="actualUser.gender">
          <option v-for="(g, index) in sex"
          :key="index" :value="{g}"> {{ g }}</option>
        </select>

        <button type="submit">Submit</button>
      </form>

    </div>
    <div v-if="!this.$store.state.isLoggedin" class="noLogin">
      <h1>You are not logged in</h1>
      <h3>Please log in to manager users</h3>
    </div>
  </div>
</template>

<script>
import UserService from '../services/userService'
export default {
  data () {
    return {
      header: 'Users',
      isCreateClicked: false,
      isEditClicked: false,
      usersData: [],
      sex: ['M', 'F'],
      newUser: {
        name: '',
        bday: '',
        gender: ''
      },
      actualUser: {
        name: '',
        bday: '',
        gender: ''
      }
    }
  },
  mounted () {
    this.fetchData()
  },
  methods: {
    async createUser () {
      try {
        await UserService.createUser({
          name: this.newUser.name,
          gender: this.newUser.gender.g,
          birthday: this.newUser.bday
        })
        this.fetchData()
      } catch (e) {
        alert(e)
      }
    },
    async deleteUser (uName, index) {
      try {
        await UserService.deleteUser(uName)
        this.$delete(this.usersData, index)
      } catch (e) {
        alert(e)
      }
    },
    async editUser () {
      try {
        await UserService.editUser({
          name: this.actualUser.name,
          gender: this.actualUser.gender.g,
          birthday: this.actualUser.bday
        })
        this.fetchData()
      } catch (e) {
        alert(e)
      }
      this.isEditClicked = false
    },
    createButtonClicked () {
      this.isCreateClicked = !this.isCreateClicked
    },
    async fetchData () {
      const usersData = (await UserService.fetchUsers()).data.user
      this.usersData = usersData
    },
    showEditUser (user, index) {
      this.actualUser.name = user.name
      this.actualUser.gender = user.gender.g
      this.actualUser.bday = user.bday
      this.isEditClicked = true
      console.log(this.isEditClicked)
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

.create {
  margin: 1em;
}
label {
  display: block;
}

.tb {
  border:1px solid #dedede;
  display: table; width: 50%;
  margin: auto;
  padding: 1rem;
}

form {
  width: 40em;
  margin: auto;
  input {
    line-height: 1.5em;
    margin: 10px 0 10px 0;
  }
  select {
    width: 4em;
    height: 2em;
    margin: 10px auto 10px auto;
    display: block;
  }
}
</style>
