// ignore_for_file: unnecessary_import, unnecessary_null_comparison, prefer_const_constructors_in_immutables

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../database/sqflite.dart';
import '../../main.dart';
import '../home/home_screen.dart';
import '../login/Login1.dart';
/* import 'package:firebase_auth/firebase_auth.dart'; */
/* import 'package:google_sign_in/google_sign_in.dart'; */

class SingUpScreen extends StatefulWidget {
  SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  SqlDb db = SqlDb();
  /* final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(); */
  double screenHeight = 0;
  double screenWidth = 0;
  late String username;
  late String email;
  late String password;
  late String confirmpassword;
// متحكم لحقل
  TextEditingController usernameform = TextEditingController();
  TextEditingController emailform = TextEditingController();
  TextEditingController passwordform = TextEditingController();
  TextEditingController confirmpasswordform = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData(); // استدعاء دالة تحميل البيانات عند بدء التشغيل
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedData = prefs.getStringList('dataUsers');
    if (savedData != null) {
      setState(() {
        dataUsers = savedData
            .map((data) => jsonDecode(data) as Map<String, dynamic>)
            .toList();
      });
    }
  }

  void saveData() async {
    if (username != null &&
        email != null &&
        password != null &&
        confirmpassword != null) {
      if (password == confirmpassword) {
        Map<String, dynamic> data = {
          'name': username,
          'email': email,
          'password': password,
          'confirmpassword': confirmpassword,
        };
        SharedPreferences prefs = await SharedPreferences.getInstance();
        dataUsers.add(data); // إضافة البيانات الجديدة إلى القائمة
        List<String> encodedData =
            dataUsers.map((data) => jsonEncode(data)).toList();
        await prefs.setStringList(
            'dataUsers', encodedData); // حفظ البيانات في الذاكرة المحلية
        usernameform.clear();
        emailform.clear();
        passwordform.clear();
        confirmpasswordform.clear();
        loadData(); // إعادة تحميل البيانات بعد الحفظ
      }
    }
  }

  void updateDataInSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedData =
        dataUsers.map((data) => jsonEncode(data)).toList();
    await prefs.setStringList(
        'dataUsers', encodedData); // تحديث البيانات في الذاكرة المحلية
  }

  // get auth => null;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 145, 197),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 10),
              child: InkWell(
                onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LOGIN1Screen()),
                ),
                child: const Icon(Icons.arrow_back_ios_new,
                    color: Colors.white, size: 28),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight / 8, //8
                    ),
                    child: Text(
                      "SING UP",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: screenWidth / 10,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 226, 217, 226)),
                    ),
                  ),
                ),
                square(-30, -12),
                square(-10, 0.3),
                square(10, 0.1),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: screenHeight / 1.5,
                    width: screenWidth,

                    color: const Color.fromARGB(255, 239, 57, 245)
                        .withOpacity(0.3), //لون الحقول الرئيسي
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth / 13, //12
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            textField("UserName", Icons.person_outline, false,
                                onChanged: (value) {
                              username = value;
                            }),
                            textField("Email", Icons.email_outlined, false,
                                onChanged: (value) {
                              email = value;
                            }),
                            textField("Password", Icons.lock_outlined, true,
                                onChanged: (value) {
                              password = value;
                            }),
                            textField(
                                "Confirm Password", Icons.lock_outlined, true,
                                onChanged: (value) {
                              confirmpassword = value;
                            }),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: screenWidth,
                              height: 50,
                              margin: const EdgeInsets.only(
                                bottom: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 16, 100, 211),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    saveData;
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MyHomePage(),
                                      ),
                                    );
                                    /* db.insertData(email, password); */
                                    //   try {
                                    // var user = await auth.createUserWithEmailAndPassword(
                                    //   email:email,password:password);
                                    // }catch(e){
                                    //   print(e);
                                    // }
                                  },
                                  child: const Text(
                                    "SING UP",
                                    style: TextStyle(
                                        fontFamily: "Mdntserrat",
                                        color:
                                            Color.fromARGB(255, 247, 245, 245),
                                        letterSpacing: 1.5,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                bottom: 30,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MyHomePage()),
                                  );
                                },
                                child: const Text(
                                  "Already have an account? Login",
                                  style: TextStyle(
                                    fontFamily: "Mdntserrat",
                                    color: Colors.black54,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget textField(String hint, IconData icon, bool password,
      {required Null Function(dynamic value) onChanged}) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      child: TextFormField(
        onChanged: (value) {
          username = value;
          email = value;
          password = value as bool;
          confirmpassword = value;
        },
        obscureText: password,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(
                  66, 189, 176, 176), //لون الخصوط الفاصله مابين الحقول
              //  color: Colors.lightBlueAccent,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 238, 235,
                  233), // لون الخصوط الفاصله مابين الحقول يتغير عند الضغط
            ),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.black26,
          ),
          contentPadding: const EdgeInsets.only(
            top: 14,
          ),
        ),
      ),
    );
  }

  Widget square(double y, double opacity) {
    return Center(
      child: Transform.translate(
        offset: Offset(screenWidth / 30, y),
        child: Transform.rotate(
          angle: -0.4,
          child: Container(
            height: screenHeight / 3,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 247, 79, 253).withOpacity(0.5),
              borderRadius: BorderRadius.circular(55),
            ),
          ),
        ),
      ),
    );
  }
}
