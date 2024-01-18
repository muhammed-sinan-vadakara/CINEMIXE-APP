import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cinemixe/feactures/authenthication/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class Splash1 extends StatefulWidget {
   static const routePath = '/splashscreen';
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // label: 'TextLiquidFill',
        // color: Colors.white,
        child: TextLiquidFill(
          waveDuration: const Duration(seconds: 1),
          loadDuration: const Duration(seconds: 5),
          text: 'COUNTER APP',
          waveColor: Colors.blueAccent,
          boxBackgroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
          boxHeight: 300,
        ),
      ),
    );
  }
}
