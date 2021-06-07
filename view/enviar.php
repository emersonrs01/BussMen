<!DOCTYPE html>
<html>
<head>
<title>Enviar Mensagem - BussMen</title>
</head>
<body>
    <?php
        include("../include/SessaoValidate.php");  
    ?> 
	<br>
	<h2>Enviar Mensagem</h2><br>
    <form id="formenviar" name="formenviar" method="post" action="enviar.php">
  <p>
    <label>Insira seu Recado Aqui:</label></p>
    <p><textarea name="mensagem" cols="120" rows="7"></textarea></p>  

<p><input type="submit" name="button" id="button" value="Enviar"></p>
</form>

<?php
    include_once("../controller/UserController.php");
    $pesq = new UserController();
    $pesq->buscaCadastro();
  ?>

    <?php
        include 'footer.php'; 
    ?> 
</body>
</html>