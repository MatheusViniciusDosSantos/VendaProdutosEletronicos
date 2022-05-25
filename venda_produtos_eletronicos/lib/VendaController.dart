import 'dart:developer';

import 'package:venda_produtos_eletronicos/Funcionario.dart';
import 'package:venda_produtos_eletronicos/ItensProduto.dart';

import 'Produto.dart';

//Função que vai chamar todas as outras
double calcularValorVenda(
    {required List<ItensProduto> itensProdutos, double descontoVenda = 0.0}) {
  double valorProdutos = calcularValorProdutos(itensProdutos);
  double valorTotalVenda =
      calcularValorVendaComDesconto(valorProdutos, descontoVenda);

  return valorTotalVenda;
}

//Função que vai calcular o valor da venda com o desconto geral da venda
double calcularValorVendaComDesconto(
    double valorProdutos, double descontoVenda) {
  verificarLimiteDesconto(valorProdutos, descontoVenda);
  double valorTotalVenda = valorProdutos - descontoVenda;
  return valorTotalVenda;
}

//Função que vai calcular o valor total dos produtos
double calcularValorProdutos(List<ItensProduto> itensProdutos) {
  double valorTotal = 0.0;
  for (var itemProduto in itensProdutos) {
    late double precoProdutos;

    itemProduto.getProduto().setValor(calcularDescontoProduto(itemProduto));
    if (itemProduto.getQuantidadeProdutos() > 1) {
      precoProdutos = itemProduto.getProduto().getValor() *
          itemProduto.getQuantidadeProdutos();
    } else {
      precoProdutos = itemProduto.getProduto().getValor();
    }
    itemProduto.setValorProdutos(precoProdutos);
    valorTotal = valorTotal + precoProdutos;
  }
  return valorTotal;
}

//Função que va calcular o valor do produto com o desconto por produto
double calcularDescontoProduto(ItensProduto itemProduto) {
  late double valorProdutoComDesconto;
  double descontoProduto = itemProduto.getDescontoPorProduto();
  double descontoMax = itemProduto.getProduto().getDescontoMaxProduto();
  double valorProduto = itemProduto.getProduto().getValor();
  if (descontoProduto <= descontoMax) {
    valorProdutoComDesconto = valorProduto - (descontoProduto * valorProduto);
  } else {
    valorProdutoComDesconto = valorProduto - (descontoMax * valorProduto);
  }
  return valorProdutoComDesconto;
}

//Função que vai validar o limite da comissão
ItensProduto validarLimiteComissaoProduto(
    ItensProduto itensProduto, Funcionario funcionario) {
  if (itensProduto.getProduto().getValor() != null) {
    late double comissao =
        calculaValorComissaoPorTipoFuncionario(funcionario, itensProduto);
    comissao = definirLimiteComissaoProduto(
        comissao, itensProduto.getProduto().getValorCusto());
    itensProduto.getProduto().setValorComissao(comissao);
    return itensProduto;
  }
  return itensProduto;
}

//Função que vai definir qual tipo de calculo será executado por tipo de funcionario
double calculaValorComissaoPorTipoFuncionario(
    Funcionario funcionario, ItensProduto itensProduto) {
  double comissao = 0.0;

  if (funcionario.getContratacao() == "CONTRATADO") {
    comissao = calculaValorComissao(
        calculaValorComissaoPorQuantidadeProdutosFuncionarioContratado,
        itensProduto,
        itensProduto.getQuantidadeProdutos());
  } else if (funcionario.getContratacao() == "TEMPORARIO") {
    comissao = calculaValorComissao(
        calculaValorComissaoPorQuantidadeProdutosFuncionarioTemporario,
        itensProduto,
        itensProduto.getQuantidadeProdutos());
  } else if (funcionario.getContratacao() == "ESTAGIARIO") {
    comissao = calculaValorComissao(
        //Função anônima que vai calcular o valor da comissão para um estagiário
        (ItensProduto itensProduto, int quantidadeProdutos) {
      double valorProduto = itensProduto.getProduto().getValor();
      if (quantidadeProdutos >= 10) {
        return valorProduto * 0.01;
      } else if (quantidadeProdutos >= 20) {
        return valorProduto * 0.02;
      } else {
        return valorProduto * 0.003;
      }
    }, itensProduto, itensProduto.getQuantidadeProdutos());
  } else if (funcionario.getContratacao() == "TERCERIZADO") {
    comissao = calculaValorComissao(
        //Arrow function que vai definir o valor da comissão para um
        // funcionário tercerizado
        (ItensProduto itensProduto, double quantidadeProdutos) =>
            (quantidadeProdutos > 40
                ? itensProduto.getProduto().getValor() * 0.005
                : 0.0),
        itensProduto,
        itensProduto.getQuantidadeProdutos());
  }
  return comissao;
}

