<%-- 
    Document   : alt_cli.jsp
    Created on : 27 de out. de 2023, 13:16:51
    Author     : Bruno Salles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controle.Cad_cli"%>
<%@page import="controle.Cad_prod"%>
<%@page import="controle.Pedido"%>
<%@page import="java.text.*" import="java.lang.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <title>CodeTech - Pedido de Venda</title>
    </head>
    <body>
        <section id="cad-cli" style="width: 60%; margin-left: 20% ; margin-top:0;"  >
            <div class="voltar"><a href="menu.jsp"><img src="imagem/voltar.png"></a></div>
            
            <a href="menu.jsp"><img src="imagem/logo.jpeg" alt="login" ></a>
            <form name="Frm_Login" method="post" action="pedido_pv.jsp">
              <%
            
            // Recebendo dados
                Cad_prod prod = new Cad_prod();
                Cad_cli cli = new Cad_cli();
                Pedido ped = new Pedido();
            
            cli.setId(request.getParameter("fk_cliente"));
            prod.setId(request.getParameter("id_prod"));
            
            if( request.getParameter("transportar") != null){
            
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
                      
                            }
                    }catch(Exception ex){
                        ex.printStackTrace();
                        out.println("Erro: " + ex.toString());
                          }
                                  
                    
                    
                    try{
                        Class.forName("com.mysql.jdbc.Driver"); //registra            
                        Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtest", "root", ""); // abre Conn
                        Statement stmt = conexao.createStatement(); //cria uma instrução
                        String sql = "select * FROM produto WHERE id = " +prod.getId();  //defin instr. SQL
                        stmt = conexao.createStatement();
                        ResultSet rs = stmt.executeQuery(sql); // exec. Query.
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
                        
                        
                  }else if(request.getParameter("Gerar") != null){    
                  // Recebendo dados
                        cli.setId(request.getParameter("fk_cliente"));
                        prod.setId(request.getParameter("id_prod"));
                        prod.setDescricao(request.getParameter("descricao"));
                        prod.setQtd(Double.parseDouble(request.getParameter("qtd")));
                        prod.setValor(Double.parseDouble(request.getParameter("valor")));
                        prod.setTp_unit(request.getParameter("tp_unit"));
                        prod.setEspecif_tec(request.getParameter("especif_tec"));
                        ped.setDt_entrega(request.getParameter("dt_entrega"));
                        ped.setTp_frete(request.getParameter("tp_frete"));
                        
                        Double vlTotalParam ;
                        
                        Double estoque = Double.parseDouble(request.getParameter("estoque"));
                        Double qtd = Double.parseDouble(request.getParameter("qtd"));
                        Double vlUnit = Double.parseDouble(request.getParameter("valor"));
                        vlTotalParam = (vlUnit * qtd);
                        
                        estoque = estoque - qtd;
                        
                        
                        
                    //Gerar Pedido!
                    try{
                        Class.forName("com.mysql.jdbc.Driver"); //registra            
                        Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbtest", "root", ""); // abre Conn
                        Statement stmt = conexao.createStatement(); //cria uma instrução
                        String sql = "INSERT INTO `pedido`(`id_prod`, `qtd`, `dt_entrega`, `tp_unit`, `data_venda`, `valorUnit`, `valorTotal`, `descricao`, `especif_tec`, `tp_frete`, `fk_cliente`) "
                        + "VALUES ('"+prod.getId()+"','"+prod.getQtd()+"','"
                        +ped.getDt_entrega()+"','"+prod.getTp_unit()+"'"
                        + ",NOW(),'"+prod.getValor()+"',"
                        + "'"+vlTotalParam+"',"
                        + "'"+prod.getDescricao()+
                        "','"+prod.getEspecif_tec()+
                        "','"+ped.getTp_frete()+
                        "','"+cli.getId()+"');";
                        String updt = "UPDATE PRODUTO SET QTD ="+estoque+" WHERE ID ="+prod.getId()+" ;";
                        stmt.executeUpdate(sql); // exec. Query.
                        stmt.executeUpdate(updt); // exec. Query.
                        conexao.close(); //fecha

                    %>             
                         <script>
                        alert("Pedido Gerado!");
                        window.location.href=("pedido_pv.jsp");
                        </script>
                    <%
                    }
                    catch(Exception ex){
                        ex.printStackTrace();
                    %>
                         <script>
                             alert("Erro: <%=ex.toString()%>");
                        window.location.href=("pedido_pv.jsp");
                        </script>;
                    <%
                    }
                }


                %>
       
                <p style="margin-left: 10%; text-align: left;" >
                <label >ID Cliente:</label><label style="margin-left: 8%">ID Produto:</label><br>
                <input type="number" name="fk_cliente" placeholder="ID Cliente *"  value="<%= cli.getId() %>" style="width:16%;">
                    
                    <input type="number" name="id_prod"  placeholder="ID Produto *" value="<%=prod.getId()%>" style="width:17%; margin: 1%">
                </p>
                <button class="bntTrsp" name="transportar" >Transporta</button>
                
                
                <h3 style="margin-top: 5%;">Dados do Cliente</h3><br>
                <p>
                    <input type="text" name="cpf_cnpj" placeholder="Cnpj / Cpf *" readonly="" value="<%=cli.getCpf_cnpj() %>" > 
                 </p>
                 <p>
                     <input type="text" name="Rz_social" placeholder="Razão Social *" readonly="" value="<%=cli.getRz_social()%>"> 
                 </p>       
                 <h3>Dados do Produto</h3><br>               
                <p>
                    <textarea name="descricao"  placeholder="Descrição *" readonly="" ><%=prod.getDescricao() %></textarea> 
                 </p>
                 <p style="margin-left: 10%;text-align: left;color:red;">
                   <label><b>Estoque:</b></label>
                 </p>
                 <p>
                     <input style="color:red;" type="text" name="estoque" readonly="" value="<%=prod.getQtd()%>"> 
                    <input type="number" name="qtd"  placeholder="Quantidade *" oninput="calcularTotal(); checkEstoque();" > 
                 </p>
                 <p>
                    <input type="text" name="tp_unit"  placeholder="Tipo Unitário *" readonly="" value="<%= prod.getTp_unit() %>"> 
                 </p>
                 <p>
                     <input type="number" name="valor"  placeholder="Valor (R$) *" readonly="" value="<%=prod.getValor()%>"> 
                 </p>
                 <p>
                     <textarea name="especif_tec"  placeholder="Especificação Técnica *" readonly="" ><%=prod.getEspecif_tec()%></textarea>
                 </p> 
                 <h4>Data de Entrega</h4>
                 <input type="date" id="data-entrega" name="dt_entrega" ><br>
                 </p>   
                        
                 <select id="tipo-frete" name="tp_frete" class="bntTrsp" >
                    <option value="CIF">CIF</option>
                    <option value="FOB">FOB</option>
                </select><br>

                <p><h3 style="margin-right: 0;margin-left: 65%;"><b>Total: <label name="vl_total" id="total">R$ 0.00</label></b></h3></p><br>
                        
                <button  type="submit" class="Alterar" name="Gerar" ><b>Gera Pedido</b></button>
                <button  onclick="limparCampos" class="Limpar" ><b>Limpar</b></button>                    
                
                <script>
                    function calcularTotal() {
                        var qtd = parseFloat(document.querySelector("input[name='qtd']").value) || 0;
                        var valor = parseFloat(document.querySelector("input[name='valor']").value) || 0;
                
                    var total = qtd * valor;
                        document.querySelector("#total").textContent = "R$ " + total.toFixed(2);
                    }
                        $.ajax({
                            type: "POST",
                            url: "pedido_pv.jsp",
                            data: {
                                total: total
                            },
                            success: function (response) {
                                // Lidar com a resposta do servidor, se necessário
                            },
                            error: function () {
                                // Lidar com erros na solicitação, se necessário
                            }
                        });
                
                    function limparCampos() {
                        document.querySelector("input[name='qtd']").value = "";
                        document.querySelector("input[name='valor']").value = "";
                        document.querySelector("#total").textContent = "R$ 0.00";
                    }
                     function checkEstoque() {
                        var quantidadeDesejada = parseInt(document.getElementsByName("qtd")[0].value);
                        var estoqueDisponivel = parseInt("<%=prod.getQtd()%>");

                        if (quantidadeDesejada > estoqueDisponivel) {
                            alert("Estoque insuficiente. A quantidade desejada é maior que o estoque disponível.");
                            window.location.href=("pedido_pv.jsp");
                            btnGerar = document.getElementById('Gerar');
                            btnGerar.setAttribute('disabled','');
                        }
                    }
                </script>  
                
            </form>
        </section> 
    </body>
</html>
</html>
