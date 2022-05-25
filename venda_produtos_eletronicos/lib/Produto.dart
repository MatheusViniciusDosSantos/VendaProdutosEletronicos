class Produto {
  late int id;
  late String nome;
  late double valor;
  late double valorComissao;
  late double valorCusto;
  late double descontoMaxProduto;

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

  double getValor() {
    return valor;
  }

  void setValor(double valor) {
    this.valor = valor;
  }

  double getValorComissao() {
    return valorComissao;
  }

  void setValorComissao(double valorComissao) {
    this.valorComissao = valorComissao;
  }

  double getValorCusto() {
    return valorCusto;
  }

  void setValorCusto(double valorCusto) {
    this.valorCusto = valorCusto;
  }

  double getDescontoMaxProduto() {
    return descontoMaxProduto;
  }

  void setDescontoMaxProduto(double descontoMaxProduto) {
    this.descontoMaxProduto = descontoMaxProduto;
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

  @override
  String toString() {
    return "O produto $nome custa $valor reais.";
  }
}
