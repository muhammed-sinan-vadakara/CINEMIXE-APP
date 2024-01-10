import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 2,
            ),
            Transform.translate(
              offset: Offset(MediaQuery.sizeOf(context).width * 0.8, 1),
              child: Transform(
                transform: Matrix4.identity()
                  ..rotateZ(pi * -0.15)
                  ..rotateY(100),
                child: Container(
                  color: Colors.black,
                  height: 130,
                  width: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// https://dribbble.com/shots/23385406-Sign-Up-Login-UI-for-Android-phones