<%@page import="st.DAO"%>
<%@ page import="java.util.ArrayList,java.util.List;" %>
<%

List<String> list=new ArrayList<String>();
list=DAO.getFriends(session.getAttribute("uname").toString());
out.println("<b>Friends List : </b><br><table>");
for(String a:list)
    {
      out.println("<tr><td><a href=\""+request.getContextPath()+"/user/profile.jsp?uname="+a+"\" />"+a+"</a></td></tr>");
              
    }
out.println("</table>"); 
    %>
