import 'package:flutter/material.dart';
import 'package:vordic_admin/core/theme/app_palette.dart';
import 'package:vordic_admin/core/widgets/logo.dart';
import 'package:vordic_admin/core/widgets/nav/widgets/widgets/drawer_button.dart';
import 'package:vordic_admin/features/ad_banner_management/ui/ad_banner_management.dart';
import 'package:vordic_admin/features/dashboard/ui/dashboard.dart';

Widget drawer({
  required BuildContext context,
  required int selectedPageId,
}) =>
    Drawer(
      width: 300,
      backgroundColor: AppPalette.borderColor,
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(padding: const EdgeInsets.all(16), child: logo(fontSize: 48)),
          const SizedBox(height: 15),
          Column(children: [
            customDrawerButton(
              page: const Dashboard(),
              text: 'Dashboard',
              icon: Icons.dashboard,
              context: context,
              selected: selectedPageId == 0,
            ),
            customDrawerButton(
              page: const AdBannerManagement(),
              text: 'Ad Banner Management',
              icon: Icons.ad_units,
              context: context,
              selected: selectedPageId == 1,
            ),
          ]),
        ],
      ),
    );
