import 'package:flutter/material.dart';
import 'main_navigation.dart';

void main() {
  runApp(const NajmaApp());
}

class NajmaApp extends StatelessWidget {
  const NajmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Najma App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D0D0D), // نفس ثيم تطبيقك النيوني المظلم
      ),
      home: const MainNavigation(), // توجيه التطبيق مباشرة لصفحة التنقل والمحفظة والشات
    );
  }
}

