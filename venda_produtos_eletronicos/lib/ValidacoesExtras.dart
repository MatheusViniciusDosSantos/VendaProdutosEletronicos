int retornaEValidaValorInt(String valor) {
  try {
    return int.parse(valor);
  } on FormatException {
    throw FormatException(
        "Você digitou um caractere que não é um número. Dica: digite 1!");
  } catch (e) {
    throw Exception("O seguinte erro ocorreu ao validar o valor inteiro $e");
  }
}

double retornaEValidaValorDouble(String valor) {
  try {
    return double.parse(valor);
  } on FormatException {
    throw FormatException(
        "Você digitou um caractere que não é um número. Dica: digite 1.0!");
  } catch (e) {
    throw Exception("O seguinte erro ocorreu ao validar o valor double $e");
  }
}
