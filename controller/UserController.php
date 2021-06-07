<?php
require_once("../model/FabricaConexao.php");
require_once("../model/User.php");
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
    if(isset($_POST["user"]) && isset($_POST["pwd"]) && isset($_POST["email"])) {
      $erros = array();
      $user = new User();
      $user->apelido = $_POST['user'];
      $user->senha = md5($_POST['pwd']);
      $user->email = $_POST["email"];
  
      $DAO = new UserDAO();
      $result = $DAO->Inserir($user);
      if($result == 1) {
        $res = "USUÁRIO CADASTRADO COM SUCESSO!";
        header("Location: ../view/cadastro.php?result=$res");
      }
      else if($result == -1) {
        $erros[] = "USUÁRIO JÁ EXISTENTE! TENTE NOVAMENTE!";
        $err = serialize($erros);
        header("Location: ../view/cadastro.php?error=$err");
      }	  
      else {
        $erros[] = "ERRO NO BANCO DE DADOS: $DAO->erro";
        $err = serialize($erros);
        header("Location: ../view/cadastro.php?error=$err");
      }
      
      unset($user);
    }
  }
  public function buscaCadastro() {
      $DAO = new UserDAO();
      $grupo = $DAO->Listar("grupo");
      $usuario = $DAO->Listar("usuario");
      if(count($grupo) > 0) {
        for($i = 0; $i < count($grupo); $i++) {
          $nome   = $grupo[$i]->nome;  
            
          if($nome)
            echo "<td style=\"text-align: left;\">$nome</td>";
          
          echo "<br>";
        }
      }

     echo"<br>";
    if(count($usuario) > 0) {
      for($i = 0; $i < count($usuario); $i++) {
        $nome   = $usuario[$i]->nome;  
          
        if($nome)
          echo "<td style=\"text-align: left;\">$nome</td>";
        
        echo "<br>";
      }
    }

  }
}

?>
