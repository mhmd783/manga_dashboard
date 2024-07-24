import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormApp extends StatelessWidget {
  TextFormApp(
      {super.key,
      required this.hintText,
      required this.controll,
      required this.keyboard});
  final String hintText;
  final TextEditingController controll;
  final TextInputType keyboard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "empty";
          }
          return null;
        },
        textAlign: TextAlign.start,
        keyboardType: keyboard,
        controller: controll,
        decoration: InputDecoration(
          hintStyle: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 15,
              fontWeight: FontWeight.w300),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          hintText: hintText,
        ),
      ),
    );
  }
}

class TextFormAppInt extends StatelessWidget {
  TextFormAppInt(
      {super.key,
      required this.hintText,
      required this.controll,
      required this.keyboard});
  final String hintText;
  final TextEditingController controll;
  final TextInputType keyboard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "empty";
          }
          return null;
        },
        inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'\d')),
                    ],
        textAlign: TextAlign.start,
        keyboardType: keyboard,
        controller: controll,
        decoration: InputDecoration(
          hintStyle: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 15,
              fontWeight: FontWeight.w300),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          hintText: hintText,
        ),
      ),
    );
  }
}
