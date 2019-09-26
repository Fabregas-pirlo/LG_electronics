<template>
  <div class="boss">
    <van-swipe :autoplay="3000" indicator-color="white">
      <van-swipe-item><img class="img01" :src="'http://127.0.0.1:8080/'+dataObj.img_url" ></van-swipe-item>
      <van-swipe-item><img class="img01" :src="'http://127.0.0.1:8080/'+dataObj.img_url2" ></van-swipe-item>
    </van-swipe>
    
    <div><router-link to="/home"  class="return"></router-link></div>
    <div><router-link to="/home" class="gohome"></router-link></div>
    <div v-text="dataObj.lname" class="lname"></div>
    <span class="price" v-if="dataObj.price !== undefined">￥{{dataObj.price.toFixed(2)}}</span>
    
    <mt-navbar v-model="selected">
      <mt-tab-item id="1">详情</mt-tab-item>
      <mt-tab-item id="2">评价</mt-tab-item>
    </mt-navbar>

    <mt-tab-container v-model="selected">
      <mt-tab-container-item id="1">
        <mt-cell>
          <div>
            <div class="one"><img class="details1" :src="'http://127.0.0.1:8080/'+dataObj.details1"></div>
            <div class="two"><img class="details2" :src="'http://127.0.0.1:8080/'+dataObj.details2"></div>
          </div>
          
        </mt-cell>
      </mt-tab-container-item>
      <mt-tab-container-item id="2">
        <mt-cell>
          <div>
            <div class="comments">
              <span>全部(0)</span>
              <span>好评(0)</span>
              <span>中评(0)</span>
              <span>差评(0)</span>
             </div>
            <!-- <div class="temp">暂无评价</div> -->
          </div>
          
        </mt-cell>
      </mt-tab-container-item>
  
    </mt-tab-container>
    
    <div class="bottom">
      <div></div>
      <div class="addcart">加入购物车</div>
      <div class="buy">立即购买</div>
    </div>

    <van-goods-action>
      <van-goods-action-icon icon="chat-o" text="客服" />
      
      <van-goods-action-icon icon="cart-o" text="购物车" :info="$store.getters.getCartCount" @click="tocart"/>  
      <van-goods-action-button type="warning" text="加入购物车" @click="addcart" :data-lid="dataObj.lid" :data-price="dataObj.price" :data-lname="dataObj.lname"/>
      <van-goods-action-button type="danger" text="立即购买" @click="tocart"/>
    </van-goods-action>
    
  </div>
</template>

<script>
export default { 
  data() {
    return {
      dataObj: {},
      // lid: 0,
      selected: "1",
    };
  },
  props: ["lid"],
  methods: {
    
    addcart(e){
      var lid=e.target.dataset.lid;
      var n=e.target.dataset.lname;
      var p=e.target.dataset.price;
      var url = "addcart";
      var obj = {lid:lid,lname:n,price:p};
      this.axios.get(url,{params:obj})
      .then(res=>{
        if(res.data.code==-1){
          this.$messagebox("消息","请先登录").then(res=>{
            this.$router.push("/login");
          });
        }else if(res.data.code==-2){
          this.$toast("添加失败");
        }else{
          this.$store.commit("increment");
          this.$toast("添加成功");
        }
      })
    },
    tocart(){
      this.$router.push("/cart")
    },
    load() {
      (async () => {
        var result = await this.axios.get("http://localhost:8080/detail", {
          params: {
            lid: this.lid
          }
        });
        console.log(result.data);
        this.dataObj = result.data.data[0];
        // console.log(result.data.data)
        
      })();
    }
  },
  created() {
    this.load();
    // this.lid = this.$route.lid;
    console.log(this.lid);
  }
};
</script>

<style scoped>
.boss{background: #e3e2de;position: relative;}
.one{width:340px;display:block;}
.two{width:340px;display:block;}
.details1{
  width:100%; 
}
.details2{
  width:100%;
}
.gohome{
        display:block;
        float:left;
        background: url(../../../assets/toindex.png) no-repeat;
        background-size:100%; 
        width:370px;
        height: 40px;
        margin: 5px auto;
    }
  .return{
        display:block;
        position: fixed;
        background: url(../../../assets/return.png) no-repeat;
        z-index: 10;
        top:5px;
        left: 7px;
        width:40px;
        height: 40px;
        margin: 5px auto;
    }

.img01{
  width:100% ;
  height:360px;
}
.lname{
  margin:5px 10px;
}
.price{
  margin:5px 10px;
  color:red;
}
.comments{display: block;
          width:340px;}
/* .temp{display: block;width:340px;} */
.comments span{
  padding:2px;
  margin-left:5px;
}
.comments span:first-child{
  width:12px;
  height:3px;
  border-radius:5px;
  background: red;
  color:#fff;
}
.comments span:nth-child(2){
  width:12px;
  height:3px;
  border-radius:5px;
  background: pink;
  color:#000;
}
.comments span:nth-child(3){
  width:12px;
  height:3px;
  border-radius:5px;
  background: pink;
  color:#000;
}
.comments span:nth-child(4){
  width:12px;
  height:3px;
  border-radius:5px;
  background: #e3e2de;
  color:#000;
}
.bottom{
  width:100%;
  height:40px;
  border:1px solid #000;
  position:fixed;
  bottom:0;
}
</style>