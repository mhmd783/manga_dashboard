import 'package:flutter/material.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:provider/provider.dart';

class DrobDowenButtonApp extends StatelessWidget {
  DrobDowenButtonApp({
    super.key,
    required this.selectedValue,
    required this.dropdownItems,
  });

  late String selectedValue;

  final List<dynamic> dropdownItems;
  @override
  Widget build(BuildContext context) {
    return Consumer<control>(builder: (context, val, child) {
      return Container(
        margin: EdgeInsets.all(10),
        child: DropdownButtonFormField(
          validator: (value) {
            if (value == null) {
              return "empty";
            }
            return null;
          },

          menuMaxHeight: 200,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          dropdownColor: Colors.white,
          //value: selectedValue,
          hint: Text(selectedValue),
          onChanged: (value) {
            selectedValue = value!;
            val.api.selectedValue = value;
          },
          items: dropdownItems.map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      );
    });
  }
}
