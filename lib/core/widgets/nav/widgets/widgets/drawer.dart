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
      shape: Border.all(),
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: logo(fontSize: 36),
          ),
          Container(
            color: AppPalette.greyColor,
            height: 1,
          ),
          const SizedBox(height: 15),
          Column(children: [
            customDrawerButton(
              page: const Dashboard(),
              textEn: 'Orders management',
              icon: Icons.receipt_long,
              context: context,
            ),
          ]),
        ],
      ),
    );
