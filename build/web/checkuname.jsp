<%@page  import="st.DAO" %>
<%
String a=request.getParameter("p");
DAO obj=new DAO();
boolean msg=obj.isUnique(a);

if(msg==true)
      { %>Username available<%}
    else
               {
    %>Sorry,username not available<%
    }


%> 