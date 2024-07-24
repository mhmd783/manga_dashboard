import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/text_form_app.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/Login/dialog_login.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  ColorsApp colorsApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  DialogLogin dialogLogin = new DialogLogin();
  @override
  Widget build(BuildContext context) {
    return Consumer<control>(builder: (context, val, child) {
      return Scaffold(
        body: MediaQuery.of(context).size.width < 1000 ||
                MediaQuery.of(context).size.height < 600
            ? Container(
                child: Center(
                  child: Text("كبر حجم الشاشه"),
                ),
              )
            : Center(
          child:  Container(
            padding: EdgeInsets.all(10),
            height: 400,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 100.0, // soften the shadow
                  spreadRadius: 20.0, //extend the shadow
                  offset: Offset(
                    -20.0, // Move to right 5  horizontally
                    -20.0, // Move to bottom 5 Vertically
                  ),
                )
              ],
            ),
            child: Form(
              key: formstate,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  TextFormApp(
                      hintText: "ايميلك",
                      controll: val.api.email_admin,
                      keyboard: TextInputType.emailAddress),
                  TextFormApp(
                      hintText: "الرقم السري",
                      controll: val.api.password_admin,
                      keyboard: TextInputType.visiblePassword),
                  MaterialButton(
                    onPressed: () {
                      if (formstate.currentState!.validate()) {
                        val.Login();
                        dialogLogin.checkLogin(context);
                        print("validat");
                      } else {
                        print("not validat");
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      alignment: Alignment.center,
                      width: 100,
                      height: 45,
                      decoration: BoxDecoration(
                          color: colorsApp.color_button,
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "ارسال",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
