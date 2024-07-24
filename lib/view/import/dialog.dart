import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/photo_profile.dart';
import 'package:mango_dash_board/companent/text_form_app.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:provider/provider.dart';

class DialogImport {
  ColorsApp colorsApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  Future<void> AddImport(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<control>(builder: (context, val, child) {
          return Form(
            key: formstate,
            child: AlertDialog(
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
                          alignment: Alignment.topRight,
                          child: Text("حدد نوع الوارد",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: colorsApp.color_blak_app))),
                      Container(
                        width: 400,
                        child: TextFormApp(
                            hintText: "حدد نوع الوارد",
                            controll: val.api.type_import,
                            keyboard: TextInputType.text),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          alignment: Alignment.topRight,
                          child: Text("حدد مبلغ الوارد",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: colorsApp.color_blak_app))),
                      Container(
                        width: 400,
                        child: TextFormAppInt(
                            hintText: "المبلغ",
                            controll: val.api.salary_import,
                            keyboard: TextInputType.text),
                      ),
                    ],
                  )),
              actions: <Widget>[
                Consumer<control>(builder: (context, val, child) {
                  return Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colorsApp.color_red_body,
                    ),
                    child: MaterialButton(
                      child: Text(
                        "ارسال",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                         if (formstate.currentState!
                                            .validate()) {
                                          val.AddImport();
                                          Navigator.of(context).pop();
                        CheckSendImport(context);
                                          print("validat");
                                        } else {
                                          print("not validat");
                                        }
                        
                        
                      },
                    ),
                  );
                })
              ],
            ),
          );
        });
      },
    );
  }

  ///
  Future<void> CheckSendImport(BuildContext context) async {
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
                      width: 100,
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
                        endIndent: 100,
                        indent: 100,
                      ),
                    ),
                    val.add_import == null
                        ? CircularProgressIndicator()
                        : Container(
                            child:
                                val.add_import['message'] ==
                                        "Paid Successfully"
                                    ? Text(
                                        "تم الارسال",
                                        style: TextStyle(
                                            color: colorsApp.color_grean_body,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        "خطاء",
                                        style: TextStyle(
                                            color: colorsApp.color_red_body,
                                            fontWeight: FontWeight.bold),
                                      ),
                          )
                  ],
                )),
            actions: <Widget>[
              Consumer<control>(builder: (context, val, child) {
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
                      "تم",
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
        });
      },
    );
  }
}
