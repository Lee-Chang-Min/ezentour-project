$(document).ready(function(){        
    BbsView();
    CommentList();
    CommentPaging();
});
	
/*//게시글 수정 이동
function goBbsUpdate(){
	var bbsID = $("#bbsID").val();
	location.href = "/bbs/bbsUpdate?bbsID="+bbsID;
}*/
	
//댓글 수정 자식창으로 이동
function nwindow(prodNo,commentId,subCommentId,memId){
  window.name = "commentParant";										//이름이 없으니까 그냥 이름을 설정해줍니다.
  var url= "/comment/commentUpdate?prodNo="+prodNo+"&commentId="+commentId+"&subCommentId="+subCommentId+"&memId="+memId;
  window.open(url,"","width=500,height=200,left=300");					//자식창이 되는 주소를 오픈해줌 (크기도 설정해 줍니다.)
}

//답글 작성 자식창으로 이동
function subWindow(prodNo,commentId,comCtgr){
  window.name = "subCommentParant";										//이름이 없으니까 그냥 이름을 설정해줍니다.
  var url= "/comment/subCommentWrite?prodNo="+prodNo+"&comCtgr="+comCtgr+"&commentId="+commentId;
  window.open(url,"","width=500,height=200,left=300");					//자식창이 되는 주소를 오픈해줌 (크기도 설정해 줍니다.)
}
	
//게시판 뷰
/*function BbsView(){
	var bbsID = $("#bbsID").val();

	if(bbsID!=0){
		$.ajax({    
  
            url     : "/bbs/BbsView",
            data    : $("#bbsForm").serialize(),
            dataType: "JSON",
            cache   : false,
            async   : true,
            type    : "POST",    
            success : function(obj) {
                BbsViewCallback(obj);                
            },           
            error     : function(xhr, status, error) {}
            
         });
    } else {
        alert("오류가 발생했습니다.\n관리자에게 문의하세요.");
	}
}
function BbsViewCallback(obj){
	var str = "";
        
	if(obj != null){
		var bbsID = obj.bbsID;
		var title = obj.title;
		var price = obj.price;
		var content = obj.content;
		var sell = obj.sell
		
		var filePath = "http://localhost:8080/resources/bbsImg/"+bbsID+"/"+bbsID+".jpg";
		
		
		str += "<tr style=\"border:1px solid #444444\">";
		str += "<td rowspan=7 style=\"text-align:center;\"><img src=\""+filePath+"\" onerror=\"this.src='http://placehold.it/400x400?text=No Image'\" width=\"400\" height=\"400\" alt=\"\"/></td>";
		str += "</tr>";
		
		str += "<tr height=\"70\" style=\"border-top:1px solid #444444;\">";
		str += "<th colspan=2 style=\"border-right:1px solid #444444;\"><font size=\"5em\">"+title+"</font></th>";
		str += "</tr>";
		
		str += "<tr>"
        str += "<th>가격</th>";
        str += "<td style=\"border-right:1px solid #444444;\">"+ price +"원</td>"
        str += "</tr>";
        
        str += "<tr>";
        str += "<th>판매량</th>";
        str += "<td style=\"border-right:1px solid #444444;\">"+ sell +"</td>";
        str += "</tr>";
        
        str += "<tr>";
        str += "<th>수량</th>";
        str += "<td style=\"border-right:1px solid #444444;\">";
        str += "<form id=cartAmount name=cartAmount>";
        str += "<input type=text id=\"amount\" name=\"amount\">";
        str += "</form>";
        str += "</td>"
        str += "</tr>";
        
        str += "<tr>";
        str += "<td colspan=2 style=\"text-align:center; border-right:1px solid #444444;\"><br><button type=\"button\" style=\"padding:20px 70px;\" onclick=\"javascript:ThisOrder();\">구매하기</button>";
        str += "</tr>";

        str += "<tr>";
        str += "<td colspan=2 style=\"text-align:center; border-right:1px solid #444444;\"><button type=\"button\" style=\"padding:20px 70px;\" onclick=\"javascript:CartView();\">장바구니</button><td>";
        str += "</tr>";
        
        str += "<tr height=\"100\" style=\"border:1px solid #444444\">";
        str += "<td colspan=3 style=\"border:1px solid #444444\"><font size=\"3em\"><제품상세설명></font><br><br>"+ content +"</td>";
        str += "</tr>";
            
	} else {
		alert("등록된 글이 존재하지 않습니다.");
		return;
	}        	
	$("#tbody").html(str);
}*/
   
