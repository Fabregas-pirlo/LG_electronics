<template>
    <div>
        <mt-field label="用户名" placeholder="请输入用户名" v-model="uname" class="uname"></mt-field>
        <mt-field label="密码" placeholder="请输入密码" v-model="upwd" class="upwd"></mt-field>
        <div class="vali">
            验证码<input type="text" class="msg">
            <button :class="{disabled:timer!=10}" @click="start">
            {{timer==10?"获取验证码":`${timer}s后可重新获取`}}</button>
        </div>
        
        <mt-button size="large" @click="login" class="login">登录</mt-button>

        <div class="forget">
			<router-link to="#" class="hola">忘记密码</router-link>
			<router-link to="#" class="hola">新用户注册</router-link>
		</div>
				
                <div>
					<p class="other">其他登陆方式</p>
					<div class="ali">
						<div>
							<div><img src="../../../assets/alipay.png"></div>
							<span>支付宝登录</span>
						</div>
						<div>
							<div><img src="../../../assets/tblogo.png" class="tb"></div>
							<span>淘宝登录</span>
						</div>
					</div>
					<p class="privacy">登录即代表您同意隐私政策</p>

                    

				</div>
        
    </div>
</template>

<script>
export default {
    data(){
        return{
            uname:"",
            upwd:"",
            timer:10
        }
    },
    methods:{
        start(){
			if(this.timer==10){
				this.timer=9;
					var n = setInterval(()=>{
						if(this.timer>0){
						this.timer--;
						}else{
							this.timer=10;
							clearInterval(n);
							}
						},1000)
					}
				},
        login(){
            var u=this.uname;
            var p=this.upwd;
            var reg=/^[0-9a-zA-Z]{3,12}$/i;
            if(!reg.test(u)){
                this.$toast("用户名格式不正确");
                return;
            }
            if(!reg.test(p)){
                this.$toast("密码格式不正确");
                return;
            }
            var url="login";
            var obj={uname:u,upwd:p};
            this.axios.get(url,{params:obj})
            .then(res=>{
                var code=res.data.code;
                if(code==-1){
                    this.$messagebox("消息","用户名或密码有误");
                }else{
                    this.$router.push("/home")
                }
            })
        }
    }
}
</script>

<style scoped>
    button{
		padding:2px 2px;
		border:1px solid #aaa;
		text-decoration:none;
	}
	button.disabled{
		background:#aaa;
		color:#555;
	}
    .vali{margin-left:30px;}
    .uname{margin-left:24px;}
    .upwd{margin-left:24px;}
    .msg{
        border:none;
        margin-top:10px;
        
    }
    .login{
        margin-top:15px;
        border-radius:30px;
        width:320px;
        margin-left:24px;
        background:orange;
    }
    .ali{
        display:flex;
        justify-content: space-around;
    }
    .tb{
        width:72px;
        height:72px;
    }
    .forget{
        margin-top:20px;
        display: flex;
        justify-content: space-around;
        text-decoration:none;
    }
    .forget .hola{
        text-decoration:none;
    }
    .other{
        margin-top:100px;
        text-align: center;
    }
    .privacy{
        display: left;
        text-align: center;
        margin-top: 20px;
    }
</style>