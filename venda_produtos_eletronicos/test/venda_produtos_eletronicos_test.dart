import 'package:test/test.dart';
import 'package:venda_produtos_eletronicos/ItensProduto.dart';
import 'package:venda_produtos_eletronicos/Produto.dart';
import 'package:venda_produtos_eletronicos/VendaController.dart';

void main() {
  late ItensProduto itensProduto;
  late int quantidadeProdutos;
  late Produto produto;

  setUp(() {
    itensProduto = ItensProduto();
    produto = Produto("Teste");
    produto.valor = 45.0;
    itensProduto.produto = produto;
    quantidadeProdutos = 3;
  });

  group("Grupo de testes para funcionários contratados", () {
    test(
        "Teste da comissão por funcionário contratado quantidade de produtos == 3",
        () {
      //Aqui vamos pegar o valor do produto e definir o valor da comissão
      // com base na quantidade de produtos vendidos
      //O valor aqui esperado será 45.0 * 0.005 = 0.225
      expect(
          calculaValorComissaoPorQuantidadeProdutosFuncionarioContratado(
              itensProduto, quantidadeProdutos),
          0.225);
    });

    test(
        "Teste da comissão por funcionário contratado quantidade de produtos == 6",
        () {
      //Mudado o valor da quantidade de produtos para trocar o valor do multiplicador
      quantidadeProdutos = 6;
      //O valor aqui esperado será 45.0 * 0.01 = 0.45
      expect(
          calculaValorComissaoPorQuantidadeProdutosFuncionarioContratado(
              itensProduto, quantidadeProdutos),
          0.45);
    });
    test(
        "Teste da comissão por funcionário contratado quantidade de produtos == 12",
        () {
      quantidadeProdutos = 12;
      //O valor aqui esperado será 45.0 * 0.02 = 0.9
      expect(
          calculaValorComissaoPorQuantidadeProdutosFuncionarioContratado(
              itensProduto, quantidadeProdutos),
          0.9);
    });

    test(
        "Teste da comissão por funcionário contratado quantidade de produtos negativa",
        () {
      //Agora será mudado o valor da quantidade de produtos para uma quantidade
      // negativa uma vaz que ainda não tem uma validação para quantidade negativa
      // ou zerada logo estaremos em um caso onde o teste não passará, uma vez que
      // não deveria haver comissão para quantidade de produtos negativa.
      quantidadeProdutos = -5;
      var erro = calculaValorComissaoPorQuantidadeProdutosFuncionarioContratado(
          itensProduto, quantidadeProdutos);
      expect(erro, isA<Exception>());
    });
  });
}
