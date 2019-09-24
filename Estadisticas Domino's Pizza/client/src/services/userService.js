import Api from '@/services/Api'

export default {
  // users data
  createUser (credentials) {
    return Api().post('users', credentials)
  },
  fetchUsers () {
    return Api().get('users')
  },
  editUser (credentials) {
    return Api().post('edit', credentials)
  },
  deleteUser (credentials) {
    return Api().delete(`users?name=${credentials}`)
  },

  // pizzas data
  sendPizza (pizzaCount) {
    return Api().post('pizza', pizzaCount)
  },
  getPizza () {
    return Api().get('pizza')
  },

  // managers data
  register (credentials) {
    return Api().post('register', credentials)
  },
  login (credentials) {
    return Api().post('login', credentials)
  }
}
