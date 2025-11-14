import 'dart:io';


import 'package:fruits_hub_dashbord/features/add_data/domain/entites/review_entity.dart';

class ProductEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image; // 🔹 خلتها اختيارية
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewEntity> reviewsModel;
  ProductEntity({
    this.imageUrl,
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.expirationsMonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.image,
    required this.isFeatured,
    required this.reviewsModel,
  });
}
