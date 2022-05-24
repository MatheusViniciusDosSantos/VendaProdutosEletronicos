import 'dart:developer';

import 'Produto.dart';

final double valorLimiteVenda = 100000.00;

double calcularValorVenda(
    {required List<Produto> produtos, double desconto = 0.0}) {
  double valorTotal = calcularValorProdutos(produtos);

  verificarFuncoes((double valorProdutos, double desconto) {
    double porcentagem = valorProdutos * 0.9;
    if (desconto > porcentagem) {
      throw Exception("Desconto acima de 90%, mudar valor do desconto!");
    }
  }, valorTotal, desconto);
  verificarFuncoes((double valorProdutos, double valorLimite) {
    if (valorProdutos >= valorLimite) {
      throw Exception(
          "Valor da venda acima do limite aceito. O limite é: $valorLimite");
    }
  }, valorTotal - desconto, valorLimiteVenda);

  return valorTotal - desconto;
}

double calcularValorProdutos(List<Produto> produtos) {
  double valorTotal = 0.0;
  for (var produto in produtos) {
    if (produto.valor > 0) {
      valorTotal = valorTotal +
          (produto.getQuantidadeProdutos() > 0
              ? produto.valor * produto.quantidadeProdutos
              : produto.valor);
    }
  }
  return valorTotal;
}

void verificarFuncoes(Function funcao, double valor1, double valor2) {
  funcao(valor1, valor2);
}

void definirLimiteComissaoProduto(Produto produto) {
  if (produto.getValor() != null) {
    double comissao = retornaValorComissaoPorQuantidadeProdutos(
        produto.getQuantidadeProdutos());
    comissao = retornaValorMaximoComissaoProduto(comissao);
    produto.setValorComissao(comissao);
  }
}

double retornaValorComissaoPorQuantidadeProdutos(int quantidadeProdutos) {
  double comissao = 0.0;
  if (quantidadeProdutos >= 5) {
    comissao = 0.08;
  } else if (quantidadeProdutos >= 10) {
    comissao = 0.16;
  } else if (quantidadeProdutos >= 15) {
    comissao = 0.32;
  } else {
    comissao = 0.04;
  }
  return comissao;
}

double retornaValorMaximoComissaoProduto(double valorComissao) {
  double comissao = valorComissao;
  if (valorComissao > 1500.00) {
    comissao = 1500.00;
  }
  return comissao;
}

double retornarDescontoSextaFeira(Produto produto) {
  if (DateTime.now().weekday == DateTime.friday &&
      produto.getValor() > 5000.00) {
    return produto.getValor() * 0.1;
  } else {
    return 0.0;
  }
}

void verificaProdutoAtivo(Produto produto) {
  if (produto.getStatus() == 'A') {
    log("Produto ${produto.getNome()} está ativo");
  } else {
    log("Produto ${produto.getNome()} está inativo");
    throw Exception("Produto inativo, ative o produto.");
  }
}





  //calculo comissão do funcionário valor venda... percentual comissão... limite em reais da comissão... vendeu x ... 
  // Desconto maximo/minimo, comissão da venda, promoção dia da semana se valor for maior que x, estorno,

//   void verificarValorTotalProdutos(double valorProdutos, double valorLimite) {
//   if (valorProdutos >= valorLimite) {
//     throw Exception(
//         "Valor da venda acima do limite aceito. O limite é: $valorLimite");
//   }
// }

// void verificarLimiteDesconto(double valorProdutos, double desconto) {
//   double porcentagem = valorProdutos * 0.9;
//   if (desconto > porcentagem) {
//     throw Exception("Desconto acima de 90%, mudar valor do desconto!");
//   }
// }