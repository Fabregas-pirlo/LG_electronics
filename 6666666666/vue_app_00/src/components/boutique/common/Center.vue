<template>
    <div>
        <div class="crown">
            <div class="icon">
                <img src="../../../assets/ic_me_normal.png">
                <p>匿名用户</p>
            </div>
            <router-link to="/" ><div class="customer"></div></router-link>
        </div>
        <div class="jifen">
            <div>
                <p>0</p>
                <p>积分</p>
            </div>
            <div>
                <p>￥0</p>
                <p>余额</p>
            </div>
        </div>
        <router-link to="/Cart" class="allorders"></router-link>
        <div class="delivery">
            <ul>
                <li>
                    <a><img src="../../../assets/wallet.png"></a>
                    <p>待支付</p>
                </li>
                <li>
                    <a><img src="../../../assets/send.png"></a>
                    <p>待发货</p>
                </li>
                <li>
                    <a><img src="../../../assets/receive.png"></a>
                    <p>待收货</p>
                </li>
                <li>
                    <a><img src="../../../assets/comment.png"></a>
                    <p>待评价</p>
                </li>
            </ul>
        </div>
        
            
        <router-link to="/Cart" class="tocart"></router-link>
        <router-link to="/Cart" class="addman"></router-link>
        
    </div>
</template>

<script>
export default {
    
}
</script>

<style scoped>
    .crown{
        width:200px;
        display: flex;
        justify-content: space-between; 
    }
    .customer{
        background: url(../../../assets/normalcustomer.png) ;
        background-size:5%; 
        width:40px;
        height: 40px;
        border: 1px solid #000;
        float: right;
    }
    .icon{
        display: flex;
    }
    .crown{
        width:400px;
        height:85px;
        border:1px solid #000;
    }
    .jifen{
        display:flex;
        justify-content: space-around;
         width:360px;
        height:85px;
        border:1px solid #000;
    }
    .jifen>div{
        text-align: center
    }
    .order{
         width:400px;
        height:60px;
        border:1px solid #000;
    }
    .delivery{
            width:370px;
            height:115px;
            border:1px solid #000;
            margin: 0 auto;
    }
    .delivery ul{
            width:300px;
            list-style:none;
            display:flex;
            justify-content: space-around;
            
    }
    .delivery ul>li{
        width:65px;
        height:80px;
    }
    .delivery ul>li>a>img{
        width:49px;
        height:44px;
    }
    .delivery ul>li>p{
        margin: 0;
        color: #666;
        font-size: 14px;
    }
    .tocart{
        float:left;
        background: url(../../../assets/mycart.png) no-repeat;
        background-size:95%; 
        width:370px;
        height: 40px;
        border:1px solid #000;
    }
    .addman{
       float:left;
        background: url(../../../assets/addman.png) no-repeat;
        background-size:95%; 
        width:370px;
        height: 40px;
        border:1px solid #000; 
    }
    .allorders{
        float:left;
        background: url(../../../assets/allorders.png) no-repeat;
        background-size:95%; 
        width:370px;
        height: 40px;
        border:1px solid #000; 
    }
</style>