//Função base que vai chamar as funções de calcular o valor da comissão
double calculaValorComissao(
    Function function, ItensProduto itensProduto, int quantidadeProdutos) {
  return function(itensProduto, quantidadeProdutos);
}

//Função que vai calcular o valor da comissão do funcionário por quantidade de
// produtos vendidos para funcionários contratados
double calculaValorComissaoPorQuantidadeProdutosFuncionarioContratado(
    ItensProduto itensProduto, int quantidadeProdutos) {
  double comissao = 0.0;
  double valorProduto = itensProduto.getProduto().getValor();
  if (quantidadeProdutos >= 5) {
    comissao = valorProduto * 0.01;
  } else if (quantidadeProdutos >= 10) {
    comissao = valorProduto * 0.02;
  } else if (quantidadeProdutos >= 15) {
    comissao = valorProduto * 0.04;
  } else {
    comissao = valorProduto * 0.005;
  }
  return comissao;
}

//Função que vai calcular o valor da comissão quando for um funcionário temporário
double calculaValorComissaoPorQuantidadeProdutosFuncionarioTemporario(
    ItensProduto itensProduto, int quantidadeProdutos) {
  double comissao = 0.0;
  double valorProduto = itensProduto.getProduto().getValor();
  if (quantidadeProdutos >= 5) {
    comissao = valorProduto * 0.005;
  } else if (quantidadeProdutos >= 10) {
    comissao = valorProduto * 0.01;
  } else if (quantidadeProdutos >= 15) {
    comissao = valorProduto * 0.02;
  } else {
    comissao = valorProduto * 0.002;
  }
  return comissao;
}

//Define o limite do valor da comissão do funcionário caso for maior ou igual
// ao valor de custo do produto o valor da comissão será 90% do valor da comissao
double definirLimiteComissaoProduto(
    double valorComissao, double valorCustoProduto) {
  double comissao = valorComissao;
  if (valorComissao >= valorCustoProduto) {
    comissao = valorCustoProduto * 0.9;
  }
  return comissao;
}

//No dia de reabastecimento do estoque que o usuário informar vai ser oferecido
// um desconto definido pelo usuário, ou 10%, para os produtos em estoque com preço
// acima de determinado valor.
double retornarDescontoDoDiaComOferta(
    {required Produto produto,
    required double valorMinimoParaDesconto,
    double porcentagemDeDesconto = 0.01,
    required DateTime dataComOferta}) {
  if (DateTime.now().weekday == dataComOferta.weekday &&
      produto.getValor() > valorMinimoParaDesconto) {
    return produto.getValor() * porcentagemDeDesconto;
  } else {
    return 0.0;
  }
}

//Função que valida se o desconto esta dentro do limite
void verificarLimiteDesconto(double valorProdutos, double desconto) {
  double porcentagem = valorProdutos * 0.9;
  if (desconto > porcentagem) {
    throw Exception("Desconto acima de 90%, mudar valor do desconto!");
  }
}

// void verificaProdutoAtivo(Produto produto) {
//   if (produto.getStatus() == 'A') {
//     log("Produto ${produto.getNome()} está ativo");
//   } else {
//     log("Produto ${produto.getNome()} está inativo");
//     throw Exception("Produto inativo, ative o produto.");
//   }
// }

//calculo comissão do funcionário valor venda... percentual comissão... limite em reais da comissão... vendeu x ...
// Desconto maximo/minimo, comissão da venda, promoção dia da semana se valor for maior que x, estorno,
