<%-- 
    Document   : index
    Created on : Aug 9, 2022, 8:23:43 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LoginPage</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            td{
                padding:10px;
            }
            div{
                width: 50%;
                border: 1px solid black;
                 border-radius:5px;
                background-color: lightslategrey;
            }
        </style>
    </head>
    <body>
    <center> <h1><u>Login Here</u></h1></center>
    <center>
    <div>
        <form action="loginconfirm.jsp" method="POST">
        <table>
            <p>${requestScope.error}</p>
           
            <tr>
                <td>Enter username:</td>
                <td><input type="text" class="form-control" name="username" id="username" placeholder="Username"></td>
            </tr>
            <tr>
                <td>Enter the password:</td>
                <td><input type="password" class="form-control" name="password" id="password" placeholder="Password"></td>
            </tr>
            <tr>
                <td colspan="2"style="text-align:center"><input class="btn btn-success" type="submit" value="Submit"> </td>
                <td> </td>
                
                
               
            </tr>
        </table>
    </form>
    </div>
        </center>
    </body>
</html>
