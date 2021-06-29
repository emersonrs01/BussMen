<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css">
	<script src="../resources/jquery/jquery-3.6.0.min.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
	<link href="../resources/smartmenus/css/sm-core-css.css" rel="stylesheet" type="text/css"/>
	<link href="../resources/smartmenus/css/sm-mint/sm-mint.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="../resources/fontawesome/css/all.css">
	<link rel="stylesheet" href="../resources/estilos.css">
</head>
<body>
	<h2><b>Sistema BussMen</b></h2>
    <h6><b>Mensagens Corporativas</b></h6>
		<nav class="main-nav" role="navigation">
	  <ul id="main-menu" class="sm sm-mint">
			<li><a href="home.php">Inicio</a></li>
	  	<li><a href="enviar.php">Enviar</a></li>
    	<li><a href="recebidas.php">Recebidas</a></li>
    	<li><a href="logout.php">Sair</a></li></ul>
	</nav>
		<script type="text/javascript">
		$(function() {
		$('#main-menu').smartmenus({
		subMenusSubOffsetX: 1,
		subMenusSubOffsetY: -8
				});
			});
		</script>
</body>
</html>