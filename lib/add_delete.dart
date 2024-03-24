// ignore_for_file: library_private_types_in_public_api, unused_local_variable

import 'package:flutter/material.dart';

import 'op.dart';
import 'screen/add.dart'; // استيراد مكتبة المواد الجاهزة في Flutter

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  _NewScreenState createState() => _NewScreenState();
}

// تعريف حالة الصفحة
class _NewScreenState extends State<NewScreen> {
  bool isNightMode = false; // متغير لتتبع حالة الوضع الليلي/النهاري

  // دالة لتبديل الوضع الليلي/النهاري
  void toggleNightMode() {
    setState(() {
      isNightMode = !isNightMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    // تعيين الألوان بناءً على حالة الوضع
    Color backgroundColor = isNightMode ? Colors.black : Colors.blue;
    Color textColor =
        isNightMode ? Colors.white : Colors.white; // هنا يجب تعديل اللون النصي
    Color appBarColor = isNightMode
        ? const Color.fromARGB(255, 135, 122, 122)
        : const Color.fromARGB(255, 2, 36, 64);

    return Scaffold(
      body: Container(
        color: backgroundColor, // تعيين لون خلفية الصفحة
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25.0),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const op()), // التنقل إلى صفحة أخرى عند النقر
                  );
                },
                title: Text(
                  ' View ', // نص العنصر
                  style: TextStyle(color: textColor), // تعيين لون النص
                ),
                leading: Icon(Icons.info,
                    color: textColor), // رمز في الجزء الأمامي من العنصر
                trailing: Icon(Icons.arrow_forward,
                    color: textColor), // رمز في الجزء الخلفي من العنصر
              ),
              const SizedBox(height: 25.0),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const add()), // التنقل إلى صفحة أخرى عند النقر
                  );
                },
                title: Text(
                  'Add ', // نص العنصر
                  style: TextStyle(color: textColor), // تعيين لون النص
                ),
                leading: Icon(Icons.person_add,
                    color: textColor), // رمز في الجزء الأمامي من العنصر
                trailing: Icon(Icons.arrow_forward,
                    color: textColor), // رمز في الجزء الخلفي من العنصر
              ),
              const SizedBox(height: 25.0),
              const SizedBox(height: 25.0),
            ],
          ),
        ),
      ),
    );
  }
}
