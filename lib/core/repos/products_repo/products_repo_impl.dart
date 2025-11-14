import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashbord/core/errors/failures.dart';
import 'package:fruits_hub_dashbord/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub_dashbord/core/services/data_base_service.dart';
import 'package:fruits_hub_dashbord/core/utils/end_points.dart';
import 'package:fruits_hub_dashbord/features/add_data/data/models/product_model.dart';
import 'package:fruits_hub_dashbord/features/add_data/domain/entites/product_entity.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DataBaseService dataBaseService;

  ProductsRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, void>> addProduct(
    ProductEntity addProductEntity,
  ) async {
    try {
      await dataBaseService.addData(
        path: EndPoints.addProducts,
        data: ProductModel.fromEntity(addProductEntity).toJson(),
      );
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
