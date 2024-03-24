//   import 'package:flutter/material.dart';
//   bool switchValue = false;
//   int selectedPos = 0;
//   double screenHeight = 0;
//   double screenWidth = 0;
//   double bottomNavBarHeight = 60;

// Widget bodyContainer() {
//     // Color? selectedColor = tabItems[selectedPos].circleColor;
//     // String slogan;
//     switch (selectedPos) {
//       case 0:
//         // onPressed:(){
//         //   Navigator.push(context,
//         //   MaterialPageRoute(builder:(context) => MyApp()),);
//         // };

//         // slogan="";
//         break;
//       case 1:
//         // slogan = "Find, Check, Use";
//         break;
//       case 2:
//         // slogan = "Receive, Review, Rip";
//         break;
//       case 3:
//         // slogan = "Noise, Panic, Ignore";
//         break;
//       default:
//         // slogan = "gg";
//         break;
//     }

//     return GestureDetector(
//         // child: Container(
//         //   width: double.infinity,
//         //   height: double.infinity,
//         //   color: selectedColor,
//         //   child:  Center(
//         //     child: Text("j",
//         //       semanticsLabel:
//         //       //  slogan,

//         //       style: TextStyle(
//         //         color: Colors.white,
//         //         fontWeight: FontWeight.bold,
//         //         fontSize: 20,
//         //       ),
//         //     ),
//         //   ),
//         // ),
//         // onTap: () {
//         //   if (_navigationController.value == tabItems.length - 1) {
//         //     _navigationController.value = 0;
//         //   } else {
//         //     _navigationController.value = _navigationController.value! + 1;
//         //   }
//         // }
//         );
//   }

//   Widget bottomNav() {
//     return CircularBottomNavigation(
//       tabItems,
//       controller: _navigationController,
//       selectedPos: selectedPos,
//       barHeight: bottomNavBarHeight,
//       // use either barBackgroundColor or barBackgroundGradient to have a gradient on bar background
//       barBackgroundColor: Color.fromARGB(255, 137, 9, 212),
//       // barBackgroundGradient: LinearGradient(
//       //   begin: Alignment.bottomCenter,
//       //   end: Alignment.topCenter,
//       //   colors: [
//       //     Colors.blue,
//       //     Colors.red,
//       //   ],
//       // ),
//       backgroundBoxShadow: <BoxShadow>[
//         BoxShadow(color: Colors.black45, blurRadius: 10.0),
//       ],
//       animationDuration: Duration(milliseconds: 300),
//       selectedCallback: (int? selectedPos) {
//         setState(() {
//           this.selectedPos = selectedPos ?? 0;
//           print(_navigationController.value);
//         });
//       },
//     );
//   }

//   // @override
//   // void dispose() {
//   //   super.dispose();
//   //   _navigationController.dispose();
//   // }
