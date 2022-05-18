class Produto {
  late String nome;
  late double valor;

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

  @override
  String toString() {
    return "O produto $nome custa $valor reais.";
  }
}
