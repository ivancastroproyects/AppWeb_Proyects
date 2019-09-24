import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const state = {
  isLoggedin: false
}

const mutations = {
  toggleLoggedin: state => {
    state.isLoggedin = !state.isLoggedin
  }
}

export default new Vuex.Store({
  state,
  mutations
})
