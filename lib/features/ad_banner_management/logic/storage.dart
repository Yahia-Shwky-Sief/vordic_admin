import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class Storage {
  final SupabaseStorageClient storage = Supabase.instance.client.storage;

  uploadAdBannerAndGetPublicUrl({
    required String filePath,
    required String fileName,
  }) async {
    File file = File(filePath);

    try {
      await storage.from('images').upload("ads_banners/$fileName", file);
    } catch (e) {
      print('Error uploading file: $e');
    }
    String downloadUrl = storage.from('images').getPublicUrl(
          'ads_banners/$fileName',
        );
    return downloadUrl;
  }
}
