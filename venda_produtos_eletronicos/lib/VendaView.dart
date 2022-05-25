import 'dart:io';
import 'package:venda_produtos_eletronicos/ItensProduto.dart';

import 'Produto.dart';
import 'VendaController.dart' as VendaController;
import 'ValidacoesExtras.dart' as ValidacoesExtras;

List<ItensProduto> itensProdutos = [];
late double descontoVenda;

void aoComecar() {
  int controlarAcao = -1;
  print(executarAcao(controlarAcao));
}

String acoesComProdutos(List<ItensProduto> produtos, Function funcao) {
  return funcao(produtos);
}

String executarAcao(int controlarAcao) {
  String resultado = "";

  while (controlarAcao != 0) {
    print('''
      Digite o valor correspondente a ação desejada:
        1 - Inserir produto.
        2 - Inserir desconto da venda.
        3 - Mostra valor total dos produtos atualmente no carrinho.
        4 - Calcular valor total da venda.
        0 - Sair da loja de produtos eletronicos.
    ''');

    controlarAcao =
        ValidacoesExtras.retornaEValidaValorInt(stdin.readLineSync()!);

    if (controlarAcao == 0) {
      resultado = "Fechando a loja";
    } else if (controlarAcao == 1) {
      itensProdutos.add(inserirProduto());
    } else if (controlarAcao == 2) {
      descontoVenda = ValidacoesExtras.retornaEValidaValorDouble(digiteValor());
    } else if (controlarAcao == 3) {
      print(
          "A soma dos valores dos produtos é: R\$ ${acoesComProdutos(itensProdutos, VendaController.calcularValorProdutos)}");
    } else if (controlarAcao == 4) {
      if (descontoVenda != null) {
        VendaController.calcularValorVenda(
            itensProdutos: itensProdutos, descontoVenda: descontoVenda);
      } else {
        acoesComProdutos(itensProdutos, VendaController.calcularValorVenda);
      }
    }
  }

  return resultado;
}

String descricaoProduto() {
  print("Digite a descricao do pruduto: ");
  return stdin.readLineSync()!;
}

String digiteValor() {
  print("Digite o valor: ");
  return stdin.readLineSync()!;
}

ItensProduto inserirProduto() {
  String nome = descricaoProduto();
  double valor = ValidacoesExtras.retornaEValidaValorDouble(digiteValor());
  Produto produto = Produto();
  produto.setNome(nome);
  produto.setValor(valor);
  ItensProduto itensProduto = ItensProduto();
  itensProduto.setProduto(produto);
  itensProduto.setQuantidadeProdutos(1);
  itensProduto.setDescontoPorProduto(0.2);
  return itensProduto;
}
