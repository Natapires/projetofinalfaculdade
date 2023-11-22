<%-- 
    Document   : menu.jsp
    Created on : 27 de out. de 2023, 09:34:47
    Author     : Bruno Salles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controle.Login"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*" import="java.lang.*"%>
<%@page import="java.time.format.DateTimeFormatter" import="java.time.LocalDateTime"%>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CodeTech - Menu </title>
        <link rel="stylesheet" type="text/css" href="css/styles.css">
    </head>
    <body>
        <section id="txt-menu">
        <nav>
        <ul>
            <li class="dropdown">
                <a href="menu.jsp">Relatórios</a>
                <div class="drop-menu">
                    <a href="rel_pv.html">Produtos Vendidos(Trimestral)</a>
                    <a href="relat_mov_estoque.jsp">Movimento de Estoque(E/S)</a>
                </div>              
            </li>              
            <li class="dropdown">  
                <a href="menu.jsp">Vendas</a>
                <div class="drop-menu">
                    <div class="cliente">
                        <a href="menu.jsp" >Cliente</a>
                            <div class="submenu">
                                <a href="cad_cli.html">Cadastrar</a>
                                <a href="alt_cli.jsp">Alterar</a>
                                <a href="exc_cli.jsp">Excluir</a>
                            </div>
                    </div>
                    <div class="produto">
                        <a href="menu.jsp">Produto</a>
                            <div class="submenu">
                                <a href="cad_prod.html">Cadastrar</a>
                                <a href="alt_prod.jsp">Alterar</a>
                                <a href="exc_prod.jsp">Excluir</a>
                            </div>
                    </div>
                     <a href="pedido_pv.jsp">Pedido de Venda</a>
                </div>
                    
            </li>
            <li class="dropdown">
                <a href="menu.jsp">Consulta</a>
                <div class="drop-menu">
                    <a href="cons_cli.jsp">Cliente</a>
                    <a href="cons_prod.jsp">Produto</a>
                    <a href="cons_ped.jsp">Pedido de Venda</a>
                </div>
            </li>
            <li>
                <a href="#" id="sair">Sair</a>
                 <script>
                        document.getElementById("sair").addEventListener("click", function() {
                            alert("Você faz parte da nossa história. Até Breve!");
                            window.location.href=("index.html");
                        });
    </script>
            </li>
        </ul>
    </nav>
            <center class="menu-principal">
                <img src="imagem/logo.jpeg" alt="login">
            </center>
            <footer>
            <div class="main-content">
			<div class="left box">
				<h2> Sobre nós</h2>
				<div class="content">
					<p> Potencialize seus negócios com a eficiência inovadora do software de gestão de vendas da CodeTech:a solução que impulsiona o seu sucesso. </p>
				
					<div class="social">
                                            <%
                                                Login lg = new Login();
                                                LocalDateTime agora = LocalDateTime.now();
                                                DateTimeFormatter formateData = DateTimeFormatter.ofPattern("dd/MM/yy");
                                                String dtagora = formateData.format(agora);

                                                DateTimeFormatter formateHora = DateTimeFormatter.ofPattern("HH:mm:ss");
                                                String hora = formateHora.format(agora);
                                                
                                                
                                           
                                            %>
                                            
                                            <br>
                                            <p>
                                                <img src="imagem/user.png" alt="img user"/> <label id="login"> Usuário:<%= session.getAttribute("usuario") %></label><br>
                                                <img src="imagem/contro_acess.png" alt="img nives de acess"/><label > Nível de Acesso:<%= session.getAttribute("nivelAcesso") %></label><br>
                                                <img src="imagem/data.png" alt="img data"/><label> Data:<%= dtagora %></label><br>
                                                <img src="imagem/hora.png" alt="img hora"/><label> Hora:<%= hora %></label><br>
                                            </p>
                                            <%--<a href="#"><span class="fab fa-facebook-f"></span></a>
						<a href="#"><span class="fab fa-twitter"></span></a>
						<a href="#"><span class="fab fa-instagram"></span></a>
						<a href="#"><span class="fab fa-youtube"></span></a>--%>
					</div>
				</div>
			</div><!--left box-->
			<div class="center box">
				<h2>Contato</h2>
				<div class="content">
					<div class="place">
						<span class="fas fa-map-marker"></span>
						<span class="text"><a href="https://www.linkedin.com/in/bruno-salles-b752b4187/" target="_blank"><img src="https://img.shields.io/badge/-LinkedIn-%230077B5?style=for-the-badge&logo=linkedin&logoColor=white" ></a></span>
					</div>

					<div class="phone">
						<span class="fas fas fa-phone-alt"></span>
						<span class="text"> <a href="https://wa.me/+5511956996426" target="_blank"><img src="https://img.shields.io/badge/WhatsApp-25D366?style=for-the-badge&logo=whatsapp&logoColor=white" /></a></span>
					</div>

					<div class="email">
						<span class="fas fa-envelope"></span>
                                                <span class="text">brx14.bruno@gmail.com</span>
					</div>
				</div>
			</div>
			<div class="right box">
				<h2>Contato</h2>
				<div class="content">
					<form action="emailForm">
                                            <div class="email"><br>
							<input type="email" name="email" required placeholder="Destinatário Codetech *">
						</div>
                                                <div class="msg"><br>
                                                    <textarea rows="2" cols="25" name="assunto" placeholder="Assunto *" required></textarea>
                                                </div><br>
                                                <div class="msg">
							<textarea rows="2" cols="25" required name="mensagem" placeholder="Mensagem *"></textarea>
						</div>
						<div class="btn">
							<button type="submit">Enviar</button>
						</div>
					</form>
                                    
				</div>
			</div>
		</div><!--main-content-->
	</footer>
        </section>
       </body>
</html>
