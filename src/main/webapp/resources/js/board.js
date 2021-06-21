
var main = {
	init : function() {
		$.ajax({
			url:'/api/air-info',
			type:'get',
			dataType:'json',
			success: function(data){
				var item = data.response.body.items;
				if(item.length==0)
					document.getElementById("dataTime").innerHTML = "아직 발표된 내용이 없습니다.";
				else {
					document.getElementById("dataTime").innerHTML = "( "+item[0].dataTime+" )";
					document.getElementById("cause").innerHTML = "&#x1F4AC;"+_this.returnString(item[0].informCause);
					document.getElementById("overall").innerHTML = "&#x1F4AC;"+_this.returnString(item[0].informOverall);
				}
			},
			error: function(errorThrown) {
				alert("Error: " + errorThrown);
			}
		});
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
	returnString : function(str) {
		var len = str.length;
		var index = str.indexOf("]", 0);
		var str = str.substr(index+1,len+1);
		return str;
	},
	save : function () {
		var data = {
			title: $('#title').val(),
			writer: $('#writer').val(),
			isanonymous: $("input:checkbox[name=isAnonymous]").is(":checked"),
			content: $('#summernote').val(),
			userid: $('#user_id').val()
		};
		if(data.title.length == 0) {
			alert('제목을 입력해주세요.');
			return;
		}
		if(data.content.length == 0) {
			alert('내용을 입력해주세요.');
			return;
		}
		
		
		
		 $.ajax({
            type: 'POST',
            url: '/api/board',
            dataType: 'json',
            contentType:'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function(bno) {
            alert('글이 등록되었습니다.');
            window.location.href = '/board/read?bno='+bno;
        }).fail(function (error) {
            alert('글을 등록하지 못하였습니다.');
        });
    },
    update : function () {
        var data = {
        	bno: $('#id').val(),
        	writer: $('#writer').val(),
        	isanonymous: $("input:checkbox[name=isAnonymous]").is(":checked"),
            title: $('#title').val(),
            content: $('#summernote').val()
        };
	
        
        if(data.title.length == 0) {
			alert('제목을 입력해주세요.');
			return;
		}
		if(data.content.length == 0) {
			alert('내용을 입력해주세요.');
			return;
		}
		
	
		

        $.ajax({
            type: 'PUT',
            url: '/api/board',
            data: JSON.stringify(data),
            contentType:'application/json; charset=utf-8',
        }).done(function() {
            alert('글이 수정되었습니다.');
            window.location.href = '/board/read?bno='+data.bno;
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
 $(document).ready(function() {
	  $('#summernote').summernote({
		    placeholder: '상세 설명을 입력하세요',
		    tabsize: 2,
		    height: 500,
		    toolbar: [
		    	['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
		    ],
		    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			callbacks: {	//여기 부분이 이미지를 첨부하는 부분
				onImageUpload : function(files) {
					uploadSummernoteImageFile(files[0],this);
				},
				onPaste: function (e) {
					var clipboardData = e.originalEvent.clipboardData;
					if (clipboardData && clipboardData.items && clipboardData.items.length) {
						var item = clipboardData.items[0];
						if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
							e.preventDefault();
						}
					}
				}
			}
	  });
	});

//이미지 파일 업로드
function uploadSummernoteImageFile(file, editor) {	
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "/api/board/image",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			$(editor).summernote('editor.insertImage', data.url);
		}
	});
}
 
 main.init();
		