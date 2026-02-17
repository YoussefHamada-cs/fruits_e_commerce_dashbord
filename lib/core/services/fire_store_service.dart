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
  Future<dynamic> getData(
      {required String path,
      String? docuementId,
      Map<String, dynamic>? query}) async {
    if (docuementId != null) {
      var data = await _firestore.collection(path).doc(docuementId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = _firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderByField, descending: descending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
 
      var result = await data.get();

      return result.docs.map((e) => e.data()).toList();

    }
  }

  
  @override
  Future<bool> checkIsUserExists({required String path, required String documentId}) async {
    DocumentSnapshot doc = await _firestore.collection(path).doc(documentId).get();
    return doc.exists;
  }
  
  @override
  Stream streamData({required String path, Map<String, dynamic>? query}) async*{
      Query<Map<String, dynamic>> data = _firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderByField, descending: descending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
 
     await for(var result in data.snapshots()){
        yield result.docs.map((e) => e.data()).toList();
      }
  }

}   