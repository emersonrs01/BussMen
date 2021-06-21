<?php
require_once("../model/FabricaConexao.php");
require_once("../model/User.php");
require_once("../model/Mensagem.php");
require_once("../model/UserDAO.php");


class UserController {

  public function controlaConsulta() {
    if (!empty($_POST['user']) && !empty($_POST['pwd'])) {
      $user = new User();
      $user->nome = $_POST['user'];
      $user->senha = md5($_POST['pwd']);
      $DAO = new UserDAO();
      $result = $DAO->Consultar($user);
  
      if($result) { /* Testa se a consulta retornou algum registro */
        if($result == -2) {
          echo "<p>USUÁRIO NÃO ENCONTRADO!</p>";
          echo "<a href=\"../index.php\"><button>Voltar</button></a>";  
        }
        else if($result == -1) {
          echo "<p>SENHA INVÁLIDA!</p>";
          echo "<a href=\"../index.php\"><button>Voltar</button></a>";  
        }
        else {  /* Tudo certo - registrando as variáveis de sessão */
          header("location: ../view/home.php");  /* Direciona para a página inicial */
        }
      }
    }
  }

  public function controlaInsercao() {
    if(isset($_POST["username"]) && isset($_POST["password"]) && isset($_POST["data_nasc"])&& isset($_POST["envgrp"])) {
      $erros = array();
      $user = new User();
      $user->nome = $_POST['username'];
      $user->data_nasc = $_POST["data_nasc"];
      $user->senha = md5($_POST['password']);
  
      $DAO = new UserDAO();
      $DAO2 = new UserDAO();
      $resultGrupo = $DAO2->ConsultarG($_POST["envgrp"]);
      $user->IdGrupo = $resultGrupo;
      $result = $DAO->Inserir($user);
      if($result == 1) {
        $res = "USUÁRIO CADASTRADO COM SUCESSO!";
        header("Location: ../view/home.php?result=$res");
      }
      else if($result == -1) {
        $erros[] = "USUÁRIO JÁ EXISTENTE! TENTE NOVAMENTE!";
        $err = serialize($erros);
        header("Location: ../view/usuarios.php?error=$err");
      }	  
      else {
        $erros[] = "ERRO NO BANCO DE DADOS: $DAO->erro";
        $err = serialize($erros);
        header("Location: ../view/usuarios.php?error=$err");
      }
      
      unset($user);
    }
  }
  public function renomeiaGrupo() {
    if(isset($_POST["renomgrp"])) {
      $msg = isset($_POST["renomgrp"]);
      if (strpos($msg, "Selecione") !== false){

      }else{
      $erros = array();
      $grupo = new User();
      
      $DAO = new UserDAO();
      $DAO2 = new UserDAO();

      $resultGrupo = $DAO->ConsultarG($_POST["renomgrp"]);
      $grupo->nome = $_POST['groupnvnm'];
      $grupo->IdGrupo = $resultGrupo;
      $result = $DAO2->renGrupo($grupo);
      if($result == 1) {
        $res = "GRUPO ALTERADO COM SUCESSO!";
        header("Location: ../view/home.php?result=$res");
      }else{
        $erros[] = "ERRO NO BANCO DE DADOS: $DAO->erro";
        $err = serialize($erros);
        header("Location: ../view/grupos.php?error=$err");
      }
      
      unset($user);
      }
    }
  }
  public function buscaCadastro($op) {
      $DAO = new UserDAO();
      if($op==1){
        $grupo = $DAO->Listar("grupo");
        if(count($grupo) > 0) {
          echo "<option>Selecione...</option>";
          for($i = 0; $i < count($grupo); $i++) {
            $nome   = $grupo[$i]->nome;  
            echo "<option>$nome</option>";
          }
        }
      }else{
      echo"<br>";
      $usuario = $DAO->Listar("usuario");
      if(count($usuario) > 0) {
        echo "<option>Selecione...</option>";
        for($i = 0; $i < count($usuario); $i++) {
          $nome   = $usuario[$i]->nome;     
          echo "<option>$nome</option>"; 
        }
      }
    }

  }
  public function buscaMensagemG($op) {
    $DAO = new UserDAO();
    $DAO2 = new UserDAO();
    $divName = "msg";
    $divName2 = "nom";
    $divName3 = "men";
    $divName4 = "dat";
    $usuario = $DAO->ConsultarM($_SESSION["IdPessoa"]);
    $usuario1 = $DAO2->ConsultarMG($_SESSION["IdGrupo"]);
    if($op==1){
      if(count($usuario) > 0) {
        for($i = 0; $i < count($usuario); $i++) {
          $remetente   = $usuario[$i]->Pessoaenviada;
          $mensagem   = $usuario[$i]->mensagem;
          $Hora   = $usuario[$i]->Hora;  
          echo '<div id="'.$divName.'">';
            echo "<table> <tr>";
              echo '<div id="'.$divName2.'">'.$remetente."</div>";
              echo '<div id="'.$divName3.'">'.$mensagem."</div>";
              echo '<div id="'.$divName4.'">'.$Hora."</div>";
            echo"</tr></table>";
          echo "</div>";
        }
      }
    }else{
      if(count($usuario1) > 0) {
        for($i = 0; $i < count($usuario1); $i++) {
          $remetente   = $usuario1[$i]->Pessoaenviada;
          $mensagem   = $usuario1[$i]->mensagem;
          $Hora   = $usuario1[$i]->Hora;  
          echo '<div id="'.$divName.'">';
            echo "<table> <tr>";
              echo '<div id="'.$divName2.'">'.$remetente."</div>";
              echo '<div id="'.$divName3.'">'.$mensagem."</div>";
              echo '<div id="'.$divName4.'">'.$Hora."</div>";
            echo"</tr></table>";
          echo "</div>";
        }
      }

    }
}

