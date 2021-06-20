<?php

class Mensagem {
  private $Pessoaenviada;
  private $Pessoarecebido;
  private $mensagem;
  private $Grupo;
  private $Hora;

  public function __construct() {}

  public function __set($propriedade, $valor) {
    $this->$propriedade = $valor;
  }

  public function __get($propriedade) {
    return $this->$propriedade;
  }
}

?>


