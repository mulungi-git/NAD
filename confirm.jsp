<%-- 
    Document   : confirm.jsp
    Created on : Aug 10, 2022, 4:20:18 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     <%
                         String name = request.getParameter("name");
                    String gender = request.getParameter("gender");
                    String location = request.getParameter("location");
                    String email = request.getParameter("email");
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    String confirm = request.getParameter("confirm");
          
                    //step 1 load the jdbc driver
            
                    if(password.equals(confirm)){
                 
                        Statement st = null;
                        PreparedStatement ps = null;
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
                
                
                            String mysql = "SELECT * FROM users WHERE email = ? and user_name = ?";
                            ps = con.prepareStatement(mysql);
                
                            ps.setString(1, email);
                            ps.setString(2, username);
                            ResultSet rs = ps.executeQuery();
                
                            if(rs.next()){
                                request.setAttribute("error", "User already exist! Try other emails..");
                                request.getRequestDispatcher("customer.jsp").forward(request, response);
                                return;
                            }else {
                
                                st = con.createStatement();
                                st.executeUpdate("insert into users set user='"+name+"',email='"+email+"',user_name='"+username+"',location='"+location+"',gender='"+gender+"',password='"+password+"'");
                                request.setAttribute("error", "Welcome to E-Shopper!");
                                request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
                                response.sendRedirect(request.getContextPath() + "Dashboard.jsp");
                                return;
                            }
                
                
                            }catch(ClassNotFoundException | SQLException e) {
                            e.printStackTrace();
                            }
                 
                        }else {
            
                            request.setAttribute("error", "passwords do not match!");
                            request.getRequestDispatcher("Login.jsp").forward(request, response);
                            return;
                        }



                     %>
    </body>
</html>
