import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class Storage {
  final SupabaseStorageClient storage = Supabase.instance.client.storage;

  uploadAdBannerAndGetPublicUrl({
    required String filePath,
    required String fileName,
    required String folderName,
  }) async {
    File file = File(filePath);

    try {
      await storage.from('images').upload("$folderName/$fileName", file);
    } catch (e) {
      print('Error uploading file: $e');
    }
    String downloadUrl = storage.from('images').getPublicUrl(
          '$folderName/$fileName',
        );
    return downloadUrl;
  }
}
