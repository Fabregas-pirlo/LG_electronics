import Vue from 'vue'
import Router from 'vue-router'

import Home from "./components/boutique/Home.vue"
import Login from "./components/boutique/common/Login.vue"
import Product from "./components/boutique/common/Product.vue"
import Cart from "./components/boutique/common/Cart.vue"
import Center from "./components/boutique/common/Center.vue"
import Detail from "./components/boutique/common/Detail.vue"
import Scroll from "./components/boutique/common/Scroll.vue"
import Address from "./components/boutique/common/Address.vue"

Vue.use(Router)
export default new Router({
  routes: [
    {path:'/Home',component:Home},
    {path:'/',component:Home},
    {path:'/login',component:Login},
    {path:'/product',component:Product},
    {path:'/center',component:Center},
    {path:'/cart',component:Cart},
    {path:'/scroll',component:Scroll},
    {path:'/address',component:Address},
    {path:'/detail/:lid',component:Detail,props:true},
  ]
})
