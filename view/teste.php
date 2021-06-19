<!DOCTYPE html>
<html>
<head>
<title>Mensagens Recebidas - BussMen</title>
<link rel="stylesheet" href="../resources/estilosmr.css">
</head>
<body>
<?php
        include("../include/SessaoValidate.php");  
        include_once("../controller/UserController.php");
            $pesq = new UserController();
    ?> 
<?php

require_once("../model/FabricaConexao.php");
require_once("../model/User.php");
require_once("../model/Mensagem.php");
require_once("../model/UserDAO.php");
echo $_POST["username"].", ".$_POST["password"].", ".$_POST["data_nasc"].", ".$_POST["envgrp"];
?>
    <?php
        include 'footer.php'; 
    ?> 
</body>
</html>