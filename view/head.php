<!DOCTYPE html>
<html>
<head>
<title>Cabeçalho APP Aulas</title>
	<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css">
	<script src="../resources/jquery/jquery-3.6.0.min.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
	<link href="../resources/smartmenus/css/sm-core-css.css" rel="stylesheet" type="text/css"/>
	<link href="../resources/smartmenus/css/sm-mint/sm-mint.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="../resources/fontawesome/css/all.css">
	<link rel="stylesheet" href="../resources/estilos.css">
</head>
<body>
	<h2>Sistema BussMen</h2>
    <h6>Mensagens Corporativas</h6>
		<nav class="main-nav" role="navigation">
	  <ul id="main-menu" class="sm sm-mint">
			<li><a href="home.php">Inicio</a></li>
	  	<li><a href="mensagens/enviar.php">Enviar</a></li>
	  	<li><a href="mensagens/enviadas.php">Enviadas</a></li>
    	<li><a href="mensagens/recebidas.php">Recebidas</a></li>
    	<li><a href="gestao/grupos.php">Grupos</a></li>
	  	<li><a href="gestao/usuarios.php">Usuários</a></li>
    	<li><a href="sair.php">Sair</a></li></ul>
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