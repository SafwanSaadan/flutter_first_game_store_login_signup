// import 'package:first/screen/sing_up.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class  LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
   
//    @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
// class  _LoginScreenState  extends  State<LoginScreen> {
//     double screenHeight =0;
//   double screenWidth =0;
//    @override
//   Widget build(BuildContext context) {
//      screenHeight = MediaQuery.of(context).size.height;
//     screenWidth  = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 32, 145, 197),
//      body: SizedBox(
//        height: screenHeight,
//        width: screenWidth,
//        child: Stack(
//          children: [
//             Align(
//           alignment: Alignment.topCenter,
//           child: Padding(
//             padding: EdgeInsets.only(
//               top: screenHeight/8,
//             ),
//             child: Text(
//             "LOGIN",
//             style: TextStyle(
//               fontFamily: "Montserrat",
//               fontSize: screenWidth/10,
//               fontWeight: FontWeight.w700,
//               color: Colors.white
//             ),
//           ),
//           ),
//         ),
//        square(-30, 0.12),
//        square(-10, 0.3),
//        square(10, 0.1),
//         Align(alignment: Alignment.bottomCenter,
//          child:Container(
//          height: screenHeight /2,
//          width: screenWidth,
//            color: Colors.white,
//            padding: EdgeInsets.symmetric(
//              horizontal: screenWidth/12,
//            ),
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: [
//                Column(
//                  children: [
//                    textField("Email",Icons.email_outlined, false),
//                    textField("Password",Icons.lock_outlined, true),
                     
                   
//                  ],
//                ),
//                Column(
//                  children: [
//                    Container(
//                      width: screenWidth,
//                      height: 50,
//                      margin: const EdgeInsets.only(
//                        bottom: 4,
//                      ),
//                      decoration: BoxDecoration(
//                        color: Colors.lightBlueAccent,
//                        borderRadius: BorderRadius.circular(50),
//                      ),
//                      child: const Center(
//                        child: Text(
//                          "LOGIN",
//                          style: TextStyle(
//                            fontFamily: "Mdntserrat",
//                            color: Colors.white,
//                            letterSpacing: 1.5,
//                            fontWeight: FontWeight.w700
//                          ),
//                        ),
//                      ),
//                    ),
//                  Container(
//                    margin: const EdgeInsets.only(
//                      bottom: 30,
//                    ),
//                    child: GestureDetector(
//                      onTap: (){
//                        Navigator.of(context).pushReplacement(
//                          MaterialPageRoute(
//                            builder:(context) => const SingUpScreen(),
//                          ),
//                        );
//                      },
                  
//                   child: const  Text(
//                      "Don't have an account? Login",
//                      style: TextStyle(
//                            fontFamily: "Mdntserrat",
//                            color: Colors.black54,
//                            fontSize: 12,
                           
//                          ),
//                    ),
//                  ),
//                   ), ],
//                )
//              ],
//            ),
//          ),
//          ),
//          ],
//        ),
//      ),
//     );
// }
// Widget textField(String hint, IconData icon,bool password){
//   return Container(
//     margin:const EdgeInsets.only(
//       bottom: 16,
//     ),
//     child:
//    TextFormField(
//     obscureText: password,
//                      decoration: InputDecoration(
//                      hintText:hint,
//                      hintStyle: const TextStyle(
//                        fontSize: 14,
//                      ),
//                      enabledBorder: const UnderlineInputBorder(
//                        borderSide: BorderSide(
//                          color: Colors.lightBlueAccent,
//                        ),
//                      ),
//                      focusedBorder: const UnderlineInputBorder(
//                        borderSide:  BorderSide(
//                          color: Colors.lightBlueAccent,
//                        ),
//                      ),
//                     prefixIcon: Icon(
//                       icon,
//                       color: Colors.black26,
//                     ),
//                     contentPadding: const EdgeInsets.only(
//                       top: 14,
//                     ),
//                    ),
//   ),
//   );
// }
// Widget square(double y, double opacity){
//   return Center(

//           child: Transform.translate(offset:Offset(screenWidth / 30, y),

//           child: 
//           Transform.rotate(angle: -0.4,

//           child: Container(
//             height: screenHeight / 3,

//             decoration: BoxDecoration(color: Colors.white.withOpacity(0.3),
//             borderRadius: BorderRadius.circular(55),

//             ),
//           ),
//           ),
//           ),
//          );
// }
 
// }
