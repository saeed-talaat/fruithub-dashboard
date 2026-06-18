import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_entity.dart';

class AddProductModel extends AddProductEntity {
  AddProductModel({
    required super.productName,
    required super.productCode,
    required super.productDescription,
    required super.productPrice,
    required super.isFeatured,
    required super.image,
    required super.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productCode': productCode,
      'productDescription': productDescription,
      'productPrice': productPrice,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
    };
  }

  factory AddProductModel.fromEntity({
    required AddProductEntity productEntity,
  }) {
    return AddProductModel(
      productName: productEntity.productName,
      productCode: productEntity.productCode,
      productDescription: productEntity.productDescription,
      productPrice: productEntity.productPrice,
      isFeatured: productEntity.isFeatured,
      image: productEntity.image,
      imageUrl: productEntity.imageUrl,
    );
  }
}
