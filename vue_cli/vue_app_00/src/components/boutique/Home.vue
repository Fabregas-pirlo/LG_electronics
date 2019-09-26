<template>
  <div class="page-wrap">
    <mt-tab-container v-model="active">
      <mt-tab-container-item id="index">
        <div class="chaos">
          <!-- 搜索框 -->
          <div class="top">
            <div class="search">
              <input type="text" placeholder="请输入搜索内容">
            </div>
          </div>
          <!-- logo -->
          <div class="logo">
            <div class="lg"></div>
            <span>LG电子官方直销旗舰店</span>
          </div>
        </div>
        
        <carousel
          :firstImage="require('../../assets/carousel1.png')"
          :secondImage="require('../../assets/carousel2.png')"
          :thirdImage="require('../../assets/carousel3.png')"
          :fourthImage="require('../../assets/carousel4.png')"
          :fifthImage="require('../../assets/carousel5.png')"
    
        ></carousel>

        <!-- 热门推荐 -->
        <div class="recommend">
          <div class="recommend2"></div>
          <div class="goods">
              <router-link :to="'/detail/'+p1.lid" class="one"></router-link>
              <div v-text="p1.lname"></div>
              <span>￥{{p1.price.toFixed(2)}}</span>  
          </div>

          <div class="goods">
              <router-link :to="'/detail/'+p2.lid" class="two"></router-link>
              <div v-text="p2.lname"></div>
              <span>￥{{p2.price.toFixed(2)}}</span>  
          </div>

          <div class="goods">
              <router-link :to="'/detail/'+p3.lid" class="three"></router-link>
              <div v-text="p3.lname"></div>
              <span>￥{{p3.price.toFixed(2)}}</span>  
          </div>

          <div class="goods">
              <router-link :to="'/detail/'+p4.lid" class="four"></router-link>
              <div>LG冰箱F448MC12B</div>
              <span>￥{{p4.price.toFixed(2)}}</span>  
          </div>

          <div class="goods">
              <router-link :to="'/detail/'+p5.lid" class="five"></router-link>
              <div>LG电视OLED55E9P</div>
              <span>￥{{p5.price.toFixed(2)}}</span>  
          </div>

          <div class="goods">
              <router-link :to="'/detail/'+p6.lid" class="six"></router-link>
              <div>LG电视OLED65W9PCA</div>
              <span>￥{{p6.price.toFixed(2)}}</span>  
          </div>
          
          
        </div>
        
      </mt-tab-container-item>
      
      <mt-tab-container-item id="all">
        <product></product>
      </mt-tab-container-item>

      <mt-tab-container-item id="cart">
        <cart :goToCart="goToCart"></cart>
      </mt-tab-container-item>

      <mt-tab-container-item id="center">
        <center></center>
      </mt-tab-container-item>
    </mt-tab-container>

    <mt-tabbar fixed v-model="active">
      <mt-tab-item id="index" @click.native="changeState(0)">
        <tabbaricon
          :selectedImage="require('../../assets/host_selected.png')"
          :normalImage="require('../../assets/host_normal.png')"
          :focused="currentIndex[0].isSelect"
        ></tabbaricon>首页
      </mt-tab-item>

      <mt-tab-item id="all" @click.native="changeState(1)">
        <tabbaricon
          :selectedImage="require('../../assets/all_selected.png')"
          :normalImage="require('../../assets/all_normal.png')"
          :focused="currentIndex[1].isSelect"
        ></tabbaricon>全部商品
      </mt-tab-item>

      <mt-tab-item id="cart" @click.native="changeState(2)" >
        
        <div class="ciao">
          <div class="shrinkCart">{{$store.getters.getCartCount}}</div>
          <tabbaricon
          :selectedImage="require('../../assets/cart_selected.png')"
          :normalImage="require('../../assets/cart_normal.png')"
          :focused="currentIndex[2].isSelect"
          ></tabbaricon>购物车
        </div>
        
      </mt-tab-item>

      <mt-tab-item id="center" @click.native="changeState(3)">
        <tabbaricon
          :selectedImage="require('../../assets/ic_me_selected.png')"
          :normalImage="require('../../assets/ic_me_normal.png')"
          :focused="currentIndex[3].isSelect"
        ></tabbaricon>个人中心
      </mt-tab-item>
    </mt-tabbar>
  </div>
</template>

