<!DOCTYPE html>
<html>
<head>
<title>Mensagens Recebidas - BussMen</title>
<link rel="stylesheet" href="../resources/estilosmr.css">
</head>
<body>
<?php
echo $_POST["idLogin"].", ".$_POST["envgrp"].", ".$_POST["envusr"].", ".$_POST["mensagem"];
?>
    <?php
        include 'footer.php'; 
    ?> 
</body>
</html>