import 'dart:math';

import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 2,
          ),
          Transform.translate(
            offset: Offset(MediaQuery.sizeOf(context).width * 0.8, 1),
            child: Transform(
              transform: Matrix4.identity()
                ..rotateZ(pi * -0.08)
                ..rotateY(101),
              child: Container(
                color: Colors.black,
                height: 140,
                width: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
