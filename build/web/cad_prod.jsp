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
        <title> Cadastro Produto</title>
    </head>
    <body>
       
        <%
            // Recebendo dados
            Cad_prod prod = new Cad_prod();  //instância
            prod.setDescricao(request.getParameter("descricao"));
            prod.setQtd(Double.parseDouble(request.getParameter("qtd")));
            prod.setValor(Double.parseDouble(request.getParameter("valor")));
            prod.setTp_unit(request.getParameter("tp_unit"));
            prod.setEspecif_tec(request.getParameter("especif_tec"));
            
            
            //GRAVAR!
            try{
                Class.forName("com.mysql.jdbc.Driver"); //registra            
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtest", "root", ""); // abre Conn
                Statement stmt = conexao.createStatement(); //cria uma instrução
                String sql = "INSERT INTO `produto`( `qtd`, `valor`, `descricao`, `especif_tec`, `tp_unit`,`DataCadastro`) VALUES ("+ prod.getQtd() +","
                                +prod.getValor()+",'"+prod.getDescricao()+"','"+prod.getEspecif_tec()+"','"+prod.getTp_unit()+"', NOW())";
                stmt.executeUpdate(sql); // exec. Query.
                conexao.close(); //fecha
                %>
                
                <script>
                alert("Cadastro efetuado com sucesso!");
                window.location.href=("cad_prod.html");
                </script>
                
                <%
            }
            catch(Exception ex){
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }
            
            
           

        %>
    </body>
</html>

