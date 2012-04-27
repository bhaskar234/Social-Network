<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<html>
    <head>
        <title> <tiles:getAsString name="title"/> </title>
        <link  href="<%= request.getContextPath()%>/styles.css" 
                 type="text/css"  rel="stylesheet" />
    </head>
<body>    
<tiles:insert attribute="header"/>
<table style="width:100%;height:100%;vertical-align: top">
    <tr style="width:100%">
        <td style="width:15%;background-color: lightblue;vertical-align: top" ><tiles:insert attribute="menu" /></td>
        <td style="width:85%;background-color: lightblue;vertical-align: top"><tiles:insert attribute="body"/> </td>
    </tr>
</table>

</BODY>
</HTML>