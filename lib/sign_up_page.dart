import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import './pubg_widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //EVERYTHING HERE

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Register() async {
    final ProgressDialog loadingScreen = ProgressDialog(context: context);
    loadingScreen.show(max: 10, msg: 'Registering...Plz Wait');
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then((value) async {
      loadingScreen.close();
      await FirebaseFirestore.instance
          .collection('userData')
          .doc(value.user!.uid)
          .set({
        'firstName': firstNameController.text.trim(),
        'lastName': lastNameController.text.trim(),
        'userName': usernameController.text.trim(),
        'email': emailController.text.trim(),
        'password': passwordController.text.trim()
      }); // NOT TERRIBLE NAME
    }).onError((error, stackTrace) {
      loadingScreen.close();
      CoolAlert.show(
          context: context, type: CoolAlertType.error, text: error.toString());
    });
    //;
  }

  bool passwordVisible = false;
  bool passwordVisible2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 75),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ÚNETE',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Form(
                key: formKey, //DA FILLED_OR_NOT + VALIDATION(BOO)
                //for THE PRESENT
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    simpleField('First Name', 'Plz enter your first name',
                        firstNameController),
                    const SizedBox(height: 30),
                    simpleField('Last Name', 'Plz enter your second name',
                        lastNameController),
                    const SizedBox(height: 30),
                    simpleField('Username', 'Plz enter your username',
                        usernameController),
                    const SizedBox(height: 30),
                    simpleField('Email', 'Plz enter an email', emailController),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: passwordController,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'Plz enter a password';
                        } else {
                          return null;
                        }
                      }),
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Arial',
                      ),
                      obscureText: passwordVisible2,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          color: Colors.black,
                          onPressed: () {
                            setState(() {
                              passwordVisible2 = !passwordVisible2;
                            });
                          },
                          icon: Icon(
                            passwordVisible2
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        hintText: 'Confirmar Contraseña',
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
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Register();
                          // Navigator.pushReplacementNamed(context, '/signin');
                        }
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
                        'Únete',
                        style: TextStyle(fontSize: 25, fontFamily: 'Roboto'),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/signin', (rroute) => false);
                        },
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                                fontFamily: 'Roboto', fontSize: 20),
                            children: [
                              const TextSpan(
                                  text: 'Ya tienes una cuenta?',
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                  text: ' Inicia sesión',
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
