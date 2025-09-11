import 'package:client/core/theme/theme.dart';
import 'package:client/features/auth/view/pages/login_page.dart';
import 'package:client/features/auth/view/pages/signup_page.dart';
import 'package:flutter/material.dart' as material;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'firebase_options.dart' as firebase_options;

Future<void> main() async {
  material.WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp(
    options: firebase_options.DefaultFirebaseOptions.currentPlatform,
  );
  material.runApp(const MyApp());
}

class MyApp extends material.StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  material.Widget build(material.BuildContext context) {
    return material.MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: const SignupPage(),
    );
  }
}
