import 'package:flutter/material.dart';
import 'package:vordic_admin/core/widgets/nav/widgets/widgets/drawer.dart';

Widget nav({required context, required Widget body, required int selectedPageId,})=>
   Scaffold(
    extendBodyBehindAppBar: true,
    body: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        drawer(context: context, selectedPageId: selectedPageId),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: body,
          ),
        ),
      ],
    ),
  );

