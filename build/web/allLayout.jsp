<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<html>
    <head>
        <title> <tiles:getAsString name="title"/> </title>
        <link  href="<%= request.getContextPath()%>/styles.css" 
                 type="text/css"  rel="stylesheet" />
    </head>
<body style="background-color:#3b5999">    
<tiles:insert attribute="header"/>
<tiles:insert attribute="body"/> 
</BODY>
</HTML>