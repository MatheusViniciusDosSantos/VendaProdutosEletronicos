class Funcionario {
  late int id;
  late String nome;
  late String cpf;

  //Podemos ter como resposta:
  // "CONTRATADO";
  // "TEMPORARIO";
  // "ESTAGIARIO";
  // "TERCERIZADO";
  late String tipoContratacao;

  // 'A' para ativo, 'I' para inativo
  late String status;
  late DateTime dataCadastro;

  int getId() {
    return id;
  }

  void setId(int id) {
    this.id = id;
  }

  String getNome() {
    return nome;
  }

  void setNome(String nome) {
    this.nome = nome;
  }

  String getCpf() {
    return cpf;
  }

  void setCpf(String cpf) {
    this.cpf = cpf;
  }

  String getContratacao() {
    return tipoContratacao;
  }

  void setCotratacao(String tipoContratacao) {
    this.tipoContratacao = tipoContratacao;
  }

  String getStatus() {
    return status;
  }

  void setStatus(String status) {
    this.status = status;
  }

  DateTime getDataCadastro() {
    return dataCadastro;
  }

  void setDataCadastro(DateTime dataCadastro) {
    this.dataCadastro = dataCadastro;
  }
}
