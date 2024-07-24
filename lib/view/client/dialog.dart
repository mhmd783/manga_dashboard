import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/text_form_app.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:provider/provider.dart';

class DialogClient {
  ColorsApp colorsApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  Future<void> SendMessage(BuildContext context) async {
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
                          child: Text("اكتب رساله",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: colorsApp.color_grean_body))),
                      TextFormApp(
                          hintText: "اكتب رساله",
                          controll: val.api.message,
                          keyboard: TextInputType.text),
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
                        if (formstate.currentState!.validate()) {
                          val.SendNotificationToUser();

                          Navigator.of(context).pop();
                          CheckSendNotificationToUser(context);
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
  Future<void> CheckSendNotificationToUser(BuildContext context) async {
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
                    val.send_notification_to_all_users == null
                        ? CircularProgressIndicator()
                        : Container(
                            child:
                                val.send_notification_to_all_users['message'] ==
                                        "Notification has been sent"
                                    ? Text(
                                        "تم الارسال",
                                        style: TextStyle(
                                            color: colorsApp.color_grean_body,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : val.send_notification_to_all_users[
                                                'message'] ==
                                            "User App not found"
                                        ? Text(
                                            "لقد الغا المستخدم تثبيت التطبيق",
                                            style: TextStyle(
                                                color: colorsApp.color_red_body,
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

  Future<void> CheckConvertUserToOld(BuildContext context) async {
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
                    val.convert_user_to_old == null
                        ? CircularProgressIndicator()
                        : Container(
                            child: val.convert_user_to_old['message'] ==
                                    "User status changed successfully."
                                ? Text(
                                    "تم الارسال",
                                    style: TextStyle(
                                        color: colorsApp.color_grean_body,
                                        fontWeight: FontWeight.bold),
                                  )
                                : val.send_notification_to_all_users[
                                            'message'] ==
                                        "User App not found"
                                    ? Text(
                                        "لقد الغا المستخدم تثبيت التطبيق",
                                        style: TextStyle(
                                            color: colorsApp.color_red_body,
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

  //add sup
  Future<void> AddSupscription(BuildContext context) async {
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
                      Container(
                          width: 400,
                          child: TextFormApp(
                              hintText: "عنوان العرض",
                              controll: val.api.title_sub,
                              keyboard: TextInputType.text)),
                      Container(
                        width: 400,
                        child: TextFormApp(
                            hintText: "وصف العرض",
                            controll: val.api.description_sub,
                            keyboard: TextInputType.text),
                      ),
                      Container(
                        width: 400,
                        child: TextFormAppInt(
                            hintText: "سعر الاشتراك الشهري",
                            controll: val.api.price_sub,
                            keyboard: TextInputType.text),
                      ),
                      Container(
                        width: 400,
                        child: TextFormAppInt(
                            hintText: "عدد فديوهات الاشتراك",
                            controll: val.api.number_realse_sub,
                            keyboard: TextInputType.text),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("يشمل الحملات بلا حدود"),
                          Checkbox(
                              activeColor: colorsApp.color_grean_body,
                              value: val.choseCampaignsup ,
                              onChanged: (value) {
                                val.choseCampaignforSub(value!);
                              }),
                        ],
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
                          color: colorsApp.color_yellow_body,
                        ),
                        child: MaterialButton(
                          child: Text(
                            "ارسال",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            if (formstate.currentState!.validate()) {
                              val.AddSub();
                              Navigator.of(context).pop();
                              CheckSupscription(context);
                              print("validat");
                            } else {
                              print("not validat");
                            }
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

  Future<void> CheckSupscription(BuildContext context) async {
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
                    val.add_sub == null
                        ? CircularProgressIndicator()
                        : Container(
                            child: val.add_sub['message'] ==
                                    "Subscription added successfully."
                                ? Text(
                                    //User has subscriptions.
                                    "تم الارسال",
                                    style: TextStyle(
                                        color: colorsApp.color_grean_body,
                                        fontWeight: FontWeight.bold),
                                  )
                                : val.add_sub['message'] ==
                                        "User has subscriptions."
                                    ? Text(
                                        "خطاء هذا المستخدم مشترك بالفعل يجب ان يلغي اشتراكه القديم",
                                        style: TextStyle(
                                            color: colorsApp.color_red_body,
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
  //edit sub
  Future<void> EditSub(BuildContext context,int id_sub) async {
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
                      Container(
                          width: 400,
                          child: TextFormApp(
                              hintText: "عنوان العرض",
                              controll: val.api.title_sub_edit,
                              keyboard: TextInputType.text)),
                      Container(
                        width: 400,
                        child: TextFormApp(
                            hintText: "وصف العرض",
                            controll: val.api.description_sub_edit,
                            keyboard: TextInputType.text),
                      ),
                      Container(
                        width: 400,
                        child: TextFormAppInt(
                            hintText: "سعر الاشتراك الشهري",
                            controll: val.api.price_sub_edit,
                            keyboard: TextInputType.text),
                      ),
                      Container(
                        width: 400,
                        child: TextFormAppInt(
                            hintText: "عدد فديوهات الاشتراك",
                            controll: val.api.number_realse_sub_edit,
                            keyboard: TextInputType.text),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("يشمل الحملات بلا حدود"),
                          Checkbox(
                              activeColor: colorsApp.color_grean_body,
                              value: val.choseCampaignsupedit ,
                              onChanged: (value) {
                                val.choseCampaignforSubEdit(value!);
                              }),
                        ],
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
                          color: colorsApp.color_yellow_body,
                        ),
                        child: MaterialButton(
                          child: Text(
                            "ارسال",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            if (formstate.currentState!.validate()) {
                              val.EditSub(id_sub);
                              Navigator.of(context).pop();
                              CheckEditSup(context);
                              print("validat");
                            } else {
                              print("not validat");
                            }
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

  Future<void> CheckEditSup(BuildContext context) async {
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
                    val.edit_sub == null
                        ? CircularProgressIndicator()
                        : Container(
                            child: val.edit_sub['message'] ==
                                    "User Subscription updated successfully."
                                ? Text(
                                    //User has subscriptions.
                                    "تم الارسال",
                                    style: TextStyle(
                                        color: colorsApp.color_grean_body,
                                        fontWeight: FontWeight.bold),
                                  )
                                : val.edit_sub['message'] ==
                                        "User has subscriptions."
                                    ? Text(
                                        "هذا المشترك ليس مشترك في عرض",
                                        style: TextStyle(
                                            color: colorsApp.color_red_body,
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

  Future<void> CheckAcceptSupscription(BuildContext context) async {
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
                    val.accept_sub == null
                        ? CircularProgressIndicator()
                        : Container(
                            child: val.accept_sub['message'] ==
                                        "Subscription active successfully." ||
                                    val.accept_sub['message'] ==
                                        "Subscription inactive successfully."
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

  Future<void> DeleteUser(BuildContext context) async {
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
                    Container(
                      child: Text(
                        "هل انت متاكد من حذف المستخدم",
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
                      "تاكيد",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      val.DeleteUser();
                      Navigator.of(context).pop();
                      CheckDeleteUser(context);
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

  Future<void> CheckDeleteUser(BuildContext context) async {
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
                    val.delete_user == null
                        ? CircularProgressIndicator()
                        : Container(
                            child: val.delete_user['message'] ==
                                    "sub created successfully."
                                ? Text(
                                    "تم حذف المستخد بنجاح",
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
