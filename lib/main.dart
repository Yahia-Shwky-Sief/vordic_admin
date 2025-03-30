import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vordic_admin/core/theme/theme.dart';
import 'package:vordic_admin/features/nav/nav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vordic_admin/firebase_options.dart';
import 'package:vordic_admin/core/constants/supabase_api_keys.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: SupabaseApiKeys.url,
    anonKey: SupabaseApiKeys.anonKey,
  );
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
