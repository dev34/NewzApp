import 'package:flutter/material.dart';

class FlashScreen extends StatelessWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/flash_screen.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 47, right: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      height: 1.37,
                      fontWeight: FontWeight.normal,
                    ),
                    children: [
                      TextSpan(
                          text:
                              'Obtén todas las novedades y actualizaciones que quieras desde el compafot de tu hogarcon '),
                      TextSpan(
                        text: 'Dzuabry',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 32,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    )),
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(96, 88, 88, 1),
                    ),
                    minimumSize: MaterialStateProperty.all(
                      const Size(160, 67),
                    ),
                  ),
                  child: const Text(
                    'Proceder',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
