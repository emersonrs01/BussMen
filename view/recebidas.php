<!DOCTYPE html>
<?php
        include("../include/SessaoValidate.php");  
    ?> 
<html>
<head>
<title>Mensagens Recebidas - BussMen</title>
<link rel="stylesheet" href="../resources/estilosmr.css">
</head>
<body>
    <div id="container">
        <h2>Mensagens Recebidas</h2>
        <div id="geral">
            <div id="mrp">
                <h4 id="mp">Mensagem Pessoa</h4>
                    <div id="bmp">
                    </div>
            </div>
            <div id="mrg">
                <h4 id="mg">Mensagem Grupo</h4>
                    <div id="bmg">
                    </div>
            </div>
        </div>
    </div>
    <?php
        include 'footer.php'; 
    ?> 
</body>
</html>