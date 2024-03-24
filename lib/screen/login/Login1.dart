// ignore_for_file: avoid_unnecessary_containers, unnecessary_null_comparison, unrelated_type_equality_checks, file_names

import 'package:flutter/material.dart';

import '../../database/sqflite.dart';

import '../../main.dart';
import '../FadeAnimation.dart';
import '../home/home_screen.dart';
import '../signup/sing_up.dart';

late String emailLogin;
late String passwordLogin;

class LOGIN1Screen extends StatefulWidget {
  const LOGIN1Screen({super.key});

  @override
  State<LOGIN1Screen> createState() => LOGIN1ScreenState();
}

class LOGIN1ScreenState extends State<LOGIN1Screen> {
  bool showpass = true;
  late String emailLogin;
  late String passwordLogin;
  SqlDb db = SqlDb();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 320,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/background.png'),
                      fit: BoxFit.fill)),
              child: Stack(
                children: <Widget>[
                  /* زر الرجوع  */
                  // IconButton(
                  //   icon:
                  //       const Icon(Icons.arrow_back, color: Color(0xFF545D68)),
                  //   onPressed: () {
                  //     Navigator.of(context).pushReplacement(
                  //       MaterialPageRoute(
                  //           builder: (context) => const EndScreen()),
                  //     );
                  //   },
                  // ),
                  /* المضلة الكبيرة */
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child: FadeAnimation(
                        1,
                        Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/light-1.png'))),
                        )),
                  ),
                  /* المضلة الصغيرة */
                  Positioned(
                    left: 140,
                    width: 80,
                    height: 120,
                    child: FadeAnimation(
                        1.3,
                        Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/light-2.png'))),
                        )),
                  ),
                  /* الساعة */
                  Positioned(
                    right: 40,
                    top: 40,
                    width: 80,
                    height: 90,
                    child: FadeAnimation(
                        1.5,
                        Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/clock.png'))),
                        )),
                  ),
                  /* login */
                  Positioned(
                    child: FadeAnimation(
                        1.6,
                        Container(
                          margin: const EdgeInsets.only(top: 70),
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(children: <Widget>[
                  FadeAnimation(
                    1.8,
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Color.fromARGB(255, 240, 228, 228)),
                              ),
                            ),
                            child: TextField(
                              onChanged: (value) {
                                emailLogin = value;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.email),
                                  border: InputBorder.none,
                                  hintText: "email or Phone number",
                                  hintStyle:
                                      TextStyle(color: Colors.grey[400])),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (value) {
                                passwordLogin = value;
                              },
                              obscureText: showpass,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Color.fromARGB(255, 85, 82, 82),
                                  ),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          showpass = !showpass;
                                        });
                                      },
                                      icon: Icon(showpass
                                          ? Icons.visibility_off
                                          : Icons.visibility)),
                                  border: InputBorder.none,
                                  hintText: "password",
                                  hintStyle:
                                      TextStyle(color: Colors.grey[400])),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                    2,
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFF760CFF),
                      ),
                      // child: Center(
                      child: TextButton(
                        // ElevatedButton(
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          // await db.insertData(emailLogin, passwordLogin);
                          // if (dataUsers.isNotEmpty)
                          if (emailLogin == null || passwordLogin == null) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                    'خطأ في تسجيل الدخول',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  content: const Text(
                                    'يجب ادخال الايميل أو رقم الهاتف و كلمة المرور. الرجاء المحاولة مرة أخرى.',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        'موافق',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else if ((emailLogin == "safwan@gmail.com" &&
                                  passwordLogin == "safwan@123") ||
                              (dataUsers == emailLogin &&
                                  dataUsers == passwordLogin)) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const MyHomePage(),
                              ),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                    'خطأ في تسجيل الدخول',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  content: const Text(
                                    'الايميل أو كلمة المرور غير صحيحة. الرجاء المحاولة مرة أخرى.',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        'موافق',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }

                          /* try {
                              await auth.createUserWithemailLoginAndpasswordLogin(
                                  emailLogin: emailLogin, passwordLogin: passwordLogin);
                            } catch (e) {
                              print(e);
                            } */
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeAnimation(
                      1.5,
                      Container(
                        margin: const EdgeInsets.only(
                          bottom: 30,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => SingUpScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Don't have an account? SignUp",
                            style: TextStyle(
                              fontFamily: "Mdntserrat",
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )),
                ])),
            // Text("Forgot passwordLogin?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)
            // ),
            // )
          ],
        ),
      )),
    );
  }
}
