import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/mago.dart';
import 'detalhes_mago_screen.dart';

class MagosScreen extends StatefulWidget {
  const MagosScreen({super.key});

  @override
  State<MagosScreen> createState() => _MagosScreenState();
}

class _MagosScreenState extends State<MagosScreen> {
  List<Mago> magos = [];

  @override
  void initState() {
    super.initState();
    _carregarMagos();
  }

  Future<void> _carregarMagos() async {
    final String response = await rootBundle.loadString('assets/magos.json');
    final data = await json.decode(response);
    
    setState(() {
      magos = (data['magos'] as List)
          .map((magoJson) => Mago.fromJson(magoJson))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magos e Seus Feitiços'),
        backgroundColor: Colors.deepPurple,
      ),
      body: magos.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: magos.length,
              itemBuilder: (context, index) {
                final mago = magos[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(
                      mago.nome,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text('Idade: ${mago.idade} anos'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetalhesMagoScreen(mago: mago),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
