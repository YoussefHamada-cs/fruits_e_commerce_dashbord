import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub_dashbord/core/services/data_base_service.dart';



class FireStoreService implements DataBaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({required String path, required Map<String, dynamic> data,String? documentId}) async {
    if (documentId != null) {
      await _firestore.collection(path).doc(documentId).set(data);
    } else {
      await _firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({required String path, required String documentId}) async {
    
      DocumentSnapshot data = await _firestore.collection(path).doc(documentId).get();
    
        return data.data() as Map<String, dynamic>;
    
    
  }
  
  @override
  Future<bool> checkIsUserExists({required String path, required String documentId}) async {
    DocumentSnapshot doc = await _firestore.collection(path).doc(documentId).get();
    return doc.exists;
  }

}   