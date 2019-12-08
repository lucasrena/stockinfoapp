import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Searchbox2 from '@/components/Searchbox2'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Searchbox2',
      component: Searchbox2
    }
  ]
})
