import 'package:cinemixe/feactures/authenthication/presentation/pages/login_page.dart';
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
        theme: ref.watch(lightThemeProvider),
        home: Loginpage());
  }
}




// https://dribbble.com/shots/23385406-Sign-Up-Login-UI-for-Android-phones