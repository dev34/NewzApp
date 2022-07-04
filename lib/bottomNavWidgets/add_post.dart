import 'package:flutter/material.dart';
import 'package:news_1st_app/constants.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  String dropdownvalue = 'Estilo de vida';

  // List of items in our dropdown menu
  var items = [
    'Estilo de vida',
    'B',
    'C',
    'D',
    'E',
    'F',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    padding: const EdgeInsets.only(right: 20),
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_circle,
                      color: primaryColor,
                      size: 35,
                    )),
                const Text(
                  'Agregar una Publicación',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'De qué quieres hablar?',
                  style: TextStyle(fontFamily: 'Roboto'),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1.5,
                          color: Colors.grey,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                  ),
                  child: DropdownButton(
                    underline: const SizedBox.shrink(),
                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              style: const TextStyle(fontSize: 20, fontFamily: 'Roboto'),
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                hintText: 'Título',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextFormField(
              maxLines: 10,
              style: const TextStyle(fontSize: 20, fontFamily: 'Roboto'),
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                hintText: 'Escriba aquí',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                IconButton(
                    padding: const EdgeInsets.only(right: 20),
                    onPressed: () {},
                    icon: const Icon(Icons.add_box_outlined)),
                const Text(
                  'Agregar contenido de imagen/video/audio',
                  style: TextStyle(fontFamily: 'Roboto'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                side: const BorderSide(
                  color: Colors.grey,
                  style: BorderStyle.solid,
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              child: const Text('Publicar ahora',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500)),
              onPressed: () {},
            ),
            const SizedBox(height: 15),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                side: const BorderSide(
                  color: Colors.grey,
                  style: BorderStyle.solid,
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              child: const Text('Guardar como borrador',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal)),
              onPressed: () {},
            ),
            const SizedBox(height: 30),
            const Text(
              'Tenga en cuenta que este contenido estará sujeto a verificación por cualquier violación de nuestros Términos y condiciones',
              style: TextStyle(fontFamily: 'Roboto'),
            )
          ],
        ),
      ),
    );
  }
}
