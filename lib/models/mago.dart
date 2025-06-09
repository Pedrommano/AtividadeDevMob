class Mago {
  final String nome;
  final int idade;
  final List<Feitico> feiticos;

  Mago({
    required this.nome,
    required this.idade,
    required this.feiticos,
  });

  factory Mago.fromJson(Map<String, dynamic> json) {
    var feiticosJson = json['feiticos'] as List;
    List<Feitico> feiticosList = feiticosJson
        .map((feiticoJson) => Feitico.fromJson(feiticoJson))
        .toList();

    return Mago(
      nome: json['nome'],
      idade: json['idade'],
      feiticos: feiticosList,
    );
  }
}
