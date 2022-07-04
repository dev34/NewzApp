import 'package:flutter/material.dart';
import 'package:news_1st_app/constants.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Mi perfil',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Roboto'),
                ),
                const SizedBox(height: 20),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.asset(
                        'images/bluh.png',
                        width: screenSize.width / 2,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(190, 189, 189, 189),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                              topLeft: Radius.circular(10))),
                      child: IconButton(
                          color: primaryColor,
                          onPressed: () {},
                          icon: const Icon(Icons.edit_outlined)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Sergio Busquets',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
                const SizedBox(height: 10),
                const Text('@Sergio 272'),
                const SizedBox(height: 10),
                const Text('Fecha de Registro: Mayo 24 2022'),
                const SizedBox(height: 10),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(30, 42),
                    side: const BorderSide(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text('Editar',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal)),
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      width: screenSize.width / 4 - 10,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 25),
                      child: Column(
                        children: const [
                          Text(
                            '4',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Publicaciones',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      width: screenSize.width / 4 - 10,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 25),
                      child: Column(
                        children: const [
                          Text(
                            '34',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Borradores',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      width: screenSize.width / 4 - 10,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 25),
                      child: Column(
                        children: const [
                          Text(
                            '24',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Siguiente',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      width: screenSize.width / 4 - 10,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 25),
                      child: Column(
                        children: const [
                          Text(
                            '6',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Seguidores',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.5)),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Cartas credenciales',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 18)),
                      IconButton(
                          iconSize: 26,
                          color: primaryColor,
                          onPressed: () {},
                          icon: const Icon(Icons.edit_outlined)),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 190,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.5)),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Icon(color: primaryColor, Icons.wallet_travel),
                        const SizedBox(width: 5),
                        const Text('Agregar estado de empleo',
                            style: TextStyle(fontFamily: 'Roboto'))
                      ]),
                      Row(children: [
                        Icon(color: primaryColor, Icons.school),
                        const SizedBox(width: 5),
                        const Text('Agregar estado educativo',
                            style: TextStyle(fontFamily: 'Roboto'))
                      ]),
                      Row(children: [
                        Icon(color: primaryColor, Icons.map),
                        const SizedBox(width: 5),
                        const Text('Agregar estado civil',
                            style: TextStyle(fontFamily: 'Roboto'))
                      ]),
                      Row(
                        children: [
                          Icon(color: primaryColor, Icons.location_on),
                          const SizedBox(width: 5),
                          const Text('Agregar direccion',
                              style: TextStyle(fontFamily: 'Roboto'))
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      TextField(
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            hintText: 'Soporte comunitario',
                            hintStyle: TextStyle(
                                color: primaryColor, fontFamily: 'Roboto')),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            hintText: 'Cerrar sesión',
                            hintStyle: TextStyle(
                                color: primaryColor, fontFamily: 'Roboto')),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
