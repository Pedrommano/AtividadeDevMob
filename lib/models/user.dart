class Usuario {
  final String? id;
  final String nome;
  final String email;
  final DateTime dataNascimento;
  final List<String> interesses;

  Usuario({
    this.id,
    required this.nome,
    required this.email,
    required this.dataNascimento,
    this.interesses = const [],
  });

  // Converte o modelo para Map (para Firebase)
  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'dataNascimento': dataNascimento,
      'interesses': interesses,
    };
  }

  // Cria modelo a partir de Map (do Firebase)
  factory Usuario.fromMap(String id, Map<String, dynamic> map) {
    return Usuario(
      id: id,
      nome: map['nome'] ?? '',
      email: map['email'] ?? '',
      dataNascimento: (map['dataNascimento'] as Timestamp).toDate(),
      interesses: List<String>.from(map['interesses'] ?? []),
    );
  }
}
