class Cliente {
  late int id;
  late String nome;
  late String cpf;

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
