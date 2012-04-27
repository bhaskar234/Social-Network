
<%@taglib uri="/WEB-INF/struts-html.tld" prefix="h" %>
<script type="text/javascript">
    function checkuname(str)
 {
     
 //alert("uname : "+str);
 if (str=="")
   {
   document.getElementById("checkuname").innerHTML="";
   return;
   } 
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
     //alert("sdffd");
     document.getElementById("checkuname").innerHTML=xmlhttp.responseText+"<img src=\"images/load1.gif\" />";
   //  alert("before : "+this.checkpwd.value);
   //  checkpwd.value=xmlhttp.responseText;
     //alert("Response : "+xmlhttp.responseText);
     
     }
     else
         document.getElementById("checkuname").innerHTML="<img src=\"images/load1.gif\" />";
   }
 xmlhttp.open("GET","checkuname.jsp?p="+str,true);
 //alert(str);
 xmlhttp.send();
 }
 
</script>
<table>
    <tr>
        
        <td style="width:100%;text-align:left">
          <h:form action="/register" onsubmit="return validateregisterform(this)">
              <table>
                  <tr>
                      <td>
                          Username
                      </td> 
                      <td>
                          <h:text property="uname" onchange="checkuname(uname.value)" />
                      
                      <label id="checkuname" /> </td>
                  </tr>
                  <tr>
                      <td>
                          Password
                      </td>
                      <td>
                          <h:password property="pwd" />
                      </td>
                  </tr>
                  <tr>
                      <td>
                          Name
                      </td>
                      <td>
                          <h:text property="name" />
                          
                      </td>
                  </tr>
              </table>
                          <h:submit value="Register" />
                          <h:javascript formName="registerform" />
                          <h:errors />
                          <h4>${requestScope.message}</h4>
                          
    </h:form>
        </td>
    </tr>
</table>