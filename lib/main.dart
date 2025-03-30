import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vordic_admin/core/secrets/supabase_api_keys.dart';
import 'package:vordic_admin/core/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vordic_admin/features/dashboard/ui/dashboard.dart';
import 'package:vordic_admin/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: const Dashboard(),
    );
  }
}
