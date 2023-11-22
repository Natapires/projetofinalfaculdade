<%-- 
    Document   : cliente
    Created on : 14/09/2023, 20:15:24
    Author     : alunos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controle.Cad_prod"%>
<%@page import="java.text.*" import="java.lang.*"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles_2.css">
        <title>CodeTech - Relatório Movimento de Estoque</title>
    </head>
    
    <body>
         <div class="cons-cli"> 
             <span><a href="menu.jsp"><img src="imagem/voltar.png"></a></span>
             
          <header class="cons_cliente">
                <div class="logo" ><a href="menu.jsp"><img src="imagem/logo.jpeg" ></a></div>
                <form method="post" action="relat_mov_estoque.jsp">
                    <p>
                        <input type="text" class="Id "name="id" placeholder="ID">  
                    </p>
                     <p>
                        <input type="text" class="Descri" name="descricao" placeholder="Descrição"> 
                     </p>
                     <button type="submit">Gerar Relatório</button>
                </form>
            </header>        
                 <%    
            Cad_prod prod = new Cad_prod();
            
            prod.setDescricao(request.getParameter("descricao"));
            prod.setId(request.getParameter("id"));
            
            
            //Consultar
            try{
                Class.forName("com.mysql.jdbc.Driver"); //registra            
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtest", "root", ""); // abre Conn
                Statement stmt = conexao.createStatement(); //cria uma instrução
                ///          SELECT * FROM clientes WHERE id = 3;
                String sql = "SELECT  `produto_id`, `qtd`, `valor`, `descricao`, `especif_tec`, `data_hora`, `tipo_operacao`,`tp_unit` FROM `historico_produto` WHERE descricao LIKE '%" + prod.getDescricao() + "%' and id LIKE '%" + prod.getId() + "%';"; //defin instr. SQL
               // String sql = "SELECT * FROM clientes " ; //defin instr. SQL
                ResultSet rs = stmt.executeQuery(sql); // exec. Query.
            %>  
            <table style="width: 90%;">
                    <tr>
                        <th style="width: 30px;">#.</th>
                        <th style="width: 30px;">Id. Produto</th>
                        <th style="width: 400px;">Descricão</th>
                        <th style="width: 50px;">Qtd.:</th>
                        <th style="width: 50px;">Valor(R$)</th>
                        <th style="width: 50px;">Tipo Unit.</th>
                        <th style="width: 400px;">Especificação Técnica</th>
                        <th style="width: 300px;">Data de Movimento</th>
                        <th style="width: 300px;">Tipo de operação</th>
                    </tr>
                        
            <%
                //Saída
                while (rs.next()){
            %>
                    <tr>
                        <td><%= rs.getRow()%></td>
                        <td><%= rs.getString("produto_id")%></td>
                        <td><%= rs.getString("descricao")%></td>
                        <td><%= rs.getString("qtd")%></td>
                        <td><%= rs.getString("valor")%></td>
                        <td><%= rs.getString("tp_unit")%></td>
                        <td><%= rs.getString("especif_tec")%></td>
                        <td><%= rs.getString("data_hora")%></td>
                        <td><%= rs.getString("tipo_operacao")%></td>
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
                    window.location.href=("relat_mov_estoque.jsp");
                </script>;
             <%
            }     

        %>
        </div>
    </body>
</html>

