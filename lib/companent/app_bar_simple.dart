import 'package:flutter/material.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:provider/provider.dart';

class AppBarAppSimple extends StatelessWidget {
  AppBarAppSimple({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorsApp colorsApp = new ColorsApp();
    return Consumer<control>(builder: (context, val, child) {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            CircleAvatar(
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.keyboard_arrow_left)),
            ),
            Expanded(child: Container()),
            //logo

            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [colorsApp.colorlogo1, colorsApp.colorlogo2],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30)),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white.withOpacity(0.0),
                child: Image.asset("assets/images/mango.png"),
              ),
            ),
            // pages app
          ],
        ),
      );
    });
  }
}
