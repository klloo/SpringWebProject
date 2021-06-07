
var main = {
	init : function() {
		var _this = this;
		$('#btn-save').on('click',function () {
			_this.save();
		});
		 $('#btn-update').on('click', function () {
            _this.update();
        });

        $('#btn-delete').on('click', function () {
            _this.delete();
        });
        var actionForm = $('#actionForm');
        $('.paginate_button a').on('click',function(e) {
        	//<a>태그를 클릭해도 페이지 이동이 없도록 처리 
        	e.preventDefault();
        	
        	//form태그 내 pageNum값을 href 속성 값으로 변경 
        	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
        	
        	//actionForm 자체를 submit()
        	actionForm.submit();
        });
	},
	save : function () {
		var data = {
			title: $('#title').val(),
			writer: $('#writer').val(),
			content: $('#content').val()
		};
		
		 $.ajax({
            type: 'POST',
            url: '/api/board',
            dataType: 'json',
            contentType:'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function() {
            alert('글이 등록되었습니다.');
            window.location.href = '/';
        }).fail(function (error) {
            alert('글을 등록하지 못하였습니다.');
        });
    },
    update : function () {
        var data = {
        	bno: $('#id').val(),
            title: $('#title').val(),
            content: $('#content').val()
        };

        var id = $('#id').val();

        $.ajax({
            type: 'PUT',
            url: '/api/board',
            data: JSON.stringify(data),
            contentType:'application/json; charset=utf-8',
        }).done(function() {
            alert('글이 수정되었습니다.');
            window.location.href = '/board/read?bno='+id;
        }).fail(function (error) {
            alert('글을 수정하지 못하였습니다.');
        });
    },
    delete : function () {
        var id = $('#id').val();
        $.ajax({
            type: 'DELETE',
            url: '/api/board/'+id,
            contentType:'application/json; charset=utf-8'
        }).done(function() {
            alert('글이 삭제되었습니다.');
            window.location.href = '/board/list';
        }).fail(function (error) {
            alert('글을 삭제하지 못하였습니다.');
        });
    }
 };
 
 
 main.init();
		