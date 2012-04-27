<%@page import="st.DAO"%>
<%
String fromuname=request.getParameter("fromuname");
String touname=request.getParameter("touname");
String msg=request.getParameter("msg");
boolean sent=DAO.sendmessage(fromuname, touname, msg);

if(sent)
       {
    out.println("Message sent successfully");
}
else
       {
    out.println("Error sending message");
}
%>