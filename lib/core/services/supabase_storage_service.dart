import 'dart:io';
import 'package:fruits_hub_dashbord/core/services/storage_service.dart';
import 'package:fruits_hub_dashbord/core/utils/end_points.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStorageService implements StorageService {
  static Future<void> createBuckets(String bucketName) async {
    final supabase = Supabase.instance.client; 

    // الافضل تنشاء bucket من dashboard
    final buckets = await supabase.storage.listBuckets();

    bool isBucketExists = buckets.any((bucket) => bucket.id == bucketName);

    if (!isBucketExists) {
      await supabase.storage.createBucket(bucketName);
    }
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    final supabase = Supabase.instance.client; 

    String fileName = b.basename(file.path);
  

 
  final filePath = '$path/$fileName';

  
  await supabase.storage.from(EndPoints.images).upload(filePath, file);


  final publicUrl = supabase.storage.from(EndPoints.images).getPublicUrl(filePath);;

  return publicUrl;
   
  }
  
}
