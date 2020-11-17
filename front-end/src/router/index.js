import Vue from 'vue'
import Router from 'vue-router'
import home from '@/components/home'
import User from '@/components/User'
import SignUp from '@/components/SignUp'
import LogIn from '@/components/LogIn'
import ChartManager from '@/components/ChartManager'
import WorkingTime from '@/components/WorkingTime'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'home',
      component: home
    },
    {
      path: '/signup',
      name: 'signup',
      component: SignUp
    },
    {
      path: '/login',
      name: 'login',
      component: LogIn
    },
    {
      path: '/user',
      name: 'user',
      component: User
    },
    {
      path: '/chartmanager',
      name: 'chartmanager',
      component: ChartManager
    },
    {
      path: '/workingtime',
      name: 'workingtime',
      component: WorkingTime
    }
  ]
})
