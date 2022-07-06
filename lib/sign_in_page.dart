import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool passwordVisible = false;
  bool? checkVisible = true;

  Login() async {
    final ProgressDialog loadingScreen = ProgressDialog(context: context);
    loadingScreen.show(max: 10, msg: 'Logging In...Plz Wait');
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then((value) async {
      await FirebaseFirestore.instance
          .collection('userData')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((DocumentSnapshot dataSnapshot) async {
        if (dataSnapshot.exists) {
          loadingScreen.close();
          CoolAlert.show(
              context: context,
              type: CoolAlertType.success,
              text: 'Not Failed Successfully');
        } else {
          loadingScreen.close();
          CoolAlert.show(
              context: context,
              type: CoolAlertType.error,
              text: 'Failed Successfully');
        }
      });
    }).onError((error, stackTrace) {
      loadingScreen.close();
      CoolAlert.show(
          context: context, type: CoolAlertType.error, text: error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'INICIAR SESIÓN',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: emailController,
                      style: const TextStyle(fontSize: 20, fontFamily: 'Arial'),
                      decoration: InputDecoration(
                        hintText: 'Nombre de usuario',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: passwordController,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Arial',
                      ),
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          color: Colors.black,
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                          icon: Icon(
                            passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        hintText: 'Contraseña',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              fillColor:
                                  MaterialStateProperty.all(Colors.black),
                              side: const BorderSide(
                                  color: Colors.black, width: 2),
                              checkColor: Colors.white,
                              value: checkVisible,
                              onChanged: (bool? checkState) {
                                setState(() {
                                  checkVisible = checkState;
                                });
                              },
                            ),
                            const Text(
                              'Recuérdame',
                              style:
                                  TextStyle(fontSize: 17, fontFamily: 'Roboto'),
                            ),
                          ],
                        ),
                        const Text(
                          'Olvidé mi contraseña?',
                          style: TextStyle(fontSize: 17, fontFamily: 'Roboto'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Login();
                          // Navigator.pushReplacementNamed(context, '/signin');
                        }
                        // Navigator.pushNamed(context, '/interest');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.grey[700],
                        ),
                        minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 55),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Inicia Session',
                        style: TextStyle(fontSize: 25, fontFamily: 'Roboto'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        '-----------------or-----------------',
                        style: TextStyle(fontSize: 23, fontFamily: 'Roboto'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.facebook,
                            size: 50,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.twitter,
                            size: 50,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.instagram,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                                fontFamily: 'Roboto', fontSize: 20),
                            children: [
                              const TextSpan(
                                  text: 'No tienes una cuenta?',
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                  text: ' Crear uno',
                                  style: TextStyle(color: Colors.grey.shade700))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
