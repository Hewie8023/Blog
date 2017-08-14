/*


@Author：Hewie 


*/

//prettyPrint();
layui.use(['form', 'layedit','layer'], function () {
    var form = layui.form()
    , $ = layui.jquery
    , layedit = layui.layedit
    , layer = layui.layer;

    //评论和留言的编辑器
    var editIndex = layedit.build('remarkEditor', {
        height: 150,
        tool: ['face', '|', 'left', 'center', 'right', '|', 'link'],
    });
    
    //评论和留言的编辑器、用户名和邮箱的验证
    layui.form().verify({
    	visitorName:function(value){
    		if(value.length<=0){
    			return '请输入用户名'; 
    		}
    	}
    	
    	,content: function (value) {
            value = $.trim(layedit.getText(editIndex));
            if (value == "") return "评论至少得输入一个字吧";
            layedit.sync(editIndex);
        }
    	,email:[/^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$|^1[3|4|5|7|8]\d{9}$/, '邮箱格式不对']
    });

    //监听评论提交
    form.on('submit(formRemark)', function (data) {
//    	layer.alert(JSON.stringify(content.elem), {  
//    	      title: '最终的提交信息'  
//    	    })  
    	var content = $("#remarkEditor").val();
    	var visitorName = $("#visitorName").val();
    	var visitorEmail = $("#visitorEmail").val();
    	var blogId = $("#blogId").val();
//    	layer.alert(content+"..."+visitorName);
//    	    return false;  
    	var index = layer.load(1);
    	
        $.post("/comment/save.do",{"content":content,"visitorName":visitorName,"visitorEmail":visitorEmail,"blog.blogId":blogId},function(result){
			if(result.success){
				layer.close(index);
				//alert("评论已提交成功，审核通过后显示！...");
				layer.msg("评论已提交成功，审核通过后显示！", { icon: 6 });
				//$("#imageCode").val("");
				setTimeout(function () {
					location.reload(true);
			    }, 2000);
				
			}else{
				layer.msg(result.errorInfo, { icon: 2 });
			}
		},"json");
        return false;
//        $.ajax({
//            contentType: "application/json,charset=utf-8",
//            type: 'post',
//            async: false,
//            url: '/comment/save.do',
//            //data: JSON.stringify(data.field),
//            //data:data.field,
//            data:"content:content&visitorName:$('#visitorName').val()&visitorEmail:visitorEmail",
//            success: function (outResult) {
//                layer.close(index);
//                if (outResult.Success) {
//                    layer.msg(outResult.Message, { icon: 6 });
//                    location.reload(true);
//                } else {
//                    if (outResult.Message != undefined) {
//                        layer.msg(outResult.Message, { icon: 5 });
//                    } else {
//                        layer.msg('程序异常，请重试或联系作者', { icon: 5 });
//                    }
//                }
//            },
//            error: function (outResult) {
//                layer.close(index);
//                layer.msg("请求异常", { icon: 2 });
//            }
//        });
//        return false;
    	

    });
});