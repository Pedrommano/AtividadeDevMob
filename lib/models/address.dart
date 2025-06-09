import 'package:json_annotation/json_annotation.dart';
part 'address.g.dart';

class Endereco {
  final String? id;
  final String rua;
  final String numero;
  final String cidade;
  final String estado;
  final String cep;

  Endereco({
    this.id,
    required this.rua,
    required this.numero,
    required this.cidade,
    required this.estado,
    required this.cep,
  });

  Map<String, dynamic> toMap() {
    return {
      'rua': rua,
      'numero': numero,
      'cidade': cidade,
      'estado': estado,
      'cep': cep,
    };
  }

  factory Endereco.fromMap(String id, Map<String, dynamic> map) {
    return Endereco(
      id: id,
      rua: map['rua'] ?? '',
      numero: map['numero'] ?? '',
      cidade: map['cidade'] ?? '',
      estado: map['estado'] ?? '',
      cep: map['cep'] ?? '',
    );
  }
}
