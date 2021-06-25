
var main = {
	init : function() {
		var _this = this;
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
	},
	returnString : function(str) {
		var len = str.length;
		var index = str.indexOf("]", 0);
		var str = str.substr(index+1,len+1);
		return str;
	}
 };


 
 main.init();
		