//댓글 목록
function CommentList(){
	
	var commentNum = $("#commentNum").val();

	if(prodNo!=0 && comCtgr!=0){
		$.ajax({    
  
            url     : "/comment/CommentList",
            data    : $("#prodNo").serialize()+"&"+$("#comCtgr").serialize()+"&"+$("#commentNum").serialize(),
            dataType: "JSON",
            cache   : false,
            async   : true,
            type    : "POST",    
            success : function(obj) {
                CommentListCallback(obj);                
            },           
            error     : function(xhr, status, error) {}
            
         });
    } else {
        alert("오류가 발생했습니다.\n관리자에게 문의하세요.");
	}
}
function CommentListCallback(obj){
	   	
	var num = $("#commentNum").val();
	var NowmemId = $("#memId").val();  //???????????
	var grade = $("#grade").val();
	var comCtgr = $("#comCtgr").val();
	
	var list = obj;
	var listLen = obj.length;

	var str = "";
        
	if(listLen >  0){
		
		for(var a=0; a<listLen; a++){  
			
			var commentId = list[a].commentId;
			var prodNo = list[a].prodNo;
			var memId = list[a].memId;
            var comContent = list[a].comContent;
            var subCommentId = list[a].subCommentId;
            var comCtgr = list[a].comCtgr;
            
	        var filePath = "http://localhost:8080/resources/bbsImg/"+prodNo+"/comment/"+commentId+".jpg";
	       			        
	        //답글은 본인 or 관리자 이외에는 비밀글로 보일 예정
	        if(comCtgr != 2 || NowmemId == memId || grade == 1 || (a>0 && commentId == list[a-1].commentId && NowmemId == list[a-1].memId)){
	        	
		        //답글이 아닐 경우
		        if(subCommentId == 0){
			        str += "<div class=\"container\">";
		            str += "<div class=\"row\">";
		            str += "<table class=\"table table-striped\" style=\"text-align:center; border: 1px solid #dddddd\">";
		            str += "<tr>";
		            str += "<td align=\"left\">"+memId+"님의 ";
		            
		            if(comCategory == 1){
		            	str += "후기입니다."
		            }else{
		            	str += "질문입니다."
		            }
		           
		            str += "</td><td colspan=2></td>";
		            str += "<td colspan=2 align=\"right\">";
		            
		            if(NowmemId == memId){
		            str += "<button type=\"button\" onclick=\"javascript:nwindow("+prodNo+","+commentId+","+subCommentId+",'"+memId+"');\">수정</button>";
		            str += "&emsp;<button type=\"button\" onclick=\"javascript:CommentDelete("+commentId+","+subCommentId+");\">삭제</button>";
		            }
		            
		            if(grade == 1){
			            str += "&emsp;<button type=\"button\" onclick=\"subWindow("+prodNo+","+commentId+","+comCtgr+")\">답글</button>";
		            }
		            str += "</td>";
		            str += "</tr>";
		            str += "<tr>";
		            str += "<td colspan=5 align=\"left\">";
		            str += "<img src=\""+filePath+"\" onerror=\"this.style.display='none'\" width=\"200\" height=\"200\" alt=\"\" /><br><br>"+comContent+"<br><br></td>";
		            str += "</tr>";
		            str += "</table>";
		            str += "</div>";
		            str += "</div>";
		        } 
		        
	            //답글일 경우
		        else{
		        	str = str.slice(0,str.length-20);
		            str += "<tr>";
		            str += "<td bgcolor=\"white\"  colspan=4 align=\"left\">└─&emsp;"+comContent+"</td>"
	            	str += "<td bgcolor=\"white\" align=\"right\">";
		            
		            //관리자
		            if(isManager == 1){
			            str += "<button type=\"button\" onclick=\"javascript:nwindow("+prodNo+","+commentId+","+subCommentId+",'"+memId+"');\">수정</button>";
			            str += "&emsp;<button type=\"button\" onclick=\"javascript:CommentDelete("+commentId+","+subCommentId+");\">삭제</button>";
		            }        
		            
		            str += "</td>";
		            str += "</tr>";			      
		            str += "</table>";
		            str += "</div>";
		            str += "</div>";
		        }
		        
	        }else{
	        	//비밀Q&A
	            if(subCommentId == 0){
	            	str += "<div class=\"container\">";
		            str += "<div class=\"row\">";
		            str += "<table  class=\"table\" style=\"text-align:center; border: 1px solid #dddddd\">";
		            str += "<tr>";
		            str += "<td colspan=6 align=\"left\">비밀글 입니다.</td>"
	           
	            }else{
		        	str = str.slice(0,str.length-20);
		        	str += "<tr><td colspan=6 align=\"left\">└─&emsp;비밀글 입니다.</td>"
	            }
	        
	            str += "</tr>";			      
	            str += "</table>";
	            str += "</div>";
	            str += "</div>";
	        }
        }
	} else {
		return;
	}        	
	$("#tcomment").html(str);
}
   
