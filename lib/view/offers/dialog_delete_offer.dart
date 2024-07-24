import 'package:flutter/material.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:provider/provider.dart';

class DialogDeleteOffer {
  ColorsApp colorsApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  Future<void> DeleteOffer(BuildContext context, int id) async {
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
              // titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
              // title: Text('Verify'),
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
                      Text(
                        "هل تريد حزف العرض",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colorsApp.color_red_body),
                      )
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
                          color: colorsApp.color_yellow_body,
                        ),
                        child: MaterialButton(
                          child: Text(
                            "حذف",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            val.DeleteOffers(id);
                            Navigator.of(context).pop();
                            CheckDeleteOffer(context);
                          },
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          );
        });
      },
    );
  }

  Future<void> CheckDeleteOffer(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<control>(builder: (context, val, child) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,

            scrollable: true,
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            title: Text("تحقق"),
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
                    val.delete_offer == null
                        ? CircularProgressIndicator()
                        : Container(
                            child: val.delete_offer['message'] ==
                                    "Offer deleted successfully."
                                ? Text(
                                    "تم الحزف",
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
