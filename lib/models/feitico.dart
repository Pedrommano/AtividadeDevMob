class Feitico {
  final String nome;
  final String descricao;
  final String elemento;

  Feitico({
    required this.nome,
    required this.descricao,
    required this.elemento,
  });

  factory Feitico.fromJson(Map<String, dynamic> json) {
    return Feitico(
      nome: json['nome'],
      descricao: json['descricao'],
      elemento: json['elemento'],
    );
  }
}
