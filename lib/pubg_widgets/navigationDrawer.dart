import 'package:flutter/material.dart';
import 'package:news_1st_app/constants.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
        child: Wrap(
          runSpacing: 40,
          children: [
            Text(
              'Seleccionar ubicación',
              style: TextStyle(
                  fontSize: 20, color: Colors.white, fontFamily: 'Roboto'),
            ),
            Text('Selecciona la zona horaria',
                style: TextStyle(
                    fontSize: 20, color: Colors.white, fontFamily: 'Roboto')),
            Text('Categorías',
                style: TextStyle(
                    fontSize: 20, color: Colors.white, fontFamily: 'Roboto')),
            Text('Perfil                     ',
                style: TextStyle(
                    fontSize: 20, color: Colors.white, fontFamily: 'Roboto')),
            Text('Cerrar sesión',
                style: TextStyle(
                    fontSize: 20, color: Colors.white, fontFamily: 'Roboto')),
          ],
        ),
      ),
    );
  }
}
