define(['oxjs'],function(OXJS){
  return {
    init:function($mod){
    	/**
		如何传值：
		1.　window.opener　回调；在移动端，特别是在各客户端中交互的兼容性不好
		2.　a 链接过来，读写localStorage，设置key是个问题
		3.　a 链接过来，读写都走服务端（最好）
    	*/
    	/*
    	var storeKey='current_city',
    	city=localStorage.getItem(storeKey);
    	if(city){
    		$('[value="'+city+'"]',$mod).focus()
    	}*/
    	//此处应该是调用接口去修改服务端数据，然后history.back
        var currentCity=$('[data-current]',$mod).attr('data-current');
        if(!currentCity){
            //客户端取一下当前定位，或用
        }
        var on_city_set=function(r){
            if(document.referrer){
                history.back();
            }
        };
    	$mod.on('click','.item',function(e){
    		//console.log('fuck',e.target);
    		$(e.target).addClass('selected').siblings().removeClass('selected')
    
            if(!currentCity){
                
                $mod.OXPost({
                    'user-select':{
                        
                        selected:currentCity=e.target.value,
                        type:'ui-texts',
                        $inserter:'default'
                    }
                },on_city_set)
            }else{
                $mod.OXPut({
                    'user-select':{
                        selected:e.target.value,
                        
                        $updater:'default'
                    }
                },on_city_set)
            }
            
    	})
    }
  }
})
