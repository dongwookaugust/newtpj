/**
 * reply 기능과 관련된 자바스크립트 파일
 */
 
 //자바 스크립트의 즉시 실행 함수는 ()안에 함수를 선언하고, 바깥쪽에서 실행
 console.log("reply module......")
 var replyService=(function(){
	function add(reply, callback){
		console.log("reply");
		$.ajax({
			type : 'post',
			url : '../replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result,sataus,xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr,status,er){
				if(error){
					error(er);
				}
			} 
			
		})
	}
	function getList(param, callback,error){
		var board_num = param.board_num;
		var page = param.page ||1;
		$.getJSON("/pjt/replies/pages/"+board_num+"/"+page+".json",
			function(data){
				if(callback){
					callback(data.replyCnt,data.list);
				}
			}).fail(function(xhr,status,err){
				if(error){
					error();
				}
			});
	}
	function remove(reply_num,callback,error){
		$.ajax({
			type:'delete',
			url:'../replies/'+reply_num,
			success:function(deleteResult,status,xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error:function(xhr,status,er){
				if(error){
					error(er)
				}
			}
		});
	}
	
	function update(reply, callback, error){
		console.log("RNO:",reply.rno);
		$.ajax({
			type:'put',
			url:'../replies/'+reply.rno,
			data:JSON.stringify(reply),
			contentType:"application/json;charset=utf-8",
			success:function(result, status,xhr){
				if(callback){
					callback(result);
				}
			},error:function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function get(rno,callback,error){
		$.get("../replies/"+rno+".json",function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error(err);
			}
		});
	}
	
	//날짜처리
	function displayTime(timeValue){
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";
		if(gap<(1000*60*60*24)){
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			var td = today.getDate();
			var yd = dateObj.getDate();
			if((yd-td)==0){
				str="오늘";
			}else{
				str="어제";
			}
			return[str,(hh>9?'':'0')+hh,':',(mi>9?'':'0')+mi,':',(ss>9?'':'0')+ss].join('');
		}else{
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth()+1;
			var dd = dateObj.getDate();
			return [yy,'/',(mm>9?'':'0')+mm,'/',(dd>9?'':'0')+dd].join('');
		}
	}
	
	return {add:add, getList:getList,remove:remove, update:update,get:get,dsiplayTime:displayTime};
	
})();