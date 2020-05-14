<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="cTitle meorijom">#Admin page<span>관리자 페이지</span></div>
        <div class="content2">
           <a href="#"><span class="menuBox"><img src="/imgs/memberMan.png"><div>회원 관리</div></span></a>
            <a href="#"><span class="menuBox"><img src="/imgs/reserveMan2.png" width="70%" height="70%"><div>예약 관리</div></span></a>
            <a href="#"><span class="menuBox"><img src="/imgs/questionMan.jpg"><div>1:1문의</div></span></a><br>
            <a href="#"><span class="menuBox"><img src="/imgs/company.png"><div>지점 관리</div></span></a>
            <a href="/designerList"><span class="menuBox"><img src="/imgs/designerIcon.png"><div>디자이너 관리</div></span></a>
            
        </div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</div>
</body>
<style>
    /*-----------------content-----------------------*/
    .content2 {
        /*-지우지마세요-*/
        width: 1200px;
        overflow: hidden;
        margin: 0 auto;
        height: 750px;
        text-align: center;
        padding-top: 50px;
    }

    .cTitle {
        margin-top: 130px;
/*        margin-top: 40px;*/
        padding-top: 50px;
        padding-left: 100px;
        font-size: 50px;
        text-decoration: underline;
        width: 100%;
        height: 200px;
        opacity: 90%;
        color: white;
        background-color: #998778;
    }
  
    

    .cTitle>span {
        font-size: 20px;
        font-weight: bold;
    }
    .menuBox{
        display: inline-block;
        width: 200px;
        height: 200px;
        border:12px solid  #998778;
        margin: 30px 40px;
        opacity: 80%;
    }
    .menuBox>img{
        width: 75%;
        height: 75%;
    }
    
    
    .menuBox:hover{
        box-shadow: 7px 7px 10px gray;
        opacity: 100%;
    }
    .menuBox:hover>div{
     font-size: 19px;
    }
   
   .menuBox>div{
       display: inline-block;
    	font-size:18px;
       font-weight: bold;
       height: 23px;
       border-bottom: 7px solid lightgrey;
    }

</style>
</html>