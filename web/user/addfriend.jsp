<%@page  import="st.DAO" %>
<%
String touname=request.getParameter("touname");
String fromuname=session.getAttribute("uname").toString();
String msg="Error sending friend request";
String ret[]=new String[2];

ret=DAO.addfriend(fromuname, touname);


if(ret[1]=="noerror")
        {
          if(ret[0]=="no")
                           {
              msg="Friend request sent";
          }
          else
                           {
             msg="Friend request already sent";
          
           System.out.println("Friend request already sent");
           
                     }
          // msg="Friend request already sent";
           // System.out.println("Friend request sent");
           
           
        }
else
       {
             msg="Error sending friend request";
                
             System.out.println("Error sending friend request");
       }
out.println(msg);   


%>