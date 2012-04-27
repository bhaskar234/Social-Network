
<%@page import="st.DAO"%>
<%@ page import="java.util.ArrayList,java.util.List;" %>
<html>
    <head>
<script type="text/javascript">
            
            function confirmfriend(str,touname)
 {
     try
     {
 alert("confirmfriend : "+str); 
/*
 if (str=="")
   {
   document.getElementById("test").innerHTML="";
   return;
   } 
  */          
 if (window.XMLHttpRequest)
   {// code for IE7+, Firefox, Chrome, Opera, Safari
   xmlhttp=new XMLHttpRequest();
   }
 else
   {// code for IE6, IE5
   xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
   }
 xmlhttp.onreadystatechange=function()
   {
   if (xmlhttp.readyState==4 && xmlhttp.status==200)
     {
     //document.getElementById("test").value=xmlhttp.responseText;
     alert(xmlhttp.responseText);
     }
   }
 //xmlhttp.open("GET","http://localhost:8076/fbnew/test.jsp?q="+str,true);
  xmlhttp.open("GET","<%=request.getContextPath()%>/user/confirmfriend.jsp?fromuname="+str+"&touname="+touname,true);
 xmlhttp.send(); 
 } 
 catch(e)
 {
    // document.write("Error : ");
     alert("Exception : "+e);
 }
 }
 
           
             
        </script>
</head>
<body>
    <%
 
 List<String> list=new ArrayList<String>();
 list=DAO.friendrequests(session.getAttribute("uname").toString());
 String touname=session.getAttribute("uname").toString();
out.println("<table>"); 
     if (list != null) {
         for (String a : list) {
System.out.println("hhhj");             
             out.println("<tr><td>"+a+"</td><td><input type=\"button\" value=\"Confirm\" onclick=\"confirmfriend('"+a+"','"+touname+"')\" /></td></tr>");
                          //out.println("<tr><td>"+a+"</td><td><input type=\"button\" value=\"Confirm\" onclick=\"confirmfriend('satish','bh')\" /></td></tr>");
         }
         out.println("</table>");
             } else {
     out.println("No friend requests for now");
     }
   
%>
</body>
</html>