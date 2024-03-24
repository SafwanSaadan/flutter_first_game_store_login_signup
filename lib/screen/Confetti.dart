// ignore_for_file: file_names
// import 'package:flutter/material.dart';

// class _MainPageState extends State<MainPage>{
  // bool isPlaying = false;
  // final controller = confettiController();

  // @override
  // void initState(){
  //   super.initState();
  //   controller.play();
  // }



  // @override
  // void dispose(){
  //   controller.dispose();

  //   super.dispose();
  // }


  // @override Widget build(BuildContext context) =>Stack(
  //   alignment: Alignment.center,
  // )
    // child: Text(isPlaying ? 'stop ': 'Celebrate'),
    // onPressed: (){
    //   if (isPlaying){
    //     controller.stop();
    //   }else{
    //     controller.play();
    //   }
    // }
  
//  ConfettWidget(
//   cnfettiController: controller,
//   shouldLoop:true,

  // blastDirection: blastDirectionlity.explosive,  //من كل الاتجاهات يطلق
  // -pi /2,
  // emissionFrequency: 0.00,  //يتحكم بكثافه الاطلاق اكبر شي1.0 واصغر شي 0.0
  // number0fParticles: 20,

  // minBlastForce:10,   //تتحكم بقوه الانفجار
  // maxBlastForce:100,

  // gravity:0.2,   //تجعله يتساقط مثل الثلج

  // colors: const[
  //   Colors.red,              //تتحكم بالاوان القطع الذي تنزل
  //   Colors.green,
  //   Colors.yellow,
  //   Colors.blue,
  //   Colors.purpleAccent,
  // ],


  // path.add0val(Rect.fromCircle(
  //   center:0ffset.ziro,           //تغير شكل الاشكل الئ دائريه
  //   radius:10,
  // ),),
//  ),

  //  Container(
  //                   width: 100,
  //               //  height: 3,
  //               child:Stack(children: [
  //                  Align(
  //            alignment: Alignment.topRight,
  //            child: ElevatedButton(
  //             onPressed: (){
  //               _confettiController.play();
  //             },
  //             child: const Text('star'),
  //            ),
  //            ),
  //            Align(
  //            alignment: Alignment.topRight,
  //            child: ConfettiWidget(
  //             confettiController: _confettiController,
  //             blastDirection: -pi /2,
  //             emissionFrequency: 0.02,
  //            ),
  //            ),
  //             // Text("    Paid Game", style: TextStyle(color: Colors.white),),
  //             ] ,),),