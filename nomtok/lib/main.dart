import 'package:flutter/material.dart';
import 'package:nomtok/constants/Sizes.dart';
import 'package:nomtok/features/auth/sign_up_screen.dart';

void main() {
  runApp(const TiktokApp());
}

class TiktokApp extends StatelessWidget {
  const TiktokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tictok clone',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        primaryColor: const Color.fromARGB(255, 238, 29, 82),
      ),
      home: const SignUpScreen(),
    );
  }
}
