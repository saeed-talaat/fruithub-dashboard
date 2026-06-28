import 'package:fruits_hub_dashboard/features/add_product/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.productName,
    required super.productCode,
    required super.productDescription,
    required super.productPrice,
    required super.isFeatured,
    required super.image,
    required super.imageUrl,
    required super.expirationsMonths,
    required super.isOrganic,
    required super.numberOfCalories,
    required super.unitAmount,
  });

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productCode': productCode,
      'productDescription': productDescription,
      'productPrice': productPrice,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths' : expirationsMonths,
      'isOrganic' : isOrganic,
      'numberOfCalories' : numberOfCalories,
      'unitAmount' : unitAmount,
    };
  }

  factory ProductModel.fromEntity({
    required ProductEntity productEntity,
  }) {
    return ProductModel(
      productName: productEntity.productName,
      productCode: productEntity.productCode,
      productDescription: productEntity.productDescription,
      productPrice: productEntity.productPrice,
      isFeatured: productEntity.isFeatured,
      image: productEntity.image,
      imageUrl: productEntity.imageUrl,
      expirationsMonths: productEntity.expirationsMonths,
      isOrganic: productEntity.isOrganic,
      numberOfCalories: productEntity.numberOfCalories,
      unitAmount: productEntity.unitAmount,
    );
  }
}
