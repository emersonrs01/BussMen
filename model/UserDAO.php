<?php
class UserDAO {
  // Recebe a conexão
  public $p = null;
  public $erro = null;
  
  // construtor
  public function __construct() {
    $this->p = new FabricaConexao();
    $this->p->exec("set names utf8");  /* Define todas as transações com charset UTF-8 */
  }
  
  // inserção
  public function Inserir($obj) {
    try {
	    /* Primeiro, testa se o usuário informado já existe no BD.
	     Se sim, retorna para tratamento no UserController */
      $stmt = $this->p->query("SELECT * FROM usuario WHERE nome = '$obj->nome'");
      if($stmt->fetch(PDO::FETCH_ASSOC, PDO::FETCH_ORI_NEXT))
	    return -1;
	
	    /* A partir daqui, o usuário é novo e será salvo no BD */
      $stmt = $this->p->prepare("INSERT INTO `usuario` (`nome`, `data_nasc`, `senha`, `IdGrupo`) VALUES (?,?,?,?)");

      // Inicia a transação
      $this->p->beginTransaction();
      $stmt->bindValue(1, $obj->nome);
      $stmt->bindValue(2, $obj->data_nasc);
      $stmt->bindValue(3, $obj->senha);
      $stmt->bindValue(4, $obj->IdGrupo);
    
      // Executa a query
      $stmt->execute();

      // Grava a transação
      $this->p->commit();      
      
      // Fecha a conexão
      unset($this->p);
      
      return 1;
    }
    // Em caso de erro, retorna a mensagem:
    catch(PDOException $e) {
      $this->erro = "Erro: " . $e->getMessage();
      return 0;
    }
  }
  
  public function InsGrupo($obj) {
    try {
	    /* Primeiro, testa se o grupo informado já existe no BD.
	     Se sim, retorna para tratamento no UserController */
      $stmt = $this->p->query("SELECT * FROM grupo WHERE nome = '$obj->nome'");
      if($stmt->fetch(PDO::FETCH_ASSOC, PDO::FETCH_ORI_NEXT))
	    return -1;
	    /* A partir daqui, o grupo é novo e será salvo no BD */
      $stmt = $this->p->prepare("INSERT INTO `grupo` (`IdGrupo`, `nome`) VALUES (?, ?)");
      // Inicia a transação
      $this->p->beginTransaction();
      $stmt->bindValue(1, NULL);
      $stmt->bindValue(2, $obj->nome);
      // Executa a query
      $stmt->execute();
      // Grava a transação
      $this->p->commit();      
      // Fecha a conexão
      unset($this->p);
      return 1;
    }
    // Em caso de erro, retorna a mensagem:
    catch(PDOException $e) {
      $this->erro = "Erro: " . $e->getMessage();
      return 0;
    }
  }

  public function renGrupo($obj) {
    try {
      $sql = "UPDATE `grupo` SET `nome` =? WHERE `IdGrupo` = ?";
	    $stmt = $this->p->prepare($sql);
      // Inicia a transação
      $this->p->beginTransaction();
      //$stmt->bindValue(1, $obj->nome);
      //$stmt->bindValue(2, $obj->IdGrupo);
      // Executa a query
      $stmt->execute([$obj->nome, $obj->IdGrupo]);
      // Grava a transação
      $this->p->commit();      
      // Fecha a conexão
      unset($this->p);
      return 1;
    }
    // Em caso de erro, retorna a mensagem:
    catch(PDOException $e) {
      $this->erro = "Erro: " . $e->getMessage();
      return 0;
    }
  }
  public function altGrupo($obj) {
    try {
	    $stmt = $this->p->prepare("UPDATE `usuario` SET `IdGrupo` = '$obj->IdGrupo' WHERE `nome` = '$obj->nome'");
      // Inicia a transação
      $this->p->beginTransaction();
      //$stmt->bindValue(1, $obj->nome);
      //$stmt->bindValue(2, $obj->idGrupo);
      // Executa a query
      $stmt->execute();
      // Grava a transação
      $this->p->commit();      
      // Fecha a conexão
      unset($this->p);
      return 1;
    }
    // Em caso de erro, retorna a mensagem:
    catch(PDOException $e) {
      $this->erro = "Erro: " . $e->getMessage();
      return 0;
    }
  }
  public function altSenha($obj) {
    try {
	    $stmt = $this->p->prepare("UPDATE `usuario` SET `senha` = '$obj->senha' WHERE `nome` = '$obj->nome'");
      // Inicia a transação
      $this->p->beginTransaction();
      //$stmt->bindValue(1, $obj->nome);
      //$stmt->bindValue(2, $obj->idGrupo);
      // Executa a query
      $stmt->execute();
      // Grava a transação
      $this->p->commit();      
      // Fecha a conexão
      unset($this->p);
      return 1;
    }
    // Em caso de erro, retorna a mensagem:
    catch(PDOException $e) {
      $this->erro = "Erro: " . $e->getMessage();
      return 0;
    }
  }

