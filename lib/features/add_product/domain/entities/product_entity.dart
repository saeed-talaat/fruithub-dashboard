import 'dart:io';

class ProductEntity {
  final String productName;
  final String productCode;
  final String productDescription;
  final num productPrice;
  final bool isFeatured;
  final File image;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating = 0;
  final num ratingCount = 0;

  ProductEntity({
    required this.productName,
    required this.productCode,
    required this.productDescription,
    required this.productPrice,
    required this.isFeatured,
    required this.image,
    this.imageUrl,
    required this.expirationsMonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
  });
}
