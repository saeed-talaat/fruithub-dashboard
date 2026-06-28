import 'dart:io';

import 'package:fruits_hub_dashboard/constants.dart';
import 'package:fruits_hub_dashboard/core/services/storge_services.dart';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorgeService implements StorgeServices {
  static late Supabase _supabase;

  static Future<void> createBuckets(String bucketName) async {
    var buckets = await _supabase.client.storage.listBuckets();
    bool isBucketsExits = false;

    for (var bucket in buckets) {
      if (bucketName == bucket.id) {
        isBucketsExits = true;
        break;
      }
    }
    if (!isBucketsExits) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  static Future<void> initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kSupabaseProjectUrl,
      publishableKey: kSupabasePublicKey,
    );
  }

  @override
  Future<String> uploadImage({required File file, required String path}) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
     await _supabase.client.storage
        .from(imagesBucket)
        .upload('$path/$fileName.$extensionName', file);
    String publicUrl = _supabase.client.storage
        .from(imagesBucket)
        .getPublicUrl('$path/$fileName.$extensionName');
    return publicUrl;    
  }
}
