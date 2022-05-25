import 'Produto.dart';

class ItensProduto {
  late Produto produto;
  late int quantidadeProdutos;
  late double valorProdutos;
  late double descontoPorProduto;

  Produto getProduto() {
    return produto;
  }

  void setProduto(Produto produto) {
    this.produto = produto;
  }

  int getQuantidadeProdutos() {
    return quantidadeProdutos;
  }

  void setQuantidadeProdutos(int quantidadeProdutos) {
    this.quantidadeProdutos = quantidadeProdutos;
  }

  double getValorProdutos() {
    return valorProdutos;
  }

  void setValorProdutos(double valorProdutos) {
    this.valorProdutos = valorProdutos;
  }

  double getDescontoPorProduto() {
    return descontoPorProduto;
  }

  void setDescontoPorProduto(double descontoPorProduto) {
    this.descontoPorProduto = descontoPorProduto;
  }

}
