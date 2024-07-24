import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/photo_profile.dart';
import 'package:mango_dash_board/companent/text_form_app.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:provider/provider.dart';

class DialogSupscription {
  ColorsApp colorsApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  Future<void> InSurePaySupscription(
      BuildContext context, String id_user_sub, String subscription_id) async {
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
                          alignment: Alignment.center,
                          child: Text("تاكبد السداد",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: colorsApp.color_grean_body))),
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
                        "رجوع",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  );
                }),
                SizedBox(
                  width: 70,
                ),
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
                        "تاكيد",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        val.PaySub(id_user_sub, subscription_id);
                        Navigator.of(context).pop();
                        CheckPaySupscription(context);
                      },
                    ),
                  );
                }),
              ],
            ),
          );
        });
      },
    );
  }

  ///
  Future<void> CheckPaySupscription(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<control>(builder: (context, val, child) {
          return AlertDialog(
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
                    val.pay_sub == null
                        ? CircularProgressIndicator()
                        : Container(
                            child: val.pay_sub['message'] ==
                                    "Subscription is active now"
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

  Future<void> SendNotificatioToUserForRemperPaySupscription(
      BuildContext context, int id_user) async {
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
                          alignment: Alignment.center,
                          child: Text("تاكيد ارسال الاشعار ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: colorsApp.color_grean_body))),
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
                        "رجوع",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  );
                }),
                SizedBox(
                  width: 70,
                ),
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
                        "تاكيد",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        val.SendNotiToSubNotPay(id_user);
                        Navigator.of(context).pop();
                        CheckSendNotificatioToUserForRemperPaySupscription(
                            context);
                      },
                    ),
                  );
                }),
              ],
            ),
          );
        });
      },
    );
  }

  Future<void> CheckSendNotificatioToUserForRemperPaySupscription(
      BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<control>(builder: (context, val, child) {
          return AlertDialog(
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
                    val.send_noti_sub_notpay == null
                        ? CircularProgressIndicator()
                        : Container(
                            child:
                                val.send_noti_sub_notpay['message'] ==
                                        "Notification has been sent"
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
