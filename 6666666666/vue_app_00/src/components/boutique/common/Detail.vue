<template>
  <div class="boss">
    <!-- <img src="../../../assets/1.png"> -->
    <img class="img01" :src="'http://127.0.0.1:8080/'+dataObj.img_url" >
    <div><router-link to="/home" class="gohome"></router-link></div>
    <div v-text="dataObj.lname" class="lname"></div>
    <span class="price">￥{{dataObj.price.toFixed(2)}}</span>

    
    

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
    
    
    
  </div>
</template>

<script>
export default { 
  data() {
    return {
      dataObj: {},
      lid: 0,
      selected: "1",
    };
  },
  props: ["lid"],
  methods: {
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
.boss{background: #e3e2de}
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
        background-size:98%; 
        width:370px;
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
.comments{display: block;width:340px;}
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
</style>