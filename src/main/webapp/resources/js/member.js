
var main = {
	init : function() {
		
		var _this = this;
		
		$("#loginmodal").show();
		
        $('#btn-cancel').on('click',function() {
	        $('.searchModal').hide();
        });
        $('#btn-login').on('click',function() {
	        _this.login();
        });
        
        $('#btn-join').on('click',function () {
			_this.register();
		});
		
        $('#btn-chk').on('click',function () {
			_this.idCheck();
		});
		$('#btn-pwchk').on('click',function () {
			_this.pwCheck();
		});
		$('#btn-update-member').on('click',function () {
			 $("#modal").show();
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
		var password = $('#password').val();
		$('#password').val(sha256($('#password').val()));
        loginForm.submit();
	},
	register : function () {
		var data = {
			userid: $('#id').val(),
			userpw: sha256($('#password').val()),
			userName: $('#name').val()
		};
		
		var isCheckId = $('#isCheckID').val();
		if(isCheckId == '0') {
			alert("아이디 중복체크를 해주세요");
			return;
		}
		if(data.userName == "익명") {
			alert("사용할 수 없는 이름입니다.");
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
    modify : function () {
		var data = {
			userid: $('#id').val(),
			userpw: sha256($('#newpassword').val()),
			userName: $('#newname').val()
		};
		if(data.userName == "익명") {
			alert("사용할 수 없는 이름입니다.");
			return;
		}
		 $.ajax({
            type: 'PUT',
            url: '/api/member',
            dataType: 'text',
            contentType:'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function() {
            alert('회원정보가 수정되었습니다.');
            window.location.href = '/member/mypage';
        }).fail(function (error) {
            alert('회원정보를 수정하지 못하였습니다.');
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
			type: 'GET',
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
   },
   pwCheck : function() {
   		var data = {
			userid: $('#id').val(),
			userpw: sha256($('#password').val()),
		};
		
		if(data.userpw.length == 0){
			alert('비밀번호를 입력해주세요.');
			return;
		}
		$.ajax({
            type: 'POST',
            url: '/api/member/pw/check',
            dataType: 'text',
            contentType:'application/json; charset=utf-8',
            data: JSON.stringify(data),
			success: function(result){ //callback 함수
				if(result == 'true'){
					main.modify();
				}
				else{
					alert("비밀번호가 틀렸습니다.");
				}
			}
		})
   }
 };
 
 
 main.init();
		