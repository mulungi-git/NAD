<%-- 
    Document   : loginconfirm
    Created on : Aug 10, 2022, 5:37:44 PM
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
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    
                    if(username != "" && password !=""){
                
            
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
                            
                            String sql = "SELECT * FROM users WHERE user_name = ? and password = ?";
                            PreparedStatement prps = con.prepareStatement(sql);
           
                            prps.setString(1, username);
                            prps.setString(2, password);
           
                            ResultSet rslt = prps.executeQuery();
                    int user_role = rslt.getInt("role");
                                while(rslt.next()){
                                    
                                    String current_user = rslt.getString("user");
                                  //  if (user_role == 1) {
                                        //request.setAttribute("success", "Login Successful!");
                                       // session.setAttribute("user", current_user);
                                       RequestDispatcher rd = request.getRequestDispatcher("Dashboard.jsp");
                                       rd.forward(request, response);
                                       
                                        //request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
                                        response.sendRedirect("Dashboard.jsp");
//                                        return;
//                                    }else if(user_role == 2){
//                                        request.setAttribute("success", "Login Successful!");
//                                        session.setAttribute("user", current_user);
//                                        request.getRequestDispatcher("admin.jsp").forward(request, response);
//                                        response.sendRedirect(request.getContextPath() + "/admin.jsp");
//                                        return;
//                                    }else if(user_role == 3){
//                                        request.setAttribute("success", "Login Successful!");
//                                        session.setAttribute("user", current_user);
//                                        request.getRequestDispatcher("staff.jsp").forward(request, response);
//                                        response.sendRedirect(request.getContextPath() + "/staff.jsp");
//                                        return;
//                                    }else{
//                                        request.setAttribute("error", "Sorry! You play no part on the platform");
//                                        request.getRequestDispatcher("Login.jsp").forward(request, response);
//                                        return;
//                                    }  
                                }/*else{
                                    request.setAttribute("error", "Sorry! Your login details do not much");
                                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                                    return;
                                }*/
                                }catch(ClassNotFoundException | SQLException e) {
                                out.println(e.getMessage());
                                }
                    }/*else{
            
                        request.setAttribute("error", "Login details missing!");
                        request.getRequestDispatcher("Login.jsp").forward(request, response);
                        
                    } */ 

                %>

    </body>
</html>
