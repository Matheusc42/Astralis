<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@page import="controller.FuncionarioDAO"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Astralis</title>
    </head>
    <body>
        <% 
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

            out.print(birthDate);
            out.print("CALL sp_newEmployee('"+ name + "','" + RG + "','" + CPF + "','" + birthDate + "','" + mobilePhone + "','" + Phone + "','" + Mail + "','" + Address + "','" + City + "','" + UF + "','" + Position + "';");

            try{
                FuncionarioDAO.newEmployee(name, RG, CPF, birthDate, mobilePhone, Phone, Mail, Address, City, UF, Position);

                response.sendRedirect("./employeeManagement.jsp");
            } catch (Exception e){
                out.print(e);
            }
        %>
        
    </body>
</html>
