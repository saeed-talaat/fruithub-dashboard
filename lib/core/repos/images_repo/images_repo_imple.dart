import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/services/storge_services.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';

class ImagesRepoImple implements ImagesRepo {
  final StorgeServices storgeServices;

  ImagesRepoImple({required this.storgeServices});
  @override
  Future<Either<Failures, String>> uploadImage({
    required File imageFile,
  }) async {
    try {
      String imageUrl = await storgeServices.uploadImage(
        file: imageFile,
        path: BackendEndpoint.images,
      );
      return right(imageUrl);
    } catch (e) {
      log('Exception in ImagesRepoImple.uploadImage : ${e.toString()}');
      return left(
        ServerFailure(
          errorMessage: ' Failed to Upload Image try again later !',
        ),
      );
    }
  }
}
