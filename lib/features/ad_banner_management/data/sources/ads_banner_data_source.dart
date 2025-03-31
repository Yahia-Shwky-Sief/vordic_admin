import 'package:vordic_admin/core/helper/storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vordic_admin/features/ad_banner_management/data/models/ad.dart';

class AdsBannerDataSource {
  Storage storage = Storage();
  static final CollectionReference _firebase =
      FirebaseFirestore.instance.collection('Ads');
  static const String _folderName = 'ads_banners';
  Stream stream = _firebase.snapshots();

  Future<String> uploadAdBannerAndGetPublicUrl(
      {required String filePath, required String fileName}) async {
    String downloadUrl = await storage.uploadAdBannerAndGetPublicUrl(
      filePath: filePath,
      fileName: fileName,
      folderName: _folderName,
    );
    return downloadUrl;
  }

  addAd({required Ad ad}) async {
    _firebase.doc(ad.adId).set(ad.toJson()).then((value) {
      print("Ad Added");
    }).catchError((error) {
      print("Failed to add ad: $error");
    });
  }
}
