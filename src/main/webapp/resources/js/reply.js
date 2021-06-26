
var main = {
	init : function() {
		
		var _this = this;
		
		
        $('#btn-reply-save').on('click',function () {
			_this.registerReply();
		});
		
	},
	registerReply : function () {
		var data = {
			bno: $('#id').val(),
			reply: $('#reply').val(),
			replyer: document.getElementById("replyer").innerText,
			isanonymous: $("input:checkbox[name=isAnonymousReply]").is(":checked")
		};
		
		if(data.reply.length == 0) {
			alert('댓글내용을 입력해주세요.');
			return;
		}
		
		 $.ajax({
            type: 'POST',
            url: '/api/reply',
            contentType:'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function() {
            alert('댓글이 등록되었습니다.');
			var bno = $('#id').val();
            window.location.href = '/board/read?bno='+bno;
        }).fail(function (error) {
           alert(JSON.stringify(error));
        });
    }
  
 };
 
 
 main.init();

function deleteReply(rno) {
		 $.ajax({
            type: 'DELETE',
            url: '/api/reply/'+rno,
        }).done(function() {
            alert('댓글이 삭제되었습니다.');
			var bno = $('#id').val();
            window.location.href = '/board/read?bno='+bno;
        }).fail(function () {
            alert('댓글을 삭제하지 못하였습니다.');
        });
    }
		