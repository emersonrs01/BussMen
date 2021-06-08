<!DOCTYPE html>
<html>
<head>
<title>BussMen - Alteração de Usuários</title>
</head>
<body>
    <?php
        include("../include/SessaoValidate.php");  
        include_once("../controller/UserController.php");
            $pesq = new UserController();
    ?> 
	<br>
	<h5 style="padding-top:3vh;align-items: center; justify-content:center; text-align: center;">Adição de Usuários</h5>

    <form id="formuser" name="formuser" method="post" action="usuarios.php" style="padding-top:3vh;align-items: center; justify-content:center; text-align: center;">
    <div><label for="username">Digite o Novo Usuário:</label>
    <input type="text" id="username" name="username"></div>

    <div><label for="pass">Digite a Senha (8 Caracteres):</label>
    <input type="password" id="pass" name="password" minlength="8" required></div>

    <label>Este Usuário Pertencerá a Qual Grupo?</label>
    <select name="envusr" id="envusr"><?php $pesq->buscaCadastro(1);?></select><br>
    <input type="submit" name="button" id="button" value="Criar"></input></form><br>

    <h5 style="padding-top:3vh;align-items: center; justify-content:center; text-align: center;">Alteração de Senha</h5>
    <form id="formusergrp" name="formusergrp" method="post" action="usuarios.php" style="padding-top:3vh;align-items: center; justify-content:center; text-align: center;">
    <label>Deseja Atualizar a Senha de Qual Usuário? </label>
    <select name="envusr" id="envusr"><?php $pesq->buscaCadastro(2);?></select><br>
    
    <div><label for="passalt">Digite a Nova Senha (8 Caracteres):</label>
    <input type="password" id="passalt" name="password" minlength="8" required></div>
    <input type="submit" name="button" id="button" value="Alterar"></input></form>

    <?php
        include 'footer.php'; 
    ?> 
</body>
</html>