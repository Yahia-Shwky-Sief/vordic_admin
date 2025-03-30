import 'package:flutter/material.dart';
import 'package:vordic_admin/core/theme/app_palette.dart';
import 'package:vordic_admin/core/widgets/logo.dart';
import 'package:vordic_admin/core/widgets/nav/widgets/widgets/drawer_button.dart';
import 'package:vordic_admin/features/dashboard/dashboard.dart';

Widget drawer({
  required context,
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
            ),
            customDrawerButton(
              page: const Dashboard(),
              text: 'Ad Banner Management',
              icon: Icons.ad_units,
              context: context,
            ),
          ]),
        ],
      ),
    );
