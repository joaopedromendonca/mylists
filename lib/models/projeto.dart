class Projeto {
  String nome;
  String? descricao;
  DateTime dataCriacao;
  List<Tarefa> tarefas = [];

  Projeto({
    required this.nome,
    required this.dataCriacao,
    this.descricao,
  });
}

class Tarefa {
  String nome;
  String? descricao;
  bool pendente = true;
  List<Item> itens = [];

  Tarefa({required this.nome});
}

class Item {
  String nome;
  String? descricao;
  DateTime? dataInicio;
  DateTime? dataFim;

  Item({required this.nome});
}