  public function inserirGrupo() {
    if(isset($_POST["insgrp"])) {
      $msg = isset($_POST["insgrp"]);
      if (strpos($msg, "Selecione") !== false){

      }else{
        $erros = array();
        $DAO = new UserDAO();
        $grupo = new User();
        $grupo->nome=$_POST["insgrp"];
        $result = $DAO->insGrupo($grupo);
        if($result == 1) {
          $res = "GRUPO CADASTRADO COM SUCESSO!";
          header("Location: ../view/grupos.php?result=$res");
        }
        else if($result == -1) {
          $erros[] = "GRUPO JÁ EXISTENTE! TENTE NOVAMENTE!";
          $err = serialize($erros);
          header("Location: ../view/grupos.php?error=$err");
        }	  
        else {
          $erros[] = "ERRO NO BANCO DE DADOS: $DAO->erro";
          $err = serialize($erros);
          header("Location: ../view/grupos.php?error=$err");
        }
        unset($obj);
      }
    }
  }

  public function inserirMensagemG() {
    if(isset($_POST["envgrp"])) {
      $msg = $_POST["envgrp"];
      if (strpos($msg, "Selecione") !== false){

    }else{
        $erros = array();
        $DAO = new UserDAO();
        $DAO2 = new UserDAO();
        $cgrupo =  $DAO->ConsultarG($_POST["envgrp"]);

        $mensagem = new Mensagem();
        $mensagem->Pessoaenviada=$_SESSION["IdPessoa"];
        $mensagem->Grupo=$cgrupo;
        $mensagem->mensagem=$_POST["mensagem"];
        $result = $DAO2->insMeng($mensagem);
        if($result == 1) {
          $res = "MENSAGEM CADASTRADA COM SUCESSO!";
          header("Location: ../view/home.php?result=$res");
        }
        else if($result == -1) {
          $erros[] = "GRUPO JÁ EXISTENTE! TENTE NOVAMENTE!";
          $err = serialize($erros);
          header("Location: ../view/home.php?error=$err");
        }	  
        else {
          $erros[] = "ERRO NO BANCO DE DADOS: $DAO->erro";
          $err = serialize($erros);
          header("Location: ../view/home.php?error=$err");
        }
        unset($obj);
      }
     
    }
    if(isset($_POST["envusr"])) {
      $msg1 = $_POST["envusr"];
     if (strpos($msg1, "Selecione") !== false){
      
    }else{
        $erros = array();
        $DAO = new UserDAO();
        $DAO2 = new UserDAO();
        $cpessoa =  $DAO->ConsultarP($_POST["envusr"]);

        $mensagem = new Mensagem();
        $mensagem->Pessoarecebido=$cpessoa;
        $mensagem->Pessoaenviada=$_SESSION["IdPessoa"];
        $mensagem->mensagem=$_POST["mensagem"];
        $result = $DAO2->InsMenp($mensagem);
        if($result == 1) {
          $res = "MENSAGEM CADASTRADA COM SUCESSO!";
          header("Location: ../view/home.php?result=$res");
        }
        else if($result == -1) {
          $erros[] = "GRUPO JÁ EXISTENTE! TENTE NOVAMENTE!";
          $err = serialize($erros);
          header("Location: ../view/home.php?error=$err");
        }	  
        else {
          $erros[] = "ERRO NO BANCO DE DADOS: $DAO->erro";
          $err = serialize($erros);
          header("Location: ../view/home.php?error=$err");
        }
        unset($obj);
      }
     
    }
  }
  public function alteraGrupo() {
    if(isset($_POST["altusrgrp"])) {
      $msg = $_POST["altusrgrp"];
      $msg1 = $_POST["altusrgrp"];
      if (strpos($msg, "Selecione") !== false){
      }else{
        if (strpos($msg1, "Selecione") !== false){
        }else{
          $erros = array();
          $grupo = new User();
          
          $DAO = new UserDAO();
          $DAO2 = new UserDAO();
    
          $resultGrupo = $DAO->ConsultarG($_POST["altusrgrp"]);
          $grupo->nome = $_POST['altgrpusr'];
          $grupo->IdGrupo = $resultGrupo;
          $result = $DAO2->altGrupo($grupo);
          if($result == 1) {
            $res = "GRUPO ALTERADO COM SUCESSO!";
            header("Location: ../view/home.php?result=$res");
          }else{
            $erros[] = "ERRO NO BANCO DE DADOS: $DAO->erro";
            $err = serialize($erros);
            header("Location: ../view/grupos.php?error=$err");
          }
          
          unset($user);
        }
      }
    }
  }
}

?>
