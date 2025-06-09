import 'package:firebase_auth/firebase_auth.dart';
import '../repositories/usuario_repository.dart';
import '../models/usuario_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UsuarioRepository _usuarioRepository = UsuarioRepository();

  // Stream do usuário autenticado
  Stream<User?> get user => _auth.authStateChanges();

  // Cadastro com email e senha
  Future<String?> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String nome,
    required DateTime dataNascimento,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Cria o documento do usuário no Firestore
      final usuario = Usuario(
        nome: nome,
        email: email,
        dataNascimento: dataNascimento,
      );

      await _usuarioRepository.addUsuario(usuario);

      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Login com email e senha
  Future<String?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Logout
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Deletar conta
  Future<String?> deleteAccount() async {
    try {
      await _auth.currentUser?.delete();
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
