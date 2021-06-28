<?php
    include_once("../include/SessaoValidate.php"); 
    include_once("../controller/UserController.php");
    include_once("../model/User.php");
    include_once("../model/UserDAO.php");
    $pesq = new UserController();
    $obj = new UserController();
    $obj->inserirGrupo();
    $obj->renomeiaGrupo();
    $obj->alteraGrupo();
    include_once('footer.php'); 
    ?>
<!DOCTYPE html>
<html>
<head>
<title>BussMen - Alteração de Grupos</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<br>
	<h5 style="padding-top:3vh;align-items: center; justify-content:center; text-align: center;">Adição de Grupos</h5>

    <form id="insgrp" name="insgrp" method="post" action="grupos.php" style="padding-top:3vh;align-items: center; justify-content:center; text-align: center;">
    <label>Apenas Listando os Grupos Atuais:</label>
    <select name="listagrp" id="listagrp"><?php $pesq->buscaCadastro(1);?></select><br>
    <div><label for="insgrp">Digite o Novo Grupo:</label>
    <input type="text" id="group" name="insgrp"></div>
    <input type="submit" name="button" id="button" value="Criar"></input><br>
    </form><br>

    <h5 style="padding-top:3vh;align-items: center; justify-content:center; text-align: center;">Renomear Grupos</h5>

    <form id="formgrp" name="formgrp" method="post" action="grupos.php" style="padding-top:3vh;align-items: center; justify-content:center; text-align: center;">
        <label>Selecione o Grupo a Ser Renomeado</label>
        <select name="renomgrp" id="renomgrp"><?php $pesq->buscaCadastro(1);?></select><br>
        <div><label for="group">Digite o Novo Nome:</label>
        <input type="text" id="groupnvnm" name="groupnvnm"></div>
        <input type="submit" name="button" id="button" value="Renomear"></input><br></form><br>

    <h5 style="padding-top:3vh;align-items: center; justify-content:center; text-align: center;">Alteração de Usuários</h5>
    <form id="formalterausrgrp" name="formalterausrgrp" method="post" action="grupos.php" style="padding-top:3vh;align-items: center; justify-content:center; text-align: center;">
    <label>Deseja Alterar Qual Usuário? </label>
    <select name="altgrpusr" id="altgrpusr"><?php $pesq->buscaCadastro(2);?></select><br>
    <label>Para Qual Grupo? </label>
    <select name="altusrgrp" id="altusrgrp"><?php $pesq->buscaCadastro(1);?></select><br>
    <input type="submit" name="button" id="button" value="Alterar"></input><br></form><br>

</body>
</html>