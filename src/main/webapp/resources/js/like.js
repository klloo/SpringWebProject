
var main = {
	init : function() {
	
		var _this = this;
		var heart = $('#heartValue').val();
		
		if(heart == "true") 
			$("#heart").prop("src", "/resources/images/heart.png");
		else
			$("#heart").prop("src", "/resources/images/heart_blank.png");
			
         $('#heart').on('click', function () {
			//로그인안했으면 하라고 알려주고 return
			var loginInfo = $('#loginInfo').val();
			if(loginInfo.length==0){
				alert("좋아요를 누르시려면 로그인 해주세요");
				window.location.href = '/member/login';
				return;
			}
			var heart = $('#heartValue').val();
        	if(heart == "true") 
            	_this.likeCancel();
            else
            	_this.like();
        });
	},
    like : function () {
    	var bno = $('#id').val();
    	$.ajax({
            type: 'POST',
            url: '/api/board/heart/'+bno,
			dataType: 'text',
        }).done(function(data) {
            $("#heart").prop("src", "/resources/images/heart.png");
			document.getElementById("views").innerHTML = "&nbsp;"+data+"&nbsp;&nbsp;&nbsp;";
			$('#heartValue').val("true");
        }).fail(function (error) {
            alert('좋아요를 누르지 못하였습니다.');
        });
    },
    likeCancel : function() {
    	var bno = $('#id').val();
    	$.ajax({
            type: 'DELETE',
            url: '/api/board/heart/'+bno,
			dataType: 'text',
        }).done(function(data) {
            $("#heart").prop("src", "/resources/images/heart_blank.png");
			document.getElementById("views").innerHTML = "&nbsp;"+data+"&nbsp;&nbsp;&nbsp;";
			$('#heartValue').val("false");
        }).fail(function (error) {
            alert('좋아요를 취소하지 못하였습니다.');
        });
    }
 };

 
 main.init();
		