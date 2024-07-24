import 'package:flutter/material.dart';
import 'package:mango_dash_board/companent/text_form_app.dart';

class ContainerAddEmployee extends StatelessWidget {
  ContainerAddEmployee(
      {super.key, required this.title,required this.hintText,
      required this.controll,
      required this.keyboard});
  final String title;
  final String hintText;
  final TextEditingController controll;
  final TextInputType keyboard;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "$title",
          style: TextStyle(color: Colors.blue),
        ),
        TextFormApp(hintText:hintText, controll:controll, keyboard:keyboard)
      ],
    );
  }
}
class ContainerAddEmployeeInt extends StatelessWidget {
  ContainerAddEmployeeInt(
      {super.key, required this.title,required this.hintText,
      required this.controll,
      required this.keyboard});
  final String title;
  final String hintText;
  final TextEditingController controll;
  final TextInputType keyboard;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "$title",
          style: TextStyle(color: Colors.blue),
        ),
        TextFormAppInt(hintText:hintText, controll:controll, keyboard:keyboard)
      ],
    );
  }
}
