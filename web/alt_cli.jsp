<%-- 
    Document   : alt_cli.jsp
    Created on : 27 de out. de 2023, 13:16:51
    Author     : Bruno Salles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controle.Cad_cli"%>
<%@page import="java.text.*" import="java.lang.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <title>CodeTech - Alterar Cliente</title>
    </head>
    <body>
        <section id="cad-cli">
            <div class="voltar"><a href="menu.jsp"><img src="imagem/voltar.png"></a></div>
            
            <a href="menu.jsp"><img src="imagem/logo.jpeg" alt="login" ></a>
            <form name="Frm_Login" method="post" action="alt_cli.jsp">
              <%
            
            // Recebendo dados
             Cad_cli cli = new Cad_cli();
            
            cli.setId(request.getParameter("id"));
            
            if(request.getParameter("transportar") != null ){
            
                try{
                Class.forName("com.mysql.jdbc.Driver"); //registra            
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtest", "root", ""); // abre Conn
                Statement stm = con.createStatement(); //cria uma instrução
                String Sql = "Select * FROM cliente where id =" +cli.getId();
                stm = con.createStatement();
                ResultSet rs = stm.executeQuery(Sql);
                    
                    if(rs.next()){
                       
                       cli.setRz_social(rs.getString("rz_social"));                       
                       cli.setCpf_cnpj(rs.getString("cnpj_cpf"));
                       cli.setEndereco(rs.getString("endereco"));
                       cli.setNumero(rs.getString("numero"));
                       cli.setBairro(rs.getString("bairro"));
                       cli.setCep(rs.getString("cep"));
                       cli.setMunicipio(rs.getString("municip"));
                       cli.setUf(rs.getString("uf"));
                       cli.setEmail(rs.getString("email"));
                       cli.setTelefone(rs.getString("telefone"));
                       cli.setCelular(rs.getString("celular"));
                            }
            }catch(Exception ex){
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
                  }
            %>  
           
        
            <%
                                 
                                    
                }else if(request.getParameter("Alterar") != null){    
                  // Recebendo dados
                    
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
          
            //Alterar!
            try{
                Class.forName("com.mysql.jdbc.Driver"); //registra            
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtest", "root", ""); // abre Conn
                Statement stmt = conexao.createStatement(); //cria uma instrução
                String sql = "UPDATE `cliente` SET `RZ_SOCIAL`='"+cli.getRz_social()+"',`CNPJ_CPF`='"+cli.getCpf_cnpj()+"',`ENDERECO`='"+cli.getEndereco()+
                                "',`NUMERO`='"+cli.getNumero()+"',`CEP`='"+cli.getCep()+"',`BAIRRO`='"+cli.getBairro()+"',`MUNICIP`='"+cli.getMunicipio()+"',`UF`='"+cli.getUf()+
                                "',`EMAIL`='"+cli.getEmail()+"',`TELEFONE`='"+cli.getTelefone()+"',`CELULAR`='"+cli.getCelular()+"' WHERE id = " +cli.getId();  //defin instr. SQL
                stmt.executeUpdate(sql); // exec. Query.
                conexao.close(); //fecha

            %>
                 <script>
                alert("Alterado com sucesso!");
                window.location.href=("alt_cli.jsp");
                </script>
            <%
            }
            catch(Exception ex){
                ex.printStackTrace();
            %>
                 <script>
                     alert("Erro: <%=ex.toString()%>");
                window.location.href=("alt_cli.jsp");
                </script>;
            <%
            }
        }
            
            
        %>
                     
                <p>
                    <input type="number" name="id" placeholder="ID Cliente *" value="<%= cli.getId() %>">
                    <button type="submit" class="bntTrsp" name="transportar" >Transporta</button>
                </p>
                
                <p>
                    <input type="text" name="cpf_cnpj" placeholder="Cnpj / Cpf *"  value="<%=cli.getCpf_cnpj() %>" > 
                 </p>
                 <p>
                     <input type="text" name="Rz_social" placeholder="Razão Social *"  value="<%=cli.getRz_social()%>"> 
                 </p>
                 <p>
                     <br><label ><b>Endereço:</b></label><br><br>
                    <input type="text" name="endereco" placeholder="Endereço *"  value="<%=cli.getEndereco()%>"> 
                     <input type="text" name="numero" placeholder="Número *"  value="<%=cli.getNumero()%>"> 
                 </p>
                 <p>
                    <input type="text" name="cep" placeholder="Cep *" value="<%=cli.getCep()%>"> 
                 </p>
                 <p>
                    <input type="text" name="bairro" placeholder="Bairro/Distrito *" value="<%=cli.getBairro()%>"> 
                 </p>
                 <p>
                    <input type="text" name="municipio" placeholder="Município *" value="<%=cli.getMunicipio()%>"> 
                 </p> 
                 <p>
                     <input type="text" name="uf" placeholder="UF *"  value="<%=cli.getUf()%>">
                 </p>
                 <p><br><label ><b>Contato:</b></label><br><br>
                    <input type="email" name="email" placeholder="Email *"  value="<%=cli.getEmail()%>"> 
                 </p>
                 <p>
                    <input type="tel" name="telefone" placeholder="Telefone *" value="<%=cli.getTelefone()%>"> 
                 </p>
                 <p>
                    <input type="tel" name="celular" placeholder="Celular *" value="<%=cli.getCelular()%>"> 
                 </p>
                 
                 <button type="submit" class="Alterar" name="Alterar" ><b>Alterar</b></button>
         
                 <script>
                     document.getElementById("id").value = "";
                     document.getElementById("cpf_cnpj").value = "";
                     document.getElementById("Rz_social").value = "";
                     document.getElementById("endereco").value = "";
                     document.getElementById("cep").value = "";
                     document.getElementById("bairro").value = "";
                     document.getElementById("municipio").value = "";
                     document.getElementById("uf").value = "";
                     document.getElementById("email").value = "";
                     document.getElementById("telefone").value = "";
                     document.getElementById("celular").value = "";
                                         
                     
                 </script>
                 <button  onclick="limparCampos" class="Limpar" ><b>Limpar</b></button>
                 
                            
            </form>
        </section> 
    </body>
</html>
</html>
