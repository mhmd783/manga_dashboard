import 'package:flutter/material.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:provider/provider.dart';

class DialogLogin {
  ColorsApp colorsApp = new ColorsApp();
  Future<void> checkLogin(BuildContext context) async {
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
                      height: 40,
                      width: 40,
                      child: Image.asset("assets/images/mango.png"),
                    ),
                    Container(
                      height: 50,
                      width: 120,
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
                        child: val.login == null
                            ? CircularProgressIndicator(
                                color: colorsApp.color_yellow_body,
                              )
                            : val.login['message'] ==
                                    "Admin Logged In Successfully"
                                ? Text("تم التحقق",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: colorsApp.color_grean_body))
                                : Text("خطاء",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red))),
                  ],
                )),
            actions: <Widget>[
              val.login == null
                  ? Consumer<control>(builder: (context, val, child) {
                      return MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: colorsApp.color_yellow_body,
                          ),
                          child: Text(
                            "رجوع",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    })
                  : val.login['message'] == "Admin Logged In Successfully"
                      ? Consumer<control>(builder: (context, val, child) {
                          return Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colorsApp.color_yellow_body,
                            ),
                            child: MaterialButton(
                              child: Text(
                                "دخول",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pushReplacementNamed("home");

                              },
                            ),
                          );
                        })
                      : Consumer<control>(builder: (context, val, child) {
                          return Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colorsApp.color_yellow_body,
                            ),
                            child: MaterialButton(
                              child: Text(
                                "رجوع",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          );
                        }),
            ],
          );
        });
      },
    );
  }
}
