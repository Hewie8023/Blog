/*
@Author：Hewie
*/

layui.use(['element', 'jquery', 'form', 'layedit'], function () {
    var element = layui.element()
        ,form = layui.form()
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
        	msgName:function(value){
        		if(value.length<=0){
        			return '请输入用户名'; 
        		}
        	}
        	
        	,content: function (value) {
                value = $.trim(layedit.getText(editIndex));
                if (value == "") return "留言至少得输入一个字吧";
                layedit.sync(editIndex);
            }
        	,email:[/^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$|^1[3|4|5|7|8]\d{9}$/, '邮箱格式不对']
        	
        	,imageCode:function(value){
        		if(value.length<=0){
        			return '请输入验证码'; 
        		}
        	}
        });

        //监听评论提交
        form.on('submit(formLeaveMessage)', function (data) {

        	var content = $("#remarkEditor").val();
        	var msgName = $("#msgName").val();
        	var msgEmail = $("#msgEmail").val();
        	var imageCode = $("#imageCode").val();

        	var index = layer.load(1);
        	
            $.post("/message/save.do",{"msgContent":content,"msgName":msgName,"msgEmail":msgEmail,"imageCode":imageCode},function(result){
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
        });

    //监听留言回复提交
    form.on('submit(formReply)', function (data) {
        var index = layer.load(1);
        //模拟留言回复
        setTimeout(function () {
            layer.close(index);
            var content = data.field.replyContent;
            var html = '<div class="comment-child"><img src="../images/Absolutely.jpg"alt="Absolutely"/><div class="info"><span class="username">模拟回复</span><span>' + content + '</span></div><p class="info"><span class="time">2017-03-18 18:26</span></p></div>';
            $(data.form).find('textarea').val('');
            $(data.form).parent('.replycontainer').before(html).siblings('.comment-parent').children('p').children('a').click();
            layer.msg("回复成功", { icon: 1 });
        }, 500);
        return false;
    });
});
function btnReplyClick(elem) {
    var $ = layui.jquery;
    $(elem).parent('p').parent('.comment-parent').siblings('.replycontainer').toggleClass('layui-hide');
    if ($(elem).text() == '回复') {
        $(elem).text('收起')
    } else {
        $(elem).text('回复')
    }
}
systemTime();

function systemTime() {
    //获取系统时间。
    var dateTime = new Date();
    var year = dateTime.getFullYear();
    var month = dateTime.getMonth() + 1;
    var day = dateTime.getDate();
    var hh = dateTime.getHours();
    var mm = dateTime.getMinutes();
    var ss = dateTime.getSeconds();

    //分秒时间是一位数字，在数字前补0。
    mm = extra(mm);
    ss = extra(ss);

    //将时间显示到ID为time的位置，时间格式形如：19:18:02
    document.getElementById("time").innerHTML = year + "-" + month + "-" + day + " " + hh + ":" + mm + ":" + ss;
    //每隔1000ms执行方法systemTime()。
    setTimeout("systemTime()", 1000);
}

//补位函数。
function extra(x) {
    //如果传入数字小于10，数字前补一位0。
    if (x < 10) {
        return "0" + x;
    }
    else {
        return x;
    }
}