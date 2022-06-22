class Cliente {
  late int _id;
  late String _nome;
  late String _cpf;

  // 'A' para ativo, 'I' para inativo
  late String _status;
  late DateTime _dataCadastro;

  Cliente() {
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

  String get status => _status;

  set status(String status) => _status = status;

  DateTime get dataCadastro => _dataCadastro;
}
