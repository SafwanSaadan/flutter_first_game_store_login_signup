// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:login_signup_sqflite/model/card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    this.title,
  });
  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  double screenHeight = 0;
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context)
        .size
        .height; //  باخذ مساحه الشاشة كامل sizedBox للسماح ل
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 43, 7, 109),
        // backgroundColor: Color(0xFFFAFAFA),
        elevation: 0.0,
        centerTitle: true,

        title: const Text(
          "Game Store",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          gradient: const LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 23, 2, 80),
              Color.fromARGB(255, 230, 24, 195),
            ],
          ),
        ),
        child: Stack(
          children: [
            ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  child: ClipRRect(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        gradient: const LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 23, 2, 80),
                            Color.fromARGB(255, 230, 24, 195),
                          ],
                        ),
                      ),

                      //  child: SizedBox(width: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 100),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                const SizedBox(width: 20),
                                CardItem().listCard(0),
                                const SizedBox(width: 20),
                                CardItem().listCard(1),
                                const SizedBox(width: 20),
                                CardItem().listCard(2),
                                const SizedBox(width: 20),
                                CardItem().listCard(3),
                                const SizedBox(width: 20),
                                CardItem().listCard(4),
                                const SizedBox(width: 20),
                                CardItem().listCard(5),
                              ],
                            ),
                          ),
                          const SizedBox(width: 100),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                const SizedBox(width: 20),
                                CardItem().listCard(0),
                                const SizedBox(width: 20),
                                CardItem().listCard(1),
                                const SizedBox(width: 20),
                                CardItem().listCard(2),
                                const SizedBox(width: 20),
                                CardItem().listCard(3),
                                const SizedBox(width: 20),
                                CardItem().listCard(4),
                                const SizedBox(width: 20),
                                CardItem().listCard(5),
                              ],
                            ),
                          ),
                          const SizedBox(width: 100),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                const SizedBox(width: 20),
                                CardItem().listCard(0),
                                const SizedBox(width: 20),
                                CardItem().listCard(1),
                                const SizedBox(width: 20),
                                CardItem().listCard(2),
                                const SizedBox(width: 20),
                                CardItem().listCard(3),
                                const SizedBox(width: 20),
                                CardItem().listCard(4),
                                const SizedBox(width: 20),
                                CardItem().listCard(5),
                                const SizedBox(width: 20),
                                CardItem().listCard(6),
                                const SizedBox(width: 20),
                                CardItem().listCard(7),
                                const SizedBox(width: 20),
                                CardItem().listCard(8),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                const SizedBox(width: 20),
                                CardItem().listCard(0),
                                const SizedBox(width: 20),
                                CardItem().listCard(1),
                                const SizedBox(width: 20),
                                CardItem().listCard(2),
                                const SizedBox(width: 20),
                                CardItem().listCard(3),
                                const SizedBox(width: 20),
                                CardItem().listCard(4),
                                const SizedBox(width: 20),
                                CardItem().listCard(5),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                const SizedBox(width: 20),
                                CardItem().listCard(0),
                                const SizedBox(width: 20),
                                CardItem().listCard(1),
                                const SizedBox(width: 20),
                                CardItem().listCard(2),
                                const SizedBox(width: 20),
                                CardItem().listCard(3),
                                const SizedBox(width: 20),
                                CardItem().listCard(4),
                                const SizedBox(width: 20),
                                CardItem().listCard(5),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(bottom: bottomNavBarHeight),
                //   child: bodyContainer(),
                // ),
                // Align(alignment: Alignment.bottomCenter, child: bottomNav()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
