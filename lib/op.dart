// ignore_for_file: library_private_types_in_public_api, camel_case_types

import 'package:flutter/material.dart'; // استيراد مكتبة المواد الجاهزة في Flutter
import 'package:shared_preferences/shared_preferences.dart'; // استيراد مكتبة لإدارة البيانات المحلية
import 'dart:convert';

import 'main.dart'; // استيراد مكتبة لتحويل البيانات إلى ومن JSON

class op extends StatefulWidget {
  const op({super.key});

  @override
  _opState createState() => _opState();
}

class _opState extends State<op> {
  @override
  void initState() {
    super.initState();
    loadData(); // استدعاء دالة تحميل البيانات عند بدء التشغيل
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedData = prefs.getStringList('dataGamesNew');
    if (savedData != null) {
      setState(() {
        dataGames = savedData
            .map((data) => jsonDecode(data) as Map<String, dynamic>)
            .toList();
      });
    }
  }

  void updateDataInSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedData =
        dataGames.map((data) => jsonEncode(data)).toList();
    await prefs.setStringList(
        'dataGamesNew', encodedData); // تحديث البيانات في الذاكرة المحلية
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('عرض البيانات'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (dataGames.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                itemCount: dataGames.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data = dataGames[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: ListTile(
                      title: Text('الاسم: ${data['name']}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 115,
                            height: 145,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadiusDirectional.only(
                                  bottomEnd: Radius.circular(35.0),
                                  bottomStart: Radius.circular(35.0)),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: GestureDetector(
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Image.asset("images/759.png"),
                                  Container(
                                    width: 98,
                                    color:
                                        const Color.fromARGB(255, 252, 251, 251)
                                            .withOpacity(.3),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    child: const Text(
                                      "flower",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              _editData(index);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              _deleteData(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            if (dataGames.isEmpty)
              const Text(
                'لا توجد بيانات محفوظة',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }

  void _editData(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String name = dataGames[index]['name'];
        int age = dataGames[index]['age'];
        int familyMembers = dataGames[index]['familyMembers'];
        String type = dataGames[index]['type'];

        TextEditingController nameController =
            TextEditingController(text: name);
        TextEditingController ageController =
            TextEditingController(text: age.toString());
        TextEditingController familyMembersController =
            TextEditingController(text: familyMembers.toString());
        String dropdownValue = type;

        return AlertDialog(
          title: const Text('تعديل البيانات'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'الاسم'),
              ),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(labelText: 'العمر'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: familyMembersController,
                decoration:
                    const InputDecoration(labelText: 'عدد أفراد الأسرة'),
                keyboardType: TextInputType.number,
              ),
              DropdownButton<String>(
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['ملكية', 'إيجار']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('إلغاء'),
            ),
            TextButton(
              onPressed: () {
                Map<String, dynamic> updatedData = {
                  'name': nameController.text,
                  'age': int.tryParse(ageController.text) ?? 0,
                  'familyMembers':
                      int.tryParse(familyMembersController.text) ?? 0,
                  'type': dropdownValue,
                };
                editData(index, updatedData);
                Navigator.of(context).pop();
              },
              child: const Text('حفظ التعديل'),
            ),
          ],
        );
      },
    );
  }

  void editData(int index, Map<String, dynamic> updatedData) {
    setState(() {
      dataGames[index] = updatedData;
    });
    updateDataInSharedPreferences();
  }

  void _deleteData(int index) {
    setState(() {
      dataGames.removeAt(index);
    });
    updateDataInSharedPreferences();
  }
}
