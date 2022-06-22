class Funcionario {
  late int _id;
  late String _nome;
  late String _cpf;

  //Podemos ter como resposta:
  // "CONTRATADO";
  // "TEMPORARIO";
  // "ESTAGIARIO";
  // "TERCERIZADO";
  late String _tipoContratacao;

  // 'A' para ativo, 'I' para inativo
  late String _status;
  late DateTime _dataCadastro;

  Funcionario() {
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

  String get cpf => _cpf;

  set cpf(String cpf) => _cpf = cpf;

  String get tipoContratacao => _tipoContratacao;

  set cotratacao(String tipoContratacao) => _tipoContratacao = tipoContratacao;

  String get status => _status;

  set status(String status) => _status = status;

  DateTime get dataCadastro => _dataCadastro;
}
