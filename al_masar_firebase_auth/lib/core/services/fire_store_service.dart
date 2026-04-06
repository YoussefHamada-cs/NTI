import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await _firestore.collection(path).doc(documentId).set(data);
    } else {
      await _firestore.collection(path).add(data);
    }
  }

  Future<dynamic> getData({
    required String path,
    String? docuementId,
    Map<String, dynamic>? query,
  }) async {
    if (docuementId != null) {
      var data = await _firestore.collection(path).doc(docuementId).get();
      return data.data();
    }
  }

  Future<bool> checkIsUserExists({
    required String path,
    required String documentId,
  }) async {
    DocumentSnapshot doc = await _firestore
        .collection(path)
        .doc(documentId)
        .get();
    return doc.exists;
  }
}
