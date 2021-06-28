<?php
    include("../include/SessaoValidate.php");  
    include_once("../controller/UserController.php");
    include_once("../model/User.php");
    require_once("../model/Mensagem.php");
    include_once("../model/UserDAO.php");
    $pesq = new UserController();
    $obj = new UserController();
    $obj->inserirMensagemG();

    include 'footer.php'; 
    ?> 
<!DOCTYPE html>
<html>
<head>
<title>Enviar Mensagem - BussMen</title>
<script>
</script>
</head>
<body>
	<br>
	<h2 style="padding-top:3vh;align-items: center; justify-content:center; text-align: center;">Enviar Mensagem</h2>
    <form id="formenviar" name="formenviar" method="post" action="enviar.php" style="padding-top:3vh;align-items: center; justify-content:center; text-align: center;">
  
    <label><h4>Insira seu Recado Aqui:</h4></label><br>
    <label><h6>Limite de 200 Caracteres</h6></label>
    <p><textarea name="mensagem" cols="65" rows="4" maxlength="200" required></textarea></p>  
    <!-- <input type="text" name="idLogin" id="idLogin"></input> -->
    
    <label for="">Deseja Enviar á um Grupo? </label>
    <select name="envgrp" id="envgrp"><?php $pesq->buscaCadastro(1);?></select><br>
    
    <label for="">Deseja Enviar á um Usuário? </label>
    <select name="envusr" id="envusr"><?php $pesq->buscaCadastro(2);?></select><br>
   
    <input type="submit" name="button" id="button" value="Enviar"></input>
    </form>
</body>
</html>