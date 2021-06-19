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
 $DAO = new UserDAO();
$cgrupo =  $DAO->ConsultarP($_POST["envusr"]);
echo $_SESSION["IdPessoa"].", ".$cgrupo.", ".$_POST["envusr"].", ".$_POST["mensagem"];
?>
    <?php
        include 'footer.php'; 
    ?> 
</body>
</html>