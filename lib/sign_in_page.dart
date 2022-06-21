import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25, top: 186),
        child: Column(
          children: const [
            Text(
              'INICIAR SESIÓN',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
