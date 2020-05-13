<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  
  

	
	
	

  
  
  
  
  
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style>
	.content{
		overflow:"hidden";
		text-align:center;
		
		
	}
	.cTitle{
            margin-top: 130px;
            padding-top: 50px;
            padding-left: 100px;
            font-size:50px;    
            text-decoration: underline;
            letter-spacing: 80%;
            width: 100%;
            height: 200px;
            opacity: 90%;
            color: white;
            background-color: #998778;
            
    }
    .hi{
    	margin:0 auto;
    	border : 1px solid white;
    	width : 10px;
    	height: 10px;
    	border-radius: 100px;
    	box-shadow: 5px 5px 5px grey;
    }
	
	.content p{
		font-size:50px;
		text-align:center;
	}
	.reserveno{
		box-shadow: 5px 5px 5px grey;
		margin:0 auto;
		margin-bottom:10px;
		padding:30px;
		width:500px;
		border-radius: 10px;
		
	}
	.reserveok{
		border:10px solid #998778;
		margin:0 auto;
		margin-bottom:10px;
		padding:30px;
		width:500px;
		
		
	}
	.userInfo{
		box-shadow: 5px 5px 5px grey;
		margin:0 auto;
		padding:30px;
		width:60%;
		margin-bottom:40px;
		border-radius: 15px;
		
	}
	
	td{
		width:50%;
		
	}
	th{
		text-align:left;
	}
	.button{
		
		text-align:right;
	}
	.img{
		text-align:right;

	}
</style>
</head>
<body>
<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="cTitle"><p>예약확인</p></div><br><br>
		<div class="content">		
		<div class="userInfo"><h2>고객정보</h2>
			<table>
				<tr>
					<th>이름 : </th>
					<td><span class="memberName">${userReserveList[0].memberName}</span></td>
				</tr>
				<tr>
					<th>회원 아이디 : </th>
					<td><span class="gender">${userReserveList[0].memberId}</span></td>
				</tr>
				<tr>
					<th>전화번호: </th>
					<td><span class="phone">${userReserveList[0].memberPhone}</span></td>
				</tr>
			</table>
			
		</div>
		<div class='hi'></div>
		
		
		<script>
			
		</script>
		
			<c:forEach items="${userReserveList}" var='u'>
			<c:if test="${u.reserveStatus==true}">
			<div class="reserveno">예약대기
				<table>
					<tr>
						<th>예약지점 : <span>${u.salonName}</span></th>
						<td rowspan="6" class="img"><img src="../upload/designer/designer${u.designerNo}.jpg" width="150" height="150"></td>											
					</tr>
					<tr>
						<th>예약날짜 : <span>${u.reserveDate}</span></th>											
					</tr>
					<tr>
						<th>예약 디자이너 : <span>${u.designerName}</span></th>
						
						
							
						
					</tr>
					<tr>
						<th>예약 시간 : <span>${u.startTime}</span></th>
					</tr>
					<tr>
						<th>예약 가격 : <span>${u.totalPrice}</span></th>
					</tr>
					<c:forEach items="${u.menuList}" var='uu'>
						<tr>
						<th>예약 시술 : <span>${uu.hairName}</span></th>
					</tr>
					</c:forEach>					
					
					<c:if test="${u.reserveStatus==true}">
						<td><button type="button" onclick="reviewInsert('${u.reserveNo}','${u.salonName }','${u.memberId}');" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">후기작성</button></td>
<%-- 						$바로위에 {u.memberId }값에 ${sessionScope.member.memberId }들어가야함 지금은 session이 없음으로 이렇게 대채 --%>
					</c:if>
				</table>				
			</div>
			<div class='hi'></div>
			<div class='hi'></div>
			<div class='hi'></div>
			</c:if>
			
			<c:if test="${u.reserveStatus==false}">
				
				<div class="reserveok">시술완료
				<table>
					<tr>
						<th>예약지점 : <span>${u.salonName}</span></th>											
					</tr>
					<tr>
						<th>예약날짜 : <span>${u.reserveDate}</span></th>											
					</tr>
					<tr>
						<th>예약 디자이너 : <span>${u.designerName}</span></th>
					</tr>
					<tr>
						<th>예약 시간 : <span>${u.startTime}</span></th>
					</tr>
					<tr>
						<th>예약 가격 : <span>${u.totalPrice}</span></th>
					</tr>
					<c:forEach items="${u.menuList}" var='uu'>
						<tr>
						<th>예약 시술 : <span>${uu.hairName}</span></th>
					</tr>
					</c:forEach>					
					<tr>
						<th>예약 확인 : <span>${u.reserveStatus}</span></th>
					</tr>
					<c:if test="${u.reserveStatus==false}">
						<td><input type="button" class="button" value="후기작성완료" readonly"></td>
					</c:if>
				</table>
			</div>
			</c:if>
			</c:forEach>
				
						
<!-- 				<table> -->
<!-- 					
<!-- 					<tr> -->
<%-- 						<th>예약 디자이너 : <span>${userReserveList[0].designerName}</span></th> --%>
						
