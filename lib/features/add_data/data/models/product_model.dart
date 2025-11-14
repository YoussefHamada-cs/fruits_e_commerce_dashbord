import 'dart:io';
import 'package:fruits_hub_dashbord/features/add_data/data/models/review_model.dart';
import 'package:fruits_hub_dashbord/features/add_data/domain/entites/product_entity.dart';


class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  final int sellingCount;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount;
  final int unitAmount;
  final List<ReviewModel> reviewsModel;
  ProductModel({
    this.imageUrl,
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    required this.expirationsMonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviewsModel,
    this.sellingCount = 0,
    this.ratingCount = 0,
    this.avgRating = 0,
  });
  factory ProductModel.fromEntity(ProductEntity addProductEntity) {
    return ProductModel(
      imageUrl: addProductEntity.imageUrl,
      name: addProductEntity.name,
      code: addProductEntity.code,
      description: addProductEntity.description,
      price: addProductEntity.price,
      image: addProductEntity.image,
      isFeatured: addProductEntity.isFeatured,
      expirationsMonths: addProductEntity.expirationsMonths,
      isOrganic: addProductEntity.isOrganic,
      numberOfCalories: addProductEntity.numberOfCalories,
      unitAmount: addProductEntity.unitAmount,
      reviewsModel: addProductEntity.reviewsModel
          .map((e) => ReviewModel.fromEntity(e))
          .toList(),
    );
  }
  toJson() => {
    'name': name,
    'code': code,
    'description': description,
    'price': price,
    'isFeatured': isFeatured,
    'imageUrl': imageUrl,
    'expirationsMonths': expirationsMonths,
    'isOrganic': isOrganic,
    'numberOfCalories': numberOfCalories,
    'unitAmount': unitAmount,
    'reviewsModel': reviewsModel.map((e) => e.toJson()).toList(),
    'sellingCount':sellingCount,
  };
}
