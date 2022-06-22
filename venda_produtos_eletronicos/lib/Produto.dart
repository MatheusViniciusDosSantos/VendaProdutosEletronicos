class Produto {
  late int _id;
  late String _nome;
  late double _valor;
  late double _valorComissao;
  late double _valorCusto;
  late double _descontoMaxProduto;
  late double _descontoProdutoMax;

  // 'A' para ativo, 'I' para inativo
  late String _status;
  late DateTime _dataCadastro;

  Produto(this._nome) {
    _dataCadastro = DateTime.now();
  }

  int get id => _id;

  set id(int id) {
    _id = id;
  }

  String get nome => _nome;

  set nome(String nome) {
    _nome = nome;
  }

  double get valor => valor;

  set valor(double valor) => _valor = valor;

  double get valorComissao => _valorComissao;

  set valorComissao(double valorComissao) => _valorComissao = valorComissao;

  double get valorCusto => _valorCusto;

  set valorCusto(double valorCusto) => _valorCusto = valorCusto;
  
  double get descontoMaxProduto => _descontoMaxProduto;

  void set descontoMaxProduto(double descontoMaxProduto) => _descontoMaxProduto = descontoMaxProduto;

  String get status => _status;

  void set status(String status) => _status = status;

  DateTime get dataCadastro => _dataCadastro;

  @override
  String toString() {
    return "O produto $nome custa $valor reais.";
  }
}
