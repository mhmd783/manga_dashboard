import 'package:flutter/material.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:provider/provider.dart';

class DialogLogOut {
  ColorsApp colorApp = new ColorsApp();
  Future<void> logout(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<control>(builder: (context, val, child) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            scrollable: true,
            elevation: 10,
            content: Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: Image.asset("assets/images/mango.png"),
                    ),
                    Container(
                      height: 50,
                      width: 150,
                      child: Image.asset(
                        "assets/images/mangomedia.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        height: 1,
                        color: Colors.grey.shade300,
                        thickness: 2,
                        endIndent: 50,
                        indent: 50,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: Text(
                        "تسجيل الخروج",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
            actions: <Widget>[
              Consumer<control>(builder: (context, val, child) {
                return Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: colorApp.color_yellow_body,
                      ),
                      child: MaterialButton(
                        child: Text(
                          "تاكيد",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          val.Logout();
                          Navigator.of(context).pop();
                          Navigator.of(context).pushReplacementNamed("login");
                        },
                      ),
                    ),
                    Expanded(child: Container()),
                    Consumer<control>(builder: (context, val, child) {
                      return Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: colorApp.color_yellow_body,
                        ),
                        child: MaterialButton(
                          child: Text(
                            "الغاء",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      );
                    }),
                  ],
                );
              }),
            ],
          );
        });
      },
    );
  }
}
