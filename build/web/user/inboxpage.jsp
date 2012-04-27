<%@page import="st.DAO"%>
<%@ page import="java.util.ArrayList,java.util.List;" %>
<%
String uname=session.getAttribute("uname").toString();
List<String> list=new ArrayList<String>();
ArrayList<List> alist=new ArrayList<List>();
alist=DAO.getInbox(uname);
out.println("<table border=1>");
int i=0;
out.println("<th>Sno</th><th>From</th><th>Message</th><th>Date</th>");
for(List l:alist)
        {
     i++;
     
            out.println("<tr>");
            String sno=l.get(0).toString();
            String msgfrom=l.get(1).toString();
            String msg=l.get(2).toString();
            String dtime=l.get(3).toString();
            
            out.println("<td>"+i+"<td>"+msgfrom+"</td><td>"+msg+"</td><td>"+dtime+"</td>");
            /*
            for(String s:l)
             {
               out.print("<td>"+s+"</td>");   
             }
              */
            out.println("</tr>");
        }
 out.println("</table>");



%>