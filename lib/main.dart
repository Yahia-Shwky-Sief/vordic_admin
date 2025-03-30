import 'package:flutter/material.dart';
import 'package:vordic_admin/core/theme/theme.dart';
import 'package:vordic_admin/features/nav/nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: const Nav(),
    );
  }
}
