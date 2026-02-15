

abstract class DataBaseService {
Future<void> addData({required String path, required Map<String, dynamic> data,String? documentId});
  Future<dynamic> getData({
    required String path,
    String? docuementId,
    Map<String, dynamic>? query,
  });
Future<bool> checkIsUserExists({required String path, required String documentId});
} 