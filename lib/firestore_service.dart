import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Método genérico para adicionar documento
  static Future<DocumentReference> addDocument({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    return await _firestore.collection(collection).add(data);
  }

  // Método genérico para atualizar documento
  static Future<void> updateDocument({
    required String collection,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection(collection).doc(docId).update(data);
  }

  // Método genérico para deletar documento
  static Future<void> deleteDocument({
    required String collection,
    required String docId,
  }) async {
    await _firestore.collection(collection).doc(docId).delete();
  }

  // Stream de uma coleção inteira
  static Stream<QuerySnapshot> collectionStream({required String collection}) {
    return _firestore.collection(collection).snapshots();
  }

  // Stream de um documento específico
  static Stream<DocumentSnapshot> documentStream({
    required String collection,
    required String docId,
  }) {
    return _firestore.collection(collection).doc(docId).snapshots();
  }
}
