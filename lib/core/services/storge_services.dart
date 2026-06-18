

import 'dart:io';

abstract class StorgeServices {
  Future<String> uploadImage({required File file , required String path});
}