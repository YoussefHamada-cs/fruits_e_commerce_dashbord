import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashbord/core/errors/failures.dart';

import 'package:fruits_hub_dashbord/features/add_data/domain/entites/product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failure, void>> addProduct(ProductEntity addProductEntity);
}
