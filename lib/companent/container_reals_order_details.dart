import 'package:flutter/material.dart';

class ContainerRealsOrdersDetails extends StatelessWidget {
  ContainerRealsOrdersDetails(
      {super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "$title",
          style: TextStyle(color: Colors.blue),
        ),
        Container(
          margin: EdgeInsets.all(10),
          width: 300,
          alignment: Alignment.topRight,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black,
                  width: 1,
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignCenter),
              borderRadius: BorderRadius.circular(30)),
          child: Text(textAlign: TextAlign.right, "$subtitle"),
        )
      ],
    );
  }
}