/*	   
//게시글 삭제
function BbsDelete(){
	
	var yn = confirm("게시글을 삭제하시겠습니까?");        
	if(yn){	
		$.ajax({    	
			url        : "/bbs/BbsDelete",
			data    : $("#bbsForm").serialize(),
			dataType: "JSON",
			cache   : false,
			async   : true,
			type    : "POST",    
			success : function(obj) {
				BbsDeleteCallback(obj);                
			},           
			error     : function(xhr, status, error) {}
			
		});
	}        
}

function BbsDeleteCallback(obj){
	
	if(obj != null){        
		
		var result = obj.result;
		
		if(result == "SUCCESS"){                
			alert("게시글 삭제를 성공하였습니다.");                
			location.href="/bbs/home";
		} else {                
			alert("게시글 삭제를 실패하였습니다.");    
			return;
		}
	}
}
*/


////////////////////////////////////////////////////////////
/*//상품을 구매한사람만 후기 작성가능
function UserReview(){

	$.ajax({    
          url     : "/comment/UserReview",
          data    : $("#userID").serialize()+"&"+$("#bbsID").serialize(),
          dataType: "JSON",
          cache   : false,
          async   : true,
          type    : "POST",    
          success : function(count) {
        	  if(count == 0){
        		  alert("상품을 구매, 배송완료되신분만 후기작성이 가능합니다.");
        		  return;
        	  }
        	  CommentWrite();
          },           
          error     : function(xhr, status, error) {
          	alert("상품을 구매, 배송완료되신분만 후기작성이 가능합니다.");
          	return;
          }
          
      });
}*/
//댓글 작성


function CommentWrite(){
	  
	var yn = confirm("댓글을 등록하시겠습니까?");        
       
	if(yn){
		
		var memId = $("#memId").val();
		var comCtgr = $("#comCtgr").val();
			
		var comContent = $("#comContent").val();   

		if (memId == ""){            
			alert("로그인을 해주세요.");
			$("#memId").focus();
			return;
		}
        
  		 if (comContent == ""){            
 	        alert("내용을 입력해주세요.");
 	        $("#comContent").focus();
 	        return;
 	    }
  		
       	var form = $('#Comment1Command')[0];
       	var data = new FormData(form);
       	
       	if($('#fileName').val()==""){
       		data.delete('fileName');
       	}

       	data.append("prodNo",$("#prodNo").val());
       	data.append("comCtgr",comCtgr);
       	data.append("memId",memId);
       	
       	$.ajax({    
               type    : "POST",    
               enctype: "multpart/form-data",
               url     : "/comment/CommentWrite",
               data    : data,
               cache   : false,
               processData: false,
               contentType: false,
               success : function(obj) {
                   CommentWriteCallback(obj);                
               },           
               error     : function(xhr, status, error) {}
               
       	});
	}
}

