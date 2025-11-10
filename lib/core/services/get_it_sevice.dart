
import 'package:fruits_hub_dashbord/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashbord/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruits_hub_dashbord/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub_dashbord/core/repos/products_repo/products_repo_impl.dart';
import 'package:fruits_hub_dashbord/core/services/data_base_service.dart';
import 'package:fruits_hub_dashbord/core/services/fire_storage.dart';
import 'package:fruits_hub_dashbord/core/services/fire_store_service.dart';
import 'package:fruits_hub_dashbord/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
    getIt.registerSingleton<StorageService>(
   FireStorage()
  );
   getIt.registerSingleton<DataBaseService>(
   FireStoreService()
  );
     getIt.registerSingleton<ProductsRepo>(
   ProductsRepoImpl(dataBaseService:getIt.get<DataBaseService>() )
  );
    getIt.registerSingleton<ImagesRepo>(
   ImgesRepoImpl( storageService: getIt.get<StorageService>())
  );
   

}