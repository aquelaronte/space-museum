import 'package:flutter/material.dart';
import 'package:space_museum/views/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:space_museum/firebase_options.dart';
import 'package:space_museum/views/themes/dark_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Space Museum',
      theme: darkTheme,
      home: const WidgetTree(),
    );
  }
}
