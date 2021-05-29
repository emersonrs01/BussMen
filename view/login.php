<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>Bussmen</title>
<style>  
* {
  text-align: center;
}
p {
  font-weight: bold;
  color: red;
}
</style>
</head>
<body>
  <?php
    include_once("../controller/UserController.php");
    $obj = new UserController();
    $obj->controlaConsulta();
  ?>
</body>
</html>