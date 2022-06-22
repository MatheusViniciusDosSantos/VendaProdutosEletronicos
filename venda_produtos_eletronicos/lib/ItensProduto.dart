import 'Produto.dart';

class ItensProduto {
  late Produto _produto;
  late int _quantidadeProdutos;
  late double _valorProdutos;
  late double _descontoPorProduto;

  Produto get produto => _produto;

  set produto(Produto produto) => _produto = produto;

  int get quantidadeProdutos => _quantidadeProdutos;

  set quantidadeProdutos(int quantidadeProdutos) => _quantidadeProdutos = quantidadeProdutos;

  double get valorProdutos => _valorProdutos;

  set valorProdutos(double valorProdutos) => _valorProdutos = valorProdutos;

  double get descontoPorProduto => _descontoPorProduto;

  set descontoPorProduto(double descontoPorProduto)=> _descontoPorProduto = descontoPorProduto;
}
