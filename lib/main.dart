import 'package:flutter/material.dart';

import 'screen/login/Login1.dart';

List<Map<String, dynamic>> dataUsers = []; // قائمة لتخزين البيانات
List<Map<String, dynamic>> dataGames = []; // قائمة لتخزين البيانات

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Circular Bottom Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LOGIN1Screen(),
    );
  }
}