<!-- 					</tr> -->
<!-- 					<tr> -->
<%-- 						<th>예약 시간 : <span>${userReserveList[0].startTime}</span></th> --%>
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th>예약 시술 목록 : <span></span></th> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<%-- 						<th>예약 가격 : <span>${userReserveList[0].totalPrice}</span></th> --%>
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th>예약확인유/무 : </th><td><input type="button" class="button" value="후기작성" onclick="test1();"></td> -->
<!-- 					</tr> -->
<!-- 				</table> -->
			
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<script>

	$('#exampleModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  var recipient = button.data('whatever') // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  var modal = $(this)
		  modal.find('.modal-title').text('New message to ' + recipient)
		  modal.find('.modal-body input').val(recipient)
		});
	
		function reviewInsert(reserveNo,salonName,memberId){
			console.log(reserveNo);
			console.log(salonName);
			console.log(memberId);
			var param = {reserveNo:reserveNo};
			$.ajax({
				url:"/reserveSearch",
				data: param,
				type: "get",
				success:function(data){
					var modal = $("#modal-content");
					modal.find("p").remove();
					modal.find("img").remove();
						modal.append("<img src='../upload/designer/designer"+data[0].designerNo+".jpg' width='150' height='150'>");
						modal.append("<p> 디자이너 이름 : "+data[0].designerName+"</p>");
						modal.append("<p> 예약자 이름 : "+data[0].memberName+"</p>");
						modal.append("<p> 예약 시술 : "+data[0].menuList[0].hairName+"</p>");
						modal.append("<p> 예약 가격 : "+data[0].totalPrice+"</p>");
						modal.append("<p> 예약 번호 : "+data[0].reserveNo+"</p>");						
						modal.append("<p> 예약완료여부 : "+data[0].reserveStatus+"</p>");
						
/* 						modal.append("<input type='hidden' name='reserveNo' value='"+data[0].reserveNo+"'>"); */
						$("#rating-ability-wrapper").append("<input type='hidden' name='reserveNo' value='"+data[0].reserveNo+"'>");
						$("#rating-ability-wrapper").append("<input type='hidden' name='reserveStatus' value='"+data[0].reserveStatus+"'>");	
						$("#rating-ability-wrapper").append("<input type='hidden' name='salonName' value='"+salonName+"'>");
						$("#rating-ability-wrapper").append("<input type='hidden' name='memberId' value='"+memberId+"'>");
/* 						$("#rating-ability-wrapper").append("<input type='hidden' name='salonName' value='"+data[0].salonName+"'>"); */
/* 						$("#rating-ability-wrapper").append("<input type='hidden' name='salonName' value='"+userReserveList[0].salonName+"'>"); */
						
				},
				error:function(){
					console.log('실패');
				}		
			});	
		}
		
		
		jQuery(document).ready(function($){
		    
			$(".btnrating").on('click',(function(e) {
			
			var previous_value = $("#selected_rating").val();
			
			var selected_value = $(this).attr("data-attr");
			$("#selected_rating").val(selected_value);
			
			$(".selected-rating").empty();
			$(".selected-rating").html(selected_value);
			
			for (i = 1; i <= selected_value; ++i) {
			$("#rating-star-"+i).toggleClass('btn-warning');
			$("#rating-star-"+i).toggleClass('btn-default');
			}
			
			for (ix = 1; ix <= previous_value; ++ix) {
			$("#rating-star-"+ix).toggleClass('btn-warning');
			$("#rating-star-"+ix).toggleClass('btn-default');
			}
			
			}));
			
				
		});



		
	</script>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">후기작성</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      
   		<div class="form-group" id="modal-content">
   			
   			
   		</div>
        <form action="/insertReview" method="post" id="inputReviewBox">
          <div class="form-group">
          
            <label for="recipient-name" class="col-form-label"></label>
           	
           	<div class="form-group" id="rating-ability-wrapper">
	    <label class="control-label" for="rating">
	    <span class="field-label-header">더욱 발전하는 서비스를 위해 만족하신만큼 별점 부탁드립니다</span><br>
	    <span class="field-label-info"></span>
	    <input type="hidden" id="selected_rating" name="selected_rating" value="" required="required">


	    

	    </label>
	    <h2 class="bold rating-header" style="">
	    <span class="selected-rating">0</span><small> / 5</small>
	    </h2>
	    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="1" id="rating-star-1" name="star">
	        <i class="fa fa-star" aria-hidden="true"></i>
	    </button>
	    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="2" id="rating-star-2" name="star1">
	        <i class="fa fa-star" aria-hidden="true"></i>
	    </button>
	    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="3" id="rating-star-3" name="star2">
	        <i class="fa fa-star" aria-hidden="true"></i>
	    </button>
	    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="4" id="rating-star-4" name="star3">
	        <i class="fa fa-star" aria-hidden="true"></i>
	    </button>
	    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="5" id="rating-star-5" name="star4">
	        <i class="fa fa-star" aria-hidden="true"></i>
	    </button>
	</div>           
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">한줄평 등록</label>
            <textarea class="form-control" id="message-text" name="insertReview"></textarea>
          </div>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
        <button type="submit" class="btn btn-primary">후기 작성하기</button>

        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>