  // consulta
  public function Consultar($obj) {
    try {
      /* Busca pelo registro... se existir, deve trazer só uma linha,
      pois a coluna apelido é chave primária */
      $stmt = $this->p->query("SELECT * FROM usuario WHERE nome = '$obj->nome'");
      $registro = $stmt->fetch(PDO::FETCH_ASSOC, PDO::FETCH_ORI_NEXT);
      // Fecha a conexão
      unset($this->p);
      if(!$registro) {
        // Não encontrou o usuário
        return -2;
      }
      else {
        if (strcmp($registro["senha"], $obj->senha) !== 0) {
          // Senha não confere
          return -1;
        }
        else {
          if(!isset($_SESSION)) 
            { 
              session_start();
              $_SESSION["nome_usuario"] = $registro["nome"];
              $_SESSION["senha_usuario"] = $registro["senha"];
              $_SESSION["IdPessoa"] = $registro["IdPessoa"];
              $_SESSION["IdGrupo"] = $registro["IdGrupo"];
              return 1;
             }else{
               return 1;
             }

        }
      }
    }
    // Em caso de erro, retorna a mensagem:
    catch(PDOException $e) {
      echo "Erro: ". $e->getMessage();
      return 0;
    }
  }

  public function ConsultarG($nome) {
    try {
      /* Busca pelo registro... se existir, deve trazer só uma linha,
      pois a coluna apelido é chave primária */
      $stmt = $this->p->query("SELECT IdGrupo FROM grupo WHERE nome = '$nome'");
      $registro = $stmt->fetch(PDO::FETCH_ASSOC, PDO::FETCH_ORI_NEXT);
      // Fecha a conexão
      unset($this->p);
      if(!$registro) {
        // Não encontrou o usuário
        return -2;
      }
      else {
        return $registro["IdGrupo"];
      }
    }
    // Em caso de erro, retorna a mensagem:
    catch(PDOException $e) {
      echo "Erro: ". $e->getMessage();
      return 0;
    }
  }

