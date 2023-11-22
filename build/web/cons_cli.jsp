<%-- 
    Document   : cliente
    Created on : 14/09/2023, 20:15:24
    Author     : alunos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controle.Cad_cli"%>
<%@page import="java.text.*" import="java.lang.*"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles_2.css">
        <title>CodeTech - Consulta Clientes</title>
    </head>
    
    <body>
         <div class="cons-cli"> 
             <span><a href="menu.jsp"><img src="imagem/voltar.png"></a></span>
             
          <header class="cons_cliente">
                <div class="logo" ><a href="menu.jsp"><img src="imagem/logo.jpeg" ></a></div>
                <form method="post">
                    <p>
                        <input type="text" class="Id "name="id" placeholder="ID">  
                    </p>
                     <p>
                        <input type="text" class="Rz_social" name="Rz_social" placeholder="Razão Social "> 
                     </p>
                     <button type="submit">Buscar</button>
                </form>
            </header>        
                 <%    
            Cad_cli cli = new Cad_cli();
            
            cli.setRz_social(request.getParameter("Rz_social"));
            cli.setId(request.getParameter("id"));
            
            
            //Consultar
            try{
                Class.forName("com.mysql.jdbc.Driver"); //registra            
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtest", "root", ""); // abre Conn
                Statement stmt = conexao.createStatement(); //cria uma instrução
                ///          SELECT * FROM clientes WHERE id = 3;
                String sql = "select*from cliente where Rz_social LIKE '%" +cli.getRz_social()+ "%' and id LIKE '%" + cli.getId() + "%';"; //defin instr. SQL
               // String sql = "SELECT * FROM clientes " ; //defin instr. SQL
                ResultSet rs = stmt.executeQuery(sql); // exec. Query.
            %>  
            <table style="">
                    <tr>
                        <th style="width: 30px">#.</th>
                        <th style="width: 30px">Id.</th>
                        <th style="width: 450px">Razão Social</th>
                        <th style="width: 450px">Cpf/Cnpj</th>
                        <th style="width: 250px">Endereço</th>
                        <th style="width: 50px">Número</th>
                        <th style="width: 100px">Cep</th>
                        <th style="width: 250px">Bairro</th>
                        <th style="width: 250px">Município</th>
                        <th style="width: 30px">Uf</th>
                        <th style="width: 250px">Email</th>
                        <th style="width: 250px">Telefone</th>
                        <th style="width: 250px">Celular</th>
                        <th style="width: 250px">Data de Entrada</th>
                    </tr>
                        
            <%
                //Saída
                while (rs.next()){
            %>
                    <tr>
                        <td><%= rs.getRow()%></td>
                        <td><%= rs.getString("id")%></td>
                        <td><%= rs.getString("Rz_social")%></td>
                        <td><%= rs.getString("cnpj_cpf")%></td>
                        <td><%= rs.getString("endereco")%></td>
                        <td><%= rs.getString("numero")%></td>
                        <td><%= rs.getString("cep")%></td>
                        <td><%= rs.getString("bairro")%></td>
                        <td><%= rs.getString("municip")%></td>
                        <td><%= rs.getString("uf")%></td>
                        <td><%= rs.getString("email")%></td>
                        <td><%= rs.getString("telefone")%></td>
                        <td><%= rs.getString("celular")%></td>
                        <td><%= rs.getString("DataCadastro")%></td>
                    </tr>
            <%
                }             
            %> 
            </table>
            <%
                conexao.close(); //fecha                
            }
            catch(Exception ex){
                ex.printStackTrace();
             %>
                <script>
                     alert("Erro: <%=ex.toString()%>");
                    window.location.href=("cons_cli.jsp");
                </script>;
             <%
            }     

        %>
        </div>
    </body>
</html>

