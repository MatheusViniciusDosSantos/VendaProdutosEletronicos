import 'Produto.dart';

double calcularValorVenda(
    {required List<Produto> produtos, double desconto = 0.0}) {
  double valorTotal = calcularValorProdutos(produtos);
  
  return valorTotal - desconto;
}

double calcularValorProdutos(List<Produto> produtos) {
  double valorTotal = 0.0;
  for (var produto in produtos) {
    if (produto.valor > 0) {
      valorTotal = valorTotal + produto.valor;
    }
  }
  return valorTotal;
}




  //calculo comissão do funcionário valor venda... percentual comissão... limite em reais da comissão... vendeu x ... 
  // Desconto maximo/minimo, comissão da venda