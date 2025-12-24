import 'package:client/core/theme/theme.dart' as theme;
import 'package:client/features/view/pages/course_list_page.dart';
import 'package:flutter/material.dart' as material;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter_riverpod/flutter_riverpod.dart' as flutter_riverpod;
import 'firebase_options.dart' as firebase_options;

Future<void> main() async {
  material.WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp(
    options: firebase_options.DefaultFirebaseOptions.currentPlatform,
  );
  material.runApp(flutter_riverpod.ProviderScope(child: const MyApp()));
}

class MyApp extends material.StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  material.Widget build(material.BuildContext context) {
    return material.MaterialApp(
      title: 'Flutter Demo',
      theme: theme.AppTheme.darkThemeMode,
      home: CourseListPage(),
    );
  }
}
