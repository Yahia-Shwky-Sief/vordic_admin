import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class Storage {
  final SupabaseStorageClient storage = Supabase.instance.client.storage;

  Future<void> uploadFile({
    required String filePath,
    required String fileName,
  }) async {
    File file = File(filePath);

    try {
      await storage.from('images').upload(filePath, file);
    } catch (e) {
      print('Error uploading file: $e');
    }
  }

  Future<String> downloadUrl({
    required String imageName,
  }) async {
    String downloadUrl =
        await storage.from('images').createSignedUrl('images/$imageName', 60);
    return downloadUrl;
  }
}
