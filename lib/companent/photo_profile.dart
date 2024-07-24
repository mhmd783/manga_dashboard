import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/text_form_search.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:provider/provider.dart';

class PhotoProfile extends StatelessWidget {
  PhotoProfile({super.key, required this.imagefile});
  
  final File? imagefile;
  @override
  Widget build(BuildContext context) {
    ColorsApp colorsApp = new ColorsApp();
    return Consumer<control>(builder: (context, val, child) {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black,
                width: 1,
                style: BorderStyle.solid,
                strokeAlign: BorderSide.strokeAlignCenter),
            borderRadius: BorderRadius.circular(50)),
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey.shade400,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child: Container(
                height: 70,
                width: 70,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: imagefile == null 
                        ? Icon(Icons.person_2_outlined)
                        : Image.file(
                            imagefile!,
                            fit: BoxFit.cover,
                          )),
              ),
            ),
          ),
        ),
      );
    });
  }
}
