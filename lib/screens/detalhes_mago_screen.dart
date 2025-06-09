import 'package:flutter/material.dart';
import '../models/mago.dart';
import '../models/feitico.dart';

class DetalhesMagoScreen extends StatelessWidget {
  final Mago mago;

  const DetalhesMagoScreen({super.key, required this.mago});

  Color _corPorElemento(String elemento) {
    switch (elemento.toLowerCase()) {
      case 'fogo':
        return Colors.red;
      case 'água':
        return Colors.blue;
      case 'terra':
        return Colors.brown;
      case 'ar':
        return Colors.lightBlue;
      case 'luz':
        return Colors.yellow;
      case 'trevas':
        return Colors.deepPurple;
      case 'gelo':
        return Colors.lightBlue[300]!;
      case 'natureza':
        return Colors.green;
      case 'necromancia':
        return Colors.grey;
      case 'cósmico':
        return Colors.indigo;
      case 'tempo':
        return Colors.teal;
      case 'psíquico':
        return Colors.pink;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mago.nome),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Idade: ${mago.idade} anos',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Feitiços:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: mago.feiticos.length,
                itemBuilder: (context, index) {
                  final feitico = mago.feiticos[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: _corPorElemento(feitico.elemento),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  feitico.elemento.toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                feitico.nome,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(feitico.descricao),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
