import 'dart:io';

class AddProductEntity {
  final String productName;
  final String productCode;
  final String productDescription;
  final num productPrice;
  final bool isFeatured;
  final File image;
  final String? imageUrl;
  AddProductEntity({
    required this.productName,
    required this.productCode,
    required this.productDescription,
    required this.productPrice,
    required this.isFeatured,
    required this.image,
    this.imageUrl,
  });
}
