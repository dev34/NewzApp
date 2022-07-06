import 'package:flutter/material.dart';

TextFormField simpleField(String hintText, String errorMessage, controller) {
  return TextFormField(
    controller: controller,
    validator: ((value) {
      if (value!.isEmpty) {
        return errorMessage;
      } else {
        return null;
      }
    }),
    style: const TextStyle(fontSize: 20, fontFamily: 'Arial'),
    decoration: InputDecoration(
      hintText: hintText,
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
  );
}

ElevatedButton interestButton({required String text}) {
  return ElevatedButton(
    onPressed: () {},
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 20, horizontal: 30)),
      backgroundColor: MaterialStateProperty.all(
        Colors.grey[700],
      ),
      // minimumSize: MaterialStateProperty.all(
      //   Size(width, 60),
      // ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    ),
    child: Text(
      text,
      style: const TextStyle(
          fontSize: 22, fontFamily: 'Roboto', fontWeight: FontWeight.normal),
    ),
  );
}
