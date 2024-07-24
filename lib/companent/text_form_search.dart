import 'package:flutter/material.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:provider/provider.dart';

class TextFormAppSearch extends StatelessWidget {
  TextFormAppSearch(
      {super.key,
      required this.hintText,
      required this.controll,
      required this.icon,
      required this.keyboard});
  final String hintText;
  final Widget icon;
  final TextEditingController controll;
  final TextInputType keyboard;

  @override
  Widget build(BuildContext context) {
    return Consumer<control>(builder: (context, val, child) {
      return TextFormField(
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
        suffixIcon: icon,
        hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 15,
            fontWeight: FontWeight.w300),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: hintText,
      ),
    );});
  }
}
