<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<%@page import="st.DAO,st.showusers"%>
<%@page import="java.util.List,java.util.ArrayList;" %>
<%
ArrayList<showusers> list=new ArrayList<showusers>();
list=DAO.getNames();
%>
<table>
    <th>Name</th>
   
        <%
        int i=0;
        for(showusers a:list)
       {
            i++;
          out.print("<tr><td> "+i+" </td><td><a href=\""+request.getContextPath()+"/user/profile.jsp?uname="+a.getUname()+"\" target=\"_blank\" >"+a.getName()+"</a></td></tr>");   
       }
        %>
   
</table>

          
