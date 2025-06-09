import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart';
import 'services/auth_service.dart';
import 'models/usuario_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Firestore Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _authService = AuthService();
  final UsuarioRepository _usuarioRepository = UsuarioRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firestore Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _criarUsuarioExemplo,
              child: const Text('Criar Usuário Exemplo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _listarUsuarios,
              child: const Text('Listar Usuários'),
            ),
            const SizedBox(height: 20),
            StreamBuilder<List<Usuario>>(
              stream: _usuarioRepository.usuariosStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text('Total de usuários: ${snapshot.data!.length}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _criarUsuarioExemplo() async {
    final usuario = Usuario(
      nome: 'Exemplo ${DateTime.now().second}',
      email: 'exemplo${DateTime.now().second}@teste.com',
      dataNascimento: DateTime(1990, 1, 1),
      interesses: ['Flutter', 'Firebase', 'Dart'],
    );

    try {
      final id = await _usuarioRepository.addUsuario(usuario);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuário criado com ID: $id')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao criar usuário: $e')),
      );
    }
  }

  Future<void> _listarUsuarios() async {
    final usuarios = await _usuarioRepository.searchUsuariosByName('Exemplo');
    for (var usuario in usuarios) {
      print('Usuário: ${usuario.nome}, Email: ${usuario.email}');
    }
  }
}
