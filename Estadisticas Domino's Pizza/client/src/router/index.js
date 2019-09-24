import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import Login from '@/components/Login'
import Register from '@/components/Register'
import Users from '@/components/Users'
import Pizza from '@/components/Pizza'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/register',
      name: 'Register',
      component: Register
    },
    {
      path: '/users',
      name: 'Users',
      component: Users
    },
    {
      path: '/pizza',
      name: 'Pizza',
      component: Pizza
    },
    {path: '*', redirect: '/'}
  ],
  mode: 'history'
})
