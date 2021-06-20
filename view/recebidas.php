<!DOCTYPE html>
<?php
        include("../include/SessaoValidate.php");  
    ?> 
<html>
<head>
<title>Mensagens Recebidas - BussMen</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../resources/estilosmr.css">
</head>
<body>
<?php
        include_once("../include/SessaoValidate.php");  
        include_once("../controller/UserController.php");
            $pesq = new UserController();
    ?> 
    <div id="container">
        <h2>Mensagens Recebidas</h2>
        <div id="geral">
            <div id="mrp">
                <h4 id="mp">Mensagem Pessoa</h4>
                    <div id="bmp">
                    <?php $pesq->buscaMensagemG(1);?>
                    </div>
            </div>
            <div id="mrg">
                <h4 id="mg">Mensagem Grupo</h4>
                    <div id="bmg">
                    <?php $pesq->buscaMensagemG(2);?>
                    </div>
            </div>
        </div>
    <?php
    include_once("../controller/UserController.php");
    include_once("../model/User.php");
    require_once("../model/Mensagem.php");
    include_once("../model/UserDAO.php");
    $obj = new UserController();
    $obj->inserirMensagemG();
    ?>
    <?php
        include 'footer.php'; 
    ?> 
    <?php
        include 'footer.php'; 
    ?> 
</body>
</html>