<?php

class User {
  private $IdPessoa;
  private $nome;
  private $data_nasc;
  private $CargoPessoa;

  public function __construct() {}

  public function __set($propriedade, $valor) {
    $this->$propriedade = $valor;
  }

  public function __get($propriedade) {
    return $this->$propriedade;
  }
}

?>


