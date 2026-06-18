import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/models/add_product_model.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_entity.dart';

class ProductsRepoImple implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImple({required this.databaseService});
  @override
  Future<Either<Failures, void>> addProduct({
    required AddProductEntity addProductEntity,
  }) async {
    try {
      await databaseService.addData(
        path: BackendEndpoint.addProduct,
        data: AddProductModel.fromEntity(
          productEntity: addProductEntity,
        ).toMap(),
      );
      return right(null);
    } catch (e) {
      log('Exception in  ProductsRepoImple.addProduct : ${e.toString()}');
      return left(ServerFailure(errorMessage: 'failed to add product'));
    }
  }
}
