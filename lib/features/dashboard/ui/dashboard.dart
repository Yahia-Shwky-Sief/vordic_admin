import 'package:flutter/material.dart';
import 'package:vordic_admin/core/widgets/nav/nav.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return nav(
      context: context,
      selectedPageId: 0,
      body: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Dashboard'),
        ),
        body: const Center(
          child: Text('Welcome to the Dashboard!'),
        ),
      ),
    );
  }
}
