<?php
    include("../include/SessaoValidate.php");  
    include_once("../controller/UserController.php");
    include_once("../model/User.php");
    require_once("../model/Mensagem.php");
    include_once("../model/UserDAO.php");
    $pesq = new UserController();
    $obj = new UserController();
    $obj->inserirMensagemG();
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
    include 'footer.php'; 
    ?> 
<!DOCTYPE html>
<html>
<head>
<title>Mensagens Recebidas - BussMen</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../resources/estilosmr.css">
</head>
<body>
    <div id="container">
        <h2>Mensagens Recebidas</h2>
        <div id="geral">
            <div id="mrp">
                <h5 id="mp">Mensagens Particulares</h5>
                    <div id="bmp">
                    <?php $pesq->buscaMensagemG(1);?>
                    </div>
            </div>
            <div id="mrg">
                <h5 id="mg">Mensagem para Seu Grupo</h5>
                    <div id="bmg">
                    <?php $pesq->buscaMensagemG(2);?>
                    </div>
            </div>
        </div>
    </div>
</body>
</html>