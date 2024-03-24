// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:js';

import 'package:flutter/material.dart';

import '../screen/end.dart';

class CardItem {
  List<Map<String, dynamic>> card = [
    {
      'image': 1,
      'text': 'flower',
    },
    {
      'image': 2,
      'text': 'flower',
    },
    {
      'image': 3,
      'text': 'flower',
    },
    {
      'image': 4,
      'text': 'flower',
    },
    {
      'image': 5,
      'text': 'flower',
    },
    {
      'image': 6,
      'text': 'flower',
    },
    {
      'image': 7,
      'text': 'flower',
    },
    {
      'image': 8,
      'text': 'flower',
    },
    {
      'image': 9,
      'text': 'flower',
    },
    {
      'image': 10,
      'text': 'flower',
    },
    {
      'image': 11,
      'text': 'flower',
    },
    {
      'image': 12,
      'text': 'flower',
    },
    {
      'image': 13,
      'text': 'flower',
    },
    {
      'image': 14,
      'text': 'flower',
    },
  ];

  Widget listCard(int i) {
    return Container(
      width: 115,
      height: 145,
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(35.0),
            bottomStart: Radius.circular(35.0)),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context as BuildContext).pushReplacement(
            MaterialPageRoute(builder: (context) => const EndScreen()),
          );
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset("images/${card[i]['image']}.png"),
            Container(
              width: 98,
              color: const Color.fromARGB(255, 252, 251, 251).withOpacity(.3),
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                "${card[i]['text']}",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
