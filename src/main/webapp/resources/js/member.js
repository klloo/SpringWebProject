
var main = {
	init : function() {
		var _this = this;
		
        $('#btn-login').on('click',function() {
	        _this.login();
        });
        
        $('#btn-join').on('click',function () {
			_this.register();
		});
		
        $('#btn-chk').on('click',function () {
			_this.idCheck();
		});
	},
	login : function() {
		var loginForm = $('#loginForm');
		if( $('#id').val().length == 0){
			alert('아이디를 입력해주세요.');
			return;
		}
		if($('#password').val().length == 0){
			alert('비밀번호를 입력해주세요.');
			return;
		}
        loginForm.submit();
	},
	register : function () {
		var data = {
			userid: $('#id').val(),
			userpw: $('#password').val(),
			userName: $('#name').val()
		};
		
		var isCheckId = $('#isCheckID').val();
		if(isCheckId == '0') {
			alert("아이디 중복체크를 해주세요");
			return;
		}
		 $.ajax({
            type: 'POST',
            url: '/api/member',
            dataType: 'text',
            contentType:'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function() {
            alert('회원가입이 완료되었습니다.');
            window.location.href = '/member/login';
        }).fail(function (error) {
            alert('회원가입에 실패하였습니다.');
        });
    },
   idCheck : function() {
   		var userid = $("#id").val();
		
		if(userid.length == 0){
			alert('아이디를 입력해주세요.');
			return;
		}
		
		$.ajax({
			url: '/api/member/id/check/' + userid,
			type: 'get',
			dataType: 'text',
			success: function(result){ //callback 함수
				if(result == 'true'){
					alert("사용가능한 아이디입니다.");
					$('#isCheckID').val('1');
				}
				else{
					alert("이미 존재하는 아이디입니다.");
				}
			}
		})
   }
 };
 
 
 main.init();
		