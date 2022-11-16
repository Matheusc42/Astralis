<%@page language="java" %>

<%
    session.invalidate();
    response.sendRedirect("./loginScreen.html");
%>
