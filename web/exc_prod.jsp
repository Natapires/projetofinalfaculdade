<%-- 
    Document   : exc_cli
    Created on : 23 de out. de 2023, 13:55:50
    Author     : Bruno Salles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controle.Cad_prod"%>
<%@page import="java.text.*" import="java.lang.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-16" >
        <link rel="stylesheet" type="text/css" href="css/styles.css"> 
        <title>CodeTech - Excluir Produtos</title>
    </head>
    <body>
        <section id="cad-cli">
            <div class="voltar"><a href="menu.jsp"><img src="imagem/voltar.png"></a></div>
            
            <a href="menu.jsp"><img src="imagem/logo.jpeg" alt="login" ></a>
            <form name="Frm_Login" method="post" action="exc_prod.jsp">
              <%
            
            // Recebendo dados
             Cad_prod prod = new Cad_prod();
            
            prod.setId(request.getParameter("id"));
            
            if(request.getParameter("transportar") != null ){
            
                try{
                Class.forName("com.mysql.jdbc.Driver"); //registra            
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtest", "root", ""); // abre Conn
                Statement stm = con.createStatement(); //cria uma instrução
                String Sql = "Select * FROM produto where id =" +prod.getId();
                stm = con.createStatement();
                ResultSet rs = stm.executeQuery(Sql);
                    
                    if(rs.next()){
                       
                       prod.setDescricao(rs.getString("descricao"));                       
                       prod.setQtd(Double.parseDouble(rs.getString("qtd")));
                       prod.setValor(Double.parseDouble(rs.getString("valor")));
                       prod.setTp_unit(rs.getString("tp_unit"));
                       prod.setEspecif_tec(rs.getString("especif_tec"));
                      
                            }
            }catch(Exception ex){
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
                  }
            %>  
           
        
            <%
                 prod.setId(request.getParameter("id"));
                 
                }else if(request.getParameter("Excluir") != null){    
                  
          
            //Excluir!
            try{
                Class.forName("com.mysql.jdbc.Driver"); //registra            
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtest", "root", ""); // abre Conn
                Statement stmt = conexao.createStatement(); //cria uma instrução
                String sql = "DELETE FROM produto WHERE id = " +prod.getId();  //defin instr. SQL
                stmt.executeUpdate(sql); // exec. Query.
                conexao.close(); //fecha
            %>
                 <script>
                alert("Excluido com sucesso!");
                window.location.href=("exc_prod.jsp");
                </script>
            <%
            }
            catch(Exception ex){
                ex.printStackTrace();
            %>
                 <script>
                     alert("Erro: <%=ex.toString()%>");
                window.location.href=("exc_prod.jsp");
                </script>;
            <%
            }
        }
            
            
        %>
                     
                <p>
                    <input type="number" name="id" required="required" placeholder="ID Cliente *" value="<%= prod.getId() %>">
                    <button type="submit" class="bntTrsp" name="transportar" >Transporta</button>
                </p>
                
                <p>
                    <textarea name="descricao" required="required" placeholder="Descrição *" disabled="" >Desc.: <%=prod.getDescricao() %></textarea> 
                 </p>
                 <p>
                    <input type="text" name="qtd" required="required" placeholder="Quantidade *" disabled="" value="Qtd.: <%=prod.getQtd()%>"> 
                 </p>
                 <p>
                    <input type="text" name="tp_unit" required="required" placeholder="Tipo Unitário *" disabled="" value="<%= prod.getTp_unit() %>"> 
                 </p>
                 <p>
                    <input type="text" name="valor" required="" placeholder="Valor (R$) *" disabled="" value="Valor(R$) <%=prod.getValor()%>"> 
                 </p>
                 <p>
                     <textarea name="especif_tec" required="required" placeholder="Especificação Técnica *" disabled="" ><%=prod.getEspecif_tec()%></textarea>
                 </p> 
                
                 
                 <button type="submit" class="Excluir" name="Excluir" ><b>Exluir</b></button>
                 
                 
                 <button  onclick="limparCampos" class="Limpar" ><b>Limpar</b></button>
                 
                            
            </form>
        </section> 
    </body>
</html>
