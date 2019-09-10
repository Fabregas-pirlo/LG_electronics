<template>
  <div>
    <!-- <img src="../../../assets/1.png"> -->
    <img :src="'http://127.0.0.1:8080/'+dataObj.img_url">
    <div v-text="dataObj.lname"></div>
    <span>￥{{dataObj.price.toFixed(2)}}</span>
    <router-link to="/home">返回首页</router-link>
    <img class="details1" :src="'http://127.0.0.1:8080/'+dataObj.details1">
    <img class="details2" :src="'http://127.0.0.1:8080/'+dataObj.details2">

    <!-- <mt-navbar v-model="selected">
      <mt-tab-item id="1">
        <img class="details1" :src="'http://127.0.0.1:8080/'+dataObj.details1">
        <img class="details2" :src="'http://127.0.0.1:8080/'+dataObj.details2">
      </mt-tab-item>
      <mt-tab-item id="2">comment</mt-tab-item>
    </mt-navbar> -->
    
    
    
  </div>
</template>

<script>
export default {
  data() {
    return {
      dataObj: {},
      lid: 0
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
.details1{
  width:100%;
  height:350px;
}
.details2{
  width:100%;
  height:350px;
}
<style scoped>
</style>