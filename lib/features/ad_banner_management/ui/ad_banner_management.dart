import 'package:flutter/material.dart';
import 'package:vordic_admin/core/widgets/nav/nav.dart';
import 'package:vordic_admin/features/ad_banner_management/data/models/ad.dart';
import 'package:vordic_admin/features/ad_banner_management/data/sources/ads_banner_data_source.dart';
import 'package:vordic_admin/features/ad_banner_management/ui/widgets/ad_dialog.dart';

class AdBannerManagement extends StatelessWidget {
  AdBannerManagement({super.key});
  final AdsBannerDataSource adsBannerDataSource = AdsBannerDataSource();
  @override
  Widget build(BuildContext context) {
    return nav(
      context: context,
      selectedPageId: 1,
      body: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Ad Banner Management'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return const AdDialog();
                  },
                );
              },
            ),
          ],
        ),
        body: StreamBuilder(
          stream: adsBannerDataSource.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List ads = snapshot.data.docs.map((e) {
                return Ad.fromJson(e.data());
              }).toList();
              if (ads.isEmpty) {
                return const Center(child: Text('No Ads Found'));
              } else {
                return ListView.builder(
                  itemCount: ads.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(ads[index].adName!),
                      leading: Image.network(ads[index].adBanner!),
                    );
                  },
                );
              }
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
