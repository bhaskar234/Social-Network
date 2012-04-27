<html>
    <head>
<!--<script src="jquery.js" type="text/javascript"></script>-->
<style>
		.black_overlay{
			display: none;
			position: absolute;
			top: 0%;
			left: 0%;
			width: 100%;
			height: 100%;
			background-color: white;
			z-index:1001;
			-moz-opacity: 0.8;
			opacity:.80;
			filter: alpha(opacity=80);
		}
		.white_content {
			display: none;
			position: absolute;
			top: 25px;
			left: 100px;
			width: 200px;
			height: 350px;
			padding: 16px;
			border: 16px solid orange;
			background-color: white;
			z-index:1002;
			overflow: auto;
		}
	</style> 

</head>
<body>
    
<%
String path=request.getContextPath();
%>
<div class="menu" >
<a href="<%=path%>/user/home.jsp"  >Homepage</a><br/>
<a href="<%=path%>/user/showfriends.jsp" >My Friends</a><br>
<a href="<%=path%>/user/profile.jsp?uname=<%=session.getAttribute("uname")%>"  >My Profile</a><br/>
<a href="<%=path%>/user/inbox.jsp"  >Inbox</a><br/>
<a href="<%=path%>/user/showusers.jsp"  >List All Users</a><br/>
<a href="<%=path%>/user/friendrequests.jsp"  >Friend Requests</a><br>
<a href="<%=path%>/user/logout.jsp"  >Logout</a><br/>
</div>
<!-- 
use this
<a href="<%=path%>/user/.jsp" target="_blank" ></a>

-->

<%
//while("a".equals("a"))
       //{
    %>

     
     




</body>
</html>