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
        <title>Cadastro de Clientes</title>
    </head>
    <body>
       
        <%
            // Recebendo dados
            Cad_cli cli = new Cad_cli();  //instância
            cli.setRz_social(request.getParameter("Rz_social"));
            cli.setCpf_cnpj(request.getParameter("cpf_cnpj"));
            cli.setEndereco(request.getParameter("endereco"));
            cli.setNumero(request.getParameter("numero"));
            cli.setCep(request.getParameter("cep"));
            cli.setBairro(request.getParameter("bairro"));
            cli.setMunicipio(request.getParameter("municipio"));
            cli.setUf(request.getParameter("uf"));
            cli.setEmail(request.getParameter("email"));
            cli.setTelefone(request.getParameter("telefone"));
            cli.setCelular(request.getParameter("celular"));
            
            //GRAVAR!
            try{
                Class.forName("com.mysql.jdbc.Driver"); //registra            
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtest", "root", ""); // abre Conn
                Statement stmt = conexao.createStatement(); //cria uma instrução
                String sql = "INSERT INTO cliente (RZ_SOCIAL,CNPJ_CPF,ENDERECO,NUMERO,CEP,BAIRRO,MUNICIP,UF,EMAIL,TELEFONE,CELULAR)"
                + "VALUES ('"+cli.getRz_social()+"','"+cli.getCpf_cnpj()+"','"+cli.getEndereco()+"','"+cli.getNumero()+"','"+cli.getCep()+"','"+cli.getBairro()+"','"+cli.getMunicipio()+"','"+cli.getUf()+"','"+cli.getEmail()+"','"+cli.getTelefone()+"','"+cli.getCelular()+"');"; //defin instr. SQL
                stmt.executeUpdate(sql); // exec. Query.
                conexao.close(); //fecha
                %>
                
                <script>
                alert("Cadastro efetuado com sucesso!");
                window.location.href=("menu.html");
                </script>
                
                <%
            }
            catch(Exception ex){
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }
            
            
            //Saída
            //out.println("<b> Registro - Clientes </b>");
            //out.println("<br> Identificação: " + cli.getId());
            //out.println("<br> Nome: " + cli.getNome());
            //out.println("<br> Idade: " + cli.getIdade());
            //out.println("<br> Renda: " + cli.getRenda());

        %>
    </body>
</html>

