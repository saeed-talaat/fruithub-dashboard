import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/services/storge_services.dart';
import 'package:path/path.dart' as b;

class FireStorgeServices implements StorgeServices {
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadImage({required File file, required String path}) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    var fileRef = storageRef.child('$path/$fileName.$extensionName');
    await fileRef.putFile(file);
    var imageUrl = await fileRef.getDownloadURL();
    return imageUrl;
  }
}
