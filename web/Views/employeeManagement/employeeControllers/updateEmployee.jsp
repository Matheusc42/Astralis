<%@page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@page import="controller.FuncionarioDAO" %>

<%
    int IdReg = request.getParameter("IdReg");
    String name = request.getParameter("name");
    String RG = request.getParameter("RG");
    String CPF = request.getParameter("CPF");
    String birthDate = request.getParameter("birthDate");
    String mobilePhone = request.getParameter("mobilePhone");
    String Phone = request.getParameter("Phone");
    String Mail = request.getParameter("Mail");
    String Address = request.getParameter("Address");
    String City = request.getParameter("City");
    String UF = request.getParameter("UF");
    String Position = request.getParameter("Position");

    
%>