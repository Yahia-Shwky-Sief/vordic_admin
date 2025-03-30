import 'package:flutter/material.dart';
import 'package:vordic_admin/core/widgets/nav/nav.dart';

class AdBannerManagement extends StatelessWidget {
  const AdBannerManagement({super.key});

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
                // Add your action here
              },
            ),
          ],
        ),
        body: const Center(
          child: Text('Welcome to the Ad Banner Management!'),
        ),
      ),
    );
  }
}
