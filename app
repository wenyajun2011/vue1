<template>
  <div>
		
		<v-header :seller="seller" v-if="seller"></v-header>
		<div class="tab">
			<div class="tab-item">
				<router-link to='/goods'>商品</router-link>
				</div>
			<div class="tab-item">
				<router-link to='/ratings'>评论</router-link>
				</div>
			<div class="tab-item">
				<router-link to='/seller'>商家</router-link>
			</div>
		 
		</div>
	
		<router-view></router-view>
		
  </div>
	
</template>

<script>
import header from './components/header/header';
import Axios from 'axios'

const ERR_OK=0;

export default{
	data:function(){
		return {
			seller:{}
		}
	},
	created(){
		Axios.get("/api/seller").then(function(response){
			response=response.data;
			if (response.errno===ERR_OK){
				console.log(response.data.seller)
				this.seller=Object.assgin({},this.seller,response.data.seller);
			}
		}).catch(function(error){

		})
	},
	components: {
		'v-header': header
	},
	methods:{
		
	}
}

</script>

<style>
.tab{
	display: flex;
	width: 100%;
	height: 40px;
	line-height: 40px;
	border-bottom: 1px solid rgba(7,17,27,0.1);
}
.tab-item{
	flex:1;
	text-align: center;
}
.tab-item a{
	display:block;
	font-size:14px;
	color: rgb(77,85,93);
}
.tab-item .router-link-active{
	color: rgb(240,20,20);
}
</style>
