
<html>
    <head>
        <script type="text/javascript">
            
            function addfriend(str)
 {
     try
     {
// alert("addfriend : "+str); 
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
     alert("Res : "+xmlhttp.responseText);
     }
   }
 //xmlhttp.open("GET","http://localhost:8076/fbnew/user/test.jsp?q="+str,true);
  xmlhttp.open("GET","<%=request.getContextPath()%>/user/addfriend.jsp?touname="+str,true);
 xmlhttp.send(); 
 }
 catch(e)
 {
     alert("Exception : "+e);
 }
 }
 
     function sendmessage(fromuname,touname)      
             {
                 //alert("redirecting..."); 
                 window.location="<%=request.getContextPath()%>/user/newmsg.jsp?fromuname="+fromuname+"&touname="+touname;
                 
             }
        </script>
    </head>
    <body> 
<% 
try
               { 
                       String touname = request.getParameter("uname"); 
                       out.println("<br>Username of user : "+touname);
                       String fromuname=session.getAttribute("uname").toString(); 
                      // out.println("<br>Name of User : "+session.getAttribute("name"));     
                        
                       %>
                       <input type="text" id="touname" value="<%=touname%>" hidden="true"  /> 
                       <!--<script>alert("hyhyhy");alert(document.getElementById("touname").value);</script> -->
                       <!-- <input type="text" value="test" id="test" onchange="showUser('<%=touname%>')" /> -->
                       <input type="button" value="Add Friend" onclick="addfriend('<%=touname%>')"       /> 
                       <!-- <input type="button" value="yy" onclick="ag()" /> -->
                       <input type="button" value="Send Message" onclick="sendmessage('<%=fromuname%>','<%=touname%>')" />
                       <%
                       System.out.println("addfriend("+touname+")");
                               

                   }
catch(Exception ex)
               {
    System.out.println("profile page Error : "+ex);
               }
%>
    </body>
</html>