//댓글 작성 함수
function CommentWriteCallback(obj){
	
	var memId = $("#memId").val();
	var comCtgr = $("#comCtgr").val();
	var commentNum = $("#commentNum").val();
   
	if(obj != null){        
       
		var result = obj.result;
       
		if(result == "SUCCESS"){                
			alert("댓글 등록을 성공하였습니다.");                
			location.href = "/product/prodList?prodNo="+encodeURI(prodNo)+"&comCtgr="+comCtgr+"&commentNum="+encodeURI(commentNum);
		} else {                
			alert("댓글 등록을 실패하였습니다.");    
			return;
		}
	}
}
	 
//댓글 삭제
function CommentDelete(commentId,subCommentId){
	
	var memId = $("#memId").val();		   
	var yn = confirm("댓글을 삭제하시겠습니까?");        
	       
	if(yn){
	           
		$.ajax({    
	               
			url        : "/comment/CommentDelete",
			data    : "commentId="+commentId+"&prodNo="+prodNo+"&subCommentId="+subCommentId,
			dataType: "JSON",
			cache   : false,
			async   : true,
			type    : "POST",    
			success : function(obj) {
				CommentDeleteCallback(obj);                
			},           
			error     : function(xhr, status, error) {}
			
		});
	}        
}
	   
function CommentDeleteCallback(obj){
	
	var memId = $("#memId").val();
	var comCtgr = $("#comCtgr").val();
	var commentNum = $("#commentNum").val();
	
	if(obj != null){        
		
		var result = obj.result;
		
		if(result == "SUCCESS"){                
			alert("댓글 삭제를 성공하였습니다.");                
			location.href = "/product/prodList?prodNo="+encodeURI(bbsID)+"&comCategory="+comCategory+"&commentNum="+encodeURI(commentNum);
		} else {                
			alert("댓글 삭제를 실패하였습니다.");    
			return;
		}
	}
}
	   
//페이징	
function CommentPaging(){

	$.ajax({    
	 			  
		url        : "/comment/CommentPaging",
		data    : $("#prodNo").serialize()+"&"+$("#comCtgr").serialize()+"&"+$("#commentNum").serialize(),
		dataType: "JSON",
		cache   : false,
		async   : true,
		type    : "POST",    
		success : function(obj) {
			CommentPagingCallback(obj);                
		},           
		error     : function(xhr, status, error) {}	
	});
}	
	 	
function CommentPagingCallback(obj){
	 		
	var prodNo = $("#prodNo").val();
	var comCtgr = $("#comCtgr").val();
	var commentNum = $("#commentNum").val();
	
	var list = obj;
	
	if(list != null){
		str = "";
		
		var pageNum = list.pageNum;
		var startPageNum = list.startPageNum; 
		var endPageNum = list.endPageNum; 
		var prev = list.prev;
		var next = list.next;
		
		str += "<ul class=\"page_nation\">";
		if(prev){
			str += "<a class=\"arrow prev\" href=\"/product/prodList?prodNo="+prodNo+"&comCtgr="+comCtgr+"&commentNum="+(startPageNum-1)+"\"><span><<</span></a>";
		}
		
		for(i=startPageNum; i<=endPageNum; i++){
			if(i == commentNum){
				str += "<a class=\"active\" href=\"/product/prodList?prodNo="+prodNo+"&comCtgr="+comCtgr+"&commentNum="+i+"\">"+i+"</a>";
			}
			else{
				str += "<a href=\"/product/prodList?prodNo="+prodNo+"&comCtgr="+comCtgr+"&commentNum="+i+"\">"+i+"</a>";
			}
		}
		if(next){
			str += "<a class=\"arrow next\" href=\"/product/prodList?prodNo="+prodNo+"&comCtgr="+comCtgr+"&commentNum="+(endPageNum+1)+"\"><span>>></span></a>";
		}
		
		str += "</ul>";
		
		$("#tPaging").html(str);
	}
	
}
