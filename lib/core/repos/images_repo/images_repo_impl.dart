import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashbord/core/errors/failures.dart';
import 'package:fruits_hub_dashbord/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashbord/core/services/storage_service.dart';
import 'package:fruits_hub_dashbord/core/utils/end_points.dart';

class ImgesRepoImpl implements ImagesRepo {
 final StorageService storageService;

  ImgesRepoImpl({required this.storageService});
  @override
  Future<Either<Failure, String>> uploadImage(File image) async{
    try {
  String url =await storageService. uploadFile(image, EndPoints.fruitsImages);
  return Right(url);
}  catch (e) {
  return Left(ServerFailure(e.toString()));
}
  }
}