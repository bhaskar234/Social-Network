<%@taglib uri="/WEB-INF/struts-html.tld" prefix="h" %>
<h:form action="/login" >
    <table>
        <tr>
            <td>
                Username
            </td>
            <td>
                <h:text property="uname" />
            </td>
        </tr>
        <tr>
            <td>
                Password
            </td>
            <td>
                <h:password property="pwd" />
            </td>
         </tr>
        </table>
                        <h:submit value="login" />
                        <h:errors />
                        <h4>${requestScope.message}</h4>
                                  
</h:form>