  public function ConsultarM($pessoa) {
    $registro = array();
    $items = array();
    try {
      /* Busca pelo registro... se existir, deve trazer só uma linha,
      pois a coluna apelido é chave primária */
      $stmt = $this->p->query("SELECT m.mensagem as 'Mensagem',DATE_FORMAT(m.DataRecebida, '%d/%m/%Y %H:%i') as 'horarecebida',u.nome as 'remetente' from mensagem m join usuario u on m.Pessoaenviada = u.IdPessoa where m.Pessoarecebido = $pessoa ORDER by m.DataRecebida desc LIMIT 11");
      while($registro = $stmt->fetch(PDO::FETCH_ASSOC, PDO::FETCH_ORI_NEXT))
      {
        $p = new Mensagem();
      if(isset($registro["Mensagem"]))
        $p->Pessoaenviada = $registro["remetente"];
        $p->mensagem = $registro["Mensagem"];
        $p->Hora = $registro["horarecebida"];
        $items[] = $p;
      }
      return $items;      
      unset($this->p);
    }
    // Em caso de erro, retorna a mensagem:
    catch(PDOException $e) {
      echo "Erro: ". $e->getMessage();
      return 0;
    }
  }
  public function ConsultarMG($grupo) {
    $registro = array();
    $items = array();
    try {
      /* Busca pelo registro... se existir, deve trazer só uma linha,
      pois a coluna apelido é chave primária */
      $stmt = $this->p->query("SELECT m.mensagem as 'Mensagem',DATE_FORMAT(m.DataRecebida, '%d/%m/%Y %H:%i') as 'horarecebida',g.nome as 'remetente' from mensagemgrupo m join Grupo g on m.Grupo = g.IdGrupo where m.Grupo = $grupo ORDER by m.DataRecebida desc LIMIT 11");
      while($registro = $stmt->fetch(PDO::FETCH_ASSOC, PDO::FETCH_ORI_NEXT))
      {
        $p = new Mensagem();
      if(isset($registro["Mensagem"]))
        $p->Pessoaenviada = $registro["remetente"];
        $p->mensagem = $registro["Mensagem"];
        $p->Hora = $registro["horarecebida"];
        $items[] = $p;
      }
      return $items;      
      unset($this->p);
    }
    // Em caso de erro, retorna a mensagem:
    catch(PDOException $e) {
      echo "Erro: ". $e->getMessage();
      return 0;
    }
  }
  public function ConsultarP($nome) {
    try {
      /* Busca pelo registro... se existir, deve trazer só uma linha,
      pois a coluna apelido é chave primária */
      $stmt = $this->p->query("SELECT IdPessoa FROM usuario WHERE nome = '$nome'");
      $registro = $stmt->fetch(PDO::FETCH_ASSOC, PDO::FETCH_ORI_NEXT);
      // Fecha a conexão
      unset($this->p);
      if(!$registro) {
        // Não encontrou o usuário
        return -2;
      }
      else {
        return $registro["IdPessoa"];
      }
    }
    // Em caso de erro, retorna a mensagem:
    catch(PDOException $e) {
      echo "Erro: ". $e->getMessage();
      return 0;
    }
  }
  
  public function Listar($pesq) {
    $registro = array();
    $items = array();
    try {
      $stmt = $this->p->query("SELECT * FROM $pesq");
      while($registro = $stmt->fetch(PDO::FETCH_ASSOC, PDO::FETCH_ORI_NEXT))
      {
        $p = new User();
      if(isset($registro["nome"]))
        $p->nome = $registro["nome"];
        $items[] = $p;
      }
      return $items;      
      unset($this->p);
      }
    catch(PDOException $e) {
      echo "Erro: ". $e->getMessage();
      return 0;
    }
  }

  public function InsMeng($obj) {
    try {
	    /* A partir daqui, o grupo é novo e será salvo no BD */
      $stmt = $this->p->prepare("INSERT INTO `mensagemgrupo` (`Pessoaenviada`, `Grupo`, `mensagem`) VALUES (?,?,?)");
      // Inicia a transação
      $this->p->beginTransaction();
      $stmt->bindValue(1, $obj->Pessoaenviada);
      $stmt->bindValue(2, $obj->Grupo);
      $stmt->bindValue(3, $obj->mensagem);
      // Executa a query
      $stmt->execute();
      // Grava a transação
      $this->p->commit();      
      // Fecha a conexão
      unset($this->p);
      return 1;
    }
    // Em caso de erro, retorna a mensagem:
    catch(PDOException $e) {
      $this->erro = "Erro: " . $e->getMessage();
      return 0;
    }
  }
  public function InsMenp($obj) {
    try {
	    /* A partir daqui, o grupo é novo e será salvo no BD */
      $stmt = $this->p->prepare("INSERT INTO `mensagem` (`Pessoarecebido`, `Pessoaenviada`, `mensagem`) VALUES (?,?,?)");
      // Inicia a transação
      $this->p->beginTransaction();
      $stmt->bindValue(1, $obj->Pessoarecebido);
      $stmt->bindValue(2, $obj->Pessoaenviada);
      $stmt->bindValue(3, $obj->mensagem);
      // Executa a query
      $stmt->execute();
      // Grava a transação
      $this->p->commit();      
      // Fecha a conexão
      unset($this->p);
      return 1;
    }
    // Em caso de erro, retorna a mensagem:
    catch(PDOException $e) {
      $this->erro = "Erro: " . $e->getMessage();
      return 0;
    }
  }
}
?>