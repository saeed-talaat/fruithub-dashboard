import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';

class ImagesRepoImple implements ImagesRepo {
  @override
  Future<Either<Failures, String>> uploadImage({required File imageFile}) {
    throw UnimplementedError();
  }
  
}