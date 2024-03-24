// ignore_for_file: camel_case_types, library_private_types_in_public_api, unnecessary_null_comparison

import 'package:flutter/material.dart'; // استيراد مكتبة المواد الجاهزة في Flutter
import 'package:shared_preferences/shared_preferences.dart'; // استيراد مكتبة لإدارة البيانات المحلية
import 'dart:convert'; // استيراد مكتبة لتحويل البيانات إلى ومن JSON
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import '../main.dart';

class add extends StatefulWidget {
  const add({super.key});

  @override
  _addState createState() => _addState();
}

class _addState extends State<add> {
  late String name;
  late String image;
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
// متحكم لحقل
  TextEditingController nameform = TextEditingController();
  TextEditingController imageform = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData(); // استدعاء دالة تحميل البيانات عند بدء التشغيل
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedData = prefs.getStringList('dataGames');
    if (savedData != null) {
      setState(() {
        dataGames = savedData
            .map((data) => jsonDecode(data) as Map<String, dynamic>)
            .toList();
      });
    }
  }

  void saveData() async {
    if (name != null) {
      Map<String, dynamic> data = {
        'name': name,
        'image': image,
      };
      SharedPreferences prefs = await SharedPreferences.getInstance();
      dataGames.add(data); // إضافة البيانات الجديدة إلى القائمة
      List<String> encodedData =
          dataGames.map((data) => jsonEncode(data)).toList();
      await prefs.setStringList(
          'dataGames', encodedData); // حفظ البيانات في الذاكرة المحلية
      nameform.clear();
      imageform.clear();
      loadData(); // إعادة تحميل البيانات بعد الحفظ
    }
  }

  void updateDataInSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedData =
        dataGames.map((data) => jsonEncode(data)).toList();
    await prefs.setStringList(
        'dataGames', encodedData); // تحديث البيانات في الذاكرة المحلية
  }

  Future<void> pickImage() async {
    final XFile? selectedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (selectedFile != null) {
      final Directory appDir = await getApplicationDocumentsDirectory();
      final String fileName = path.basename(selectedFile.path);
      final File file = File(selectedFile.path);
      final File newFile = await file.copy('${appDir.path}/images/$fileName');

      setState(() {
        _imageFile = XFile(newFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة  لعبة'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameform,
              decoration: const InputDecoration(labelText: 'الاسم'),
            ),
            ElevatedButton(
              onPressed: pickImage,
              child: const Text('اختر صورة'),
            ),
            if (_imageFile != null)
              Image.file(
                File(_imageFile!.path),
                width: 300,
                height: 300,
              ),
            ElevatedButton(
              onPressed: saveData,
              child: const Text('حفظ'),
            ),
          ],
        ),
      ),
    );
  }
}
