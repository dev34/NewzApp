import 'package:flutter/material.dart';
import './pubg_widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                //for THE FUTURE
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    simpleField('Primer nombre'),
                    const SizedBox(height: 30),
                    simpleField('Apellido'),
                    const SizedBox(height: 30),
                    simpleField('Nombre de usuario'),
                    const SizedBox(height: 30),
                    simpleField('Email'),
                    const SizedBox(height: 30),
                    TextFormField(
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
                        Navigator.pushNamed(context, '/interest');
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
