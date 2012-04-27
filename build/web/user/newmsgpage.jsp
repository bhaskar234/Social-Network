<html>
    <head>
        <script type="text/javascript">
           function sendmessage(fromuname,touname)
 {
     try
     {
 //alert("sendmessage: "+fromuname); 
 var msg=document.getElementById("newmsg").value;
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
 //xmlhttp.open("GET","http://localhost:8076/fbnew/user/test.jsp?q="+str,true);
  xmlhttp.open("GET","<%=request.getContextPath()%>/user/sendmsg.jsp?fromuname="+fromuname+"&touname="+touname+"&msg="+msg,true);
 xmlhttp.send(); 
 }
 catch(e)
 {
     alert("Exception : "+e);
 }
 }
    </script>        
    </head>
    <body>
        <%
        String fromuname=request.getParameter("fromuname");
        String touname=request.getParameter("touname");
        
        %>
    <center>
        <table>
            <tr>
                <td>
                    <textarea rows="15" cols="30" id="newmsg" value="" ></textarea>
                   
        </td>
            </tr>
            <tr>
                <td>
                    
                    <input type="button" value="Send" onclick="sendmessage('<%=fromuname%>','<%=touname%>')" />
                 </td>
            </tr>
                
        </table>
    </center> 
    </body>
</html>