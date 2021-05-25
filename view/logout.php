<?php
  /* Restaura o ambiente da sessao atual */
  session_start();
 
  /* Atribui um array vazio a sessão atual, eliminando todas as variáveis */
  $_SESSION = array();
 
  /* Elimina e encerra a sessão atual */
  session_destroy();
 
  /* Redirecionando para a página de login */
  header("Location: ../index.php");
?>