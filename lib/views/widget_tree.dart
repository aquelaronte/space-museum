import 'package:flutter/material.dart';
import 'package:space_museum/views/pages/home_page.dart';
import 'package:space_museum/controllers/auth.dart';
import 'package:space_museum/views/pages/signin_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const SigninPage();
          }
        });
  }
}
