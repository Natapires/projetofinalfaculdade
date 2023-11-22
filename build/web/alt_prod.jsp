<%-- 
    Document   : alt_cli.jsp
    Created on : 27 de out. de 2023, 13:16:51
    Author     : Bruno Salles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controle.Cad_prod"%>
<%@page import="java.text.*" import="java.lang.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <title>CodeTech - Alterar Produto</title>
    </head>
    <body>
        <section id="cad-cli">
            <div class="voltar"><a href="menu.jsp"><img src="imagem/voltar.png"></a></div>
            
            <a href="menu.jsp"><img src="imagem/logo.jpeg" alt="login" ></a>
            <form name="Frm_Login" method="post" action="alt_prod.jsp">
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
                                 
                                    
                }else if(request.getParameter("Alterar") != null){    
                  // Recebendo dados
                    
                        prod.setDescricao(request.getParameter("descricao"));
                        prod.setQtd(Double.parseDouble(request.getParameter("qtd")));
                        prod.setValor(Double.parseDouble(request.getParameter("valor")));
                        prod.setTp_unit(request.getParameter("tp_unit"));
                        prod.setEspecif_tec(request.getParameter("especif_tec"));
                       
            //Alterar!
            try{
                Class.forName("com.mysql.jdbc.Driver"); //registra            
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtest", "root", ""); // abre Conn
                Statement stmt = conexao.createStatement(); //cria uma instrução
                String sql = "UPDATE `produto` SET `qtd`='"+prod.getQtd()+"',`valor`='"+prod.getValor()+"',`descricao`='"+prod.getDescricao()+
                "',`especif_tec`='"+prod.getEspecif_tec()+"',`tp_unit`='"+prod.getTp_unit()+"' WHERE id ="+prod.getId();
                stmt.executeUpdate(sql); // exec. Query.
                conexao.close(); //fecha

            %>
                 <script>
                alert("Alterado com sucesso!");
                window.location.href=("alt_prod.jsp");
                </script>
            <%
            }
            catch(Exception ex){
                ex.printStackTrace();
            %>
                 <script>
                     alert("Erro: <%=ex.toString()%>");
                window.location.href=("alt_prod.jsp");
                </script>;
            <%
            }
        }
            
            
        %>
                     
                <p>
                    <input type="number" name="id" placeholder="ID Cliente *" value="<%= prod.getId() %>">
                    <button type="submit" class="bntTrsp" name="transportar" >Transporta</button>
                </p>
                
                <p>
                    <textarea name="descricao" placeholder="Descrição *" ><%=prod.getDescricao() %></textarea>
                 </p>
                 <p>
                     <input type="number" name="qtd" placeholder="Quantidade *"  value="<%=prod.getQtd()%>"> 
                 </p>
                  
                 <p>
                     <input type="number" name="valor" placeholder="Valor(R$) *"  step="0.01" inputmode="decimal" value="<%=prod.getValor()%>" > 
                 </p>
                 <p>
                    <input type="text" name="tp_unit" placeholder="Tipo Unitário *" value="<%=prod.getTp_unit()%>"> 
                 </p>
                 <p>
                     <textarea name="especif_tec" placeholder="Especificação Técnica *" ><%=prod.getEspecif_tec()%></textarea> 
                 </p>
                           
                 
                 <button type="submit" class="Alterar" name="Alterar" ><b>Alterar</b></button>                
                 <button  onclick="limparCampos" class="Limpar" ><b>Limpar</b></button>
                 
                            
            </form>
        </section> 
    </body>
</html>
</html>
