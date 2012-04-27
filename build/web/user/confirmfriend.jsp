
<%@page import="st.DAO"%>
<%

String fromuname=request.getParameter("fromuname");
String touname=request.getParameter("touname");
boolean confirmed=DAO.confirmfriend(fromuname, touname);
String msg="error";
if(confirmed==true)
    {
    msg="Friend confirmed successfully";
}
else
       {
    msg="Error confirming friend";
}
    out.println(msg);
%>