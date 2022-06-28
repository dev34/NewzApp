import 'package:flutter/material.dart';
import './flash_screen.dart';
import './sign_in_page.dart';
import './sign_up_page.dart';
import './interest_page.dart';
import './home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Times new roman',
      ),
      initialRoute: '/home',
      routes: {
        '/': (context) => const FlashScreen(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/interest': (context) => const InterestPage(),
        '/home': (context) => const HomePage(),
      },
      title: 'Dzuabry',
    ),
  );
}
