import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashbord/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashbord/core/repos/products_repo/products_repo.dart';

import 'package:fruits_hub_dashbord/features/add_data/domain/entites/product_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final ProductsRepo productsRepo;
  final ImagesRepo imagesRepo;
  AddProductCubit(this.productsRepo, this.imagesRepo)
    : super(AddProductInitial());
  Future<void> addProduct(ProductEntity addProductEntity) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(addProductEntity.image);
    result.fold(
      (l) {
        
        emit(AddProductFailure(l.message??'do not complete'));
      },
      (url) async {
        addProductEntity.imageUrl = url;
        var result = await productsRepo.addProduct(addProductEntity);
        result.fold(
          (l) {
           
            emit(AddProductFailure(l.message??'do not complete'));
          },
          (r) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
