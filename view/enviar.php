<!DOCTYPE html>
<html>
<head>
<title>Enviar Mensagem - BussMen</title>
</head>
<body>
    <?php
        include("../include/SessaoValidate.php");  
        include_once("../controller/UserController.php");
            $pesq = new UserController();
    ?> 
	<br>
	<h2 style="padding-top:3vh;align-items: center; justify-content:center; text-align: center;">Enviar Mensagem</h2><br>
    <form id="formenviar" name="formenviar" method="post" action="enviar.php" style="padding-top:3vh;align-items: center; justify-content:center; text-align: center;">
  <p>
    <label>Insira seu Recado Aqui:</label></p>
    <p><textarea name="mensagem" cols="120" rows="12"></textarea></p>  

    <label for="">Deseja Enviar á um Grupo? </label>
    <select name="envgrp" id="envgrp"><?php $pesq->buscaCadastro(1);?></select><br>
    
    <label for="">Deseja Enviar á um Usuário? </label>
    <select name="envusr" id="envusr"><?php $pesq->buscaCadastro(2);?></select><br>
   
    <input type="submit" name="button" id="button" value="Enviar"></input>
    </form>
    <?php
        include 'footer.php'; 
    ?> 
</body>
</html>