<script>
import TabBarIcon from "./common/TarBarIcon.vue";
import Carousel from "./common/Carousel.vue";
import Product from "./common/Product.vue"
import Cart from "./common/Cart.vue"
import Center from "./common/Center.vue"
import Detail from "./common/Detail.vue"

export default {
  data() {
    return {
      active: "index",
      currentIndex: [
        { isSelect: true },
        { isSelect: false },
        { isSelect: false },
        { isSelect: false }
      ],
      p1:{},
      p2:{price:0,href:""},
      p3:{price:0,href:""},
      p4:{price:0,href:""},
      p5:{price:0,href:""},
      p6:{price:0,href:""},
      goToCart:false
    };
  },
  created(){
    this.axios.get("/host2detail")
    .then(result=>{
      console.log(result.data);
      this.p1=result.data.data[0];
      this.p2=result.data.data[1];
      this.p3=result.data.data[2];
      this.p4=result.data.data[3];
      this.p5=result.data.data[4];
      this.p6=result.data.data[5];
      
      
    })
  },
  components: {
    tabbaricon: TabBarIcon,
    carousel: Carousel,
    product: Product,
    cart:Cart,
    center:Center,
    detail:Detail,
  },
  methods: {
    // 跳转到购物车需要刷新状态
    // freshCart(){
    //   if()
    //   this.goToCart = true;
    // },
    changeState(n) {
      for (var i = 0; i < this.currentIndex.length; i++) {
        if (n == i) {
          this.currentIndex[i].isSelect = true;
        } else {
          this.currentIndex[i].isSelect = false;
        }
      }
    }
  },
  watch: {
    active() {
      if(this.active=='cart') {
        this.goToCart = true;
      }else {
        this.goToCart = false;
      }
    }
  }
};
</script>

<style scoped>
  .ciao{
    position: relative;
  }
  .shrinkCart{
    position: absolute;
    width:14px;
    height:14px;
    border:1px solid red;
    color:red;
    border-radius: 50%;
    top:-2px;
    left:57px;
    
  } 
  .chaos{
    background:rgb(240, 98, 58);
    width:100%;
    height:200px;
    /* border:1px solid #ddd; */
  }
  .top{
    width:100%;
    background:  rgb(226, 86, 61);
    opacity: 0.6;
    }
  .logo{
    width:100%;
    position:relative;
  }
  .lg{
    background: url(../../assets/lg02.png) no-repeat;
    border-radius:50%;
    background-size: 100%;
    float: left;
    width: 130px;
    height:130px;
    position: absolute;
    left:120px;
  }
  .logo>span{
    position: absolute;
    top:140px;
    left:100px;
    font-weight:normal;
    color:#fff;
  }
  
  .search>input{
    position:relative;
    margin: 0 auto;
    width:100%;
    height:26px;
    border-radius: 10px;
    background: url(../../assets/zoom.png) no-repeat center left;
    background-size:6%; 
    padding-left:30px;
  }
  .recommend{
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    width: 100%;
    
    /* border:1px solid #000; */
  }
  .recommend2{
    background: url(../../assets/recommend2.png) no-repeat;
    background-size:50%;
    width:300px;
    height:30px;
    margin-left: 126px;
  }
  .goods{
    /* border:1px solid #000; */
    width:49%;
    height:206px;
  }
  .recommend>.goods>.one{
    background: url(../../assets/1.png) no-repeat;
    background-size: 80%;
    float:left;
    width: 170px;
    height:165px;
  }
  .recommend>.goods>.two{
    background: url(../../assets/2.png) no-repeat;
    background-size: 80%;
    float:left;
    width: 170px;
    height:165px;
  }
  .recommend>.goods>.three{
    background: url(../../assets/3.png) no-repeat;
    background-size: 80%;
    float:left;
    width: 170px;
    height:165px;
  }
  .recommend>.goods>.four{
    background: url(../../assets/4.png) no-repeat;
    background-size: 80%;
    float:left;
    width: 170px;
    height:165px;
  }
  .recommend>.goods>.five{
    background: url(../../assets/26.png) no-repeat;
    background-size: 115%;
    float:left;
    width: 170px;
    height:165px;
  }
  .recommend>.goods>.six{
    background: url(../../assets/6.png) no-repeat;
    background-size: 100%;
    float:left;
    width: 170px;
    height:165px;
  }
  .recommend>.goods>div{
    font-weight:normal;
    padding: 0;

  }
  .recommend>.goods>span{
    color:red;
    font-size:13px;
    margin-left:56px;
  }
 

</style>