<%-- 
    Document   : login.sp
    Created on : 18 de set. de 2023, 21:28:51
    Author     : Bruno Salles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controle.Login"%>
<%@ page import="java.sql.*" %>
<%@page import="java.text.*" import="java.lang.*"%>
<%@page import="java.time.format.DateTimeFormatter" import="java.time.LocalDateTime"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CodeTech - Login</title>
    </head>
    <body>
        <%
            Login lg = new Login ();
            lg.setLogin(request.getParameter("login"));
            lg.setSenha(request.getParameter("senha"));
    
            Class.forName("com.mysql.jdbc.Driver"); //registra            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtest", "root", ""); // abre Conn
            try{
                
                Statement stm = conn.createStatement(); //cria uma instrução
                String Sql = "Select * from usuario where login = ? and senha = ?; ";
                PreparedStatement preparedStatement = conn.prepareStatement(Sql);
                preparedStatement.setString(1, lg.getLogin());
                preparedStatement.setString(2, lg.getSenha());
                ResultSet result = preparedStatement.executeQuery();
                
                   
                    if (result.next()) {
                            String usuario = result.getString("login");
                            String nivelAcesso = result.getString("nv_acess");
                            session.setAttribute("usuario", usuario);
                            session.setAttribute("nivelAcesso", nivelAcesso);
                            response.sendRedirect("menu.jsp");                        
                    } else {
                        %>
                            <script>
                                alert("Login ou senha incorretos");
                                window.location.href=("index.html");
                            </script>
                        <%
                       }
            }
            catch(Exception ex){
                    ex.printStackTrace();
                    out.println("Erro: " + ex.toString());
                  }

                    conn.close();
        
             %>
        
        <%--// instância da classe de autenticação
        Login login = new Login();

        // Verifique se as credenciais são válidas
        boolean isAuthenticated = login.autenticar(username, password);

        if(isAuthenticated) {
            response.sendRedirect("menu.html");
        } else {
            %>
            <script>
                alert("Login ou senha incorretos");
                window.location.href=("index.html");
            </script>
            <%
        }
        %>--%>
        
    </body>
</html>
