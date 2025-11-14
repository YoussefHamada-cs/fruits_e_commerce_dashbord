import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashbord/core/services/storage_service.dart';
import 'package:path/path.dart' as b;

class FireStorage implements StorageService {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadFile(File file, String path)async {
    String fileName=b.basename(file.path);
    String extensionName= b.extension(file.path);
 var fileRef= storageRef.child('$path/$fileName.$extensionName');
 await fileRef.putFile(file);
var fileUrl=fileRef.getDownloadURL();
  return fileUrl;
  }
  
}