import 'package:test/test.dart';
import 'package:venda_produtos_eletronicos/ItensProduto.dart';
import 'package:venda_produtos_eletronicos/Produto.dart';

import '../lib/VendaController.dart';
import '../test/venda_produtos_eletronicos_test.dart';

void main() {}

void testarCalculaValorComissaoPorQuantidadeProdutosFuncionarioContratado() {
  test("Teste da comissão por funcionário contratado", (() {
    Produto produto = Produto("Teste");
    produto.valor = 45.0;
    ItensProduto itensProduto = ItensProduto();
    itensProduto.produto = produto;
    int quantidadeProdutos = 3;

    //Aqui vamos pegar o valor do produto e definir o valor da comissão
    // com base na quantidade de produtos vendidos
    //O valor aqui esperado será 45.0 * 0.005 = 0.225
    expect(
        calculaValorComissaoPorQuantidadeProdutosFuncionarioContratado(
            itensProduto, quantidadeProdutos),
        0.225);

    //Mudado o valor da quantidade de produtos para trocar o valor do multiplicador
    quantidadeProdutos = 6;
    //O valor aqui esperado será 45.0 * 0.01 = 0.45
    expect(
        calculaValorComissaoPorQuantidadeProdutosFuncionarioContratado(
            itensProduto, quantidadeProdutos),
        0.45);

    quantidadeProdutos = 12;
    //O valor aqui esperado será 45.0 * 0.02 = 0.9
    expect(
        calculaValorComissaoPorQuantidadeProdutosFuncionarioContratado(
            itensProduto, quantidadeProdutos),
        0.9);

    //Agora será mudado o valor da quantidade de produtos para uma quantidade
    // negativa uma vaz que ainda não tem uma validação para quantidade negativa
    // ou zerada logo estaremos em um caso onde o teste não passará, uma vez que
    // não deveria haver comissão para quantidade de produtos negativa.
    quantidadeProdutos = -5;
    expect(
        calculaValorComissaoPorQuantidadeProdutosFuncionarioContratado(
            itensProduto, quantidadeProdutos),
        0.0);
  }));
}
