import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './flash_screen.dart';
import './sign_in_page.dart';
import './sign_up_page.dart';
import './interest_page.dart';
import './home_page.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme:
            TextTheme(bodyText2: TextStyle(color: Colors.black, fontSize: 17)),
        fontFamily: 'Times new roman',
      ),
      initialRoute: '/',
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
