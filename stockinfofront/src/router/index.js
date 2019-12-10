import Vue from 'vue'
import Router from 'vue-router'
import Searchbox from '@/components/Searchbox'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Searchbox',
      component: Searchbox
    }
  ]
})
