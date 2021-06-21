<!DOCTYPE html>
<html>
<head>
<title>Página Inicial - BussMen</title>
</head>
<body>
    <?php
        include("../include/SessaoValidate.php"); 
    ?> 
	<br><br><br>
	Bem Vindo ao Sistema Bussmen<br><br><br>
    Acesse as ferramentas no menu acima.<br><br><br>
    <?php
    date_default_timezone_set("America/Sao_Paulo");
    $ndia = date("w");$nmes = date("n");$ano = date("Y");
    $dsemana = array(0 => 'Domingo','Segunda-Feira','Terça-Feira','Quarta-Feira','Quinta-Feira','Sexta-Feira','Sábado');
    $mes = array(1 => 'Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho',
                        'Agosto','Setembro','Outubro','Novembro','Dezembro');
        $data = "Passo Fundo, ".date("H:i:s")." de ".$dsemana[(int)$ndia].", ".date("d")." de ".$mes[(int)$nmes].
        " de ".date("Y").".";
    echo $data;
    ?>
    <?php
        include 'footer.php'; 
         
    ?> 
</body>
</html>