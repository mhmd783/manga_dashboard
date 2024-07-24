import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/photo_profile.dart';
import 'package:mango_dash_board/companent/text_form_app.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:provider/provider.dart';

class DialogHome {
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
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          alignment: Alignment.topRight,
                          child: Text("ارسل الي",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: colorsApp.color_grean_body))),
                      Container(
                        width: 500,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("المظفين والعملاء"),
                                  Checkbox(
                                      value: val.how == 'all' ? true : false,
                                      onChanged: (value) {
                                        val.ChoseHowSendNotification("all");
                                      }),
                                ],
                              )),
                            ),
                            Expanded(
                              child: Container(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("الموظفين"),
                                  Checkbox(
                                      value:
                                          val.how == 'employees' ? true : false,
                                      onChanged: (value) {
                                        val.ChoseHowSendNotification(
                                            "employees");
                                      }),
                                ],
                              )),
                            ),
                            Expanded(
                              child: Container(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("العملاء"),
                                  Checkbox(
                                      value:
                                          val.how == 'clients' ? true : false,
                                      onChanged: (value) {
                                        val.ChoseHowSendNotification("clients");
                                      }),
                                ],
                              )),
                            ),
                          ],
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
                      color: colorsApp.color_red_body,
                    ),
                    child: MaterialButton(
                      child: Text(
                        "ارسال",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (formstate.currentState!.validate()) {
                          if (val.how != '') {
                            if (val.how == "clients") {
                              val.SendNotificationToAllUsers();
                            }
                            if (val.how == "employees") {
                              val.SendNotificationToAllEmployees();
                            }
                            if (val.how == "all") {
                              val.SendNotificationToAllUsers();
                              val.SendNotificationToAllEmployees();
                            }

                            Navigator.of(context).pop();
                            CheckSendNotificationToAllUsers(context);
                            print("validat");
                          } else {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.grey.withOpacity(0.7),
                                  elevation: 20,
                                  content: Text(
                                    "اختار من ترسل له الاشعارات ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            });
                          }
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
  Future<void> CheckSendNotificationToAllUsers(BuildContext context) async {
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
                                        "Notifications have been sent"||val.send_notification_to_all_users['message'] ==
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

  

  //employee
  Future<void> ChoseEmployee(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<control>(builder: (context, val, child) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            scrollable: true,
            elevation: 10,
            title: Text(
              "اختار موظف",
              style: TextStyle(color: Colors.black),
            ),
            content: Container(
              padding: EdgeInsets.only(top: 20),
              width: 500,
              height: 300,
              alignment: Alignment.center,
              child: val.all_employee_data == null
                  ? IconButton(
                      onPressed: () {
                        val.AllEmployee();
                      },
                      icon: Icon(Icons.refresh))
                  : ListView.builder(
                      itemCount: val.all_employee_data['data'].length,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: EdgeInsets.all(5),
                          child: ListTile(
                            onTap: () {
                              //val.all_employee_data['data'][i]['id']
                              val.api.id_employee =
                                  val.all_employee_data['data'][i]['id'];
                              val.api.i_employee = i;
                              print(val.api.id_employee);
                              Navigator.of(context).pop();
                              SendOrderCampain(context);
                            },
                            trailing: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: colorsApp.color_yellow_body,
                              ),
                              child: Text(
                                "${val.all_employee_data['data'][i]['specialization']}",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            title: Text(
                                "${val.all_employee_data['data'][i]['name']}"),
                            leading: CircleAvatar(
                                radius: 30,
                                child: Icon(Icons.person_2_outlined)),
                          ),
                        );
                      }),
            ),
          );
        });
      },
    );
  }

  //////تاكيد
  Future<void> SendOrderCampain(BuildContext context) async {
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
                width: 500,
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    PhotoProfile(
                      imagefile: null,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "${val.all_employee_data['data'][val.api.i_employee]['name']}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Text(
                          "وظيفته ${val.all_employee_data['data'][val.api.i_employee]['specialization']}"),
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
                    //body taskes orders
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      width: 300,
                      // height: 100,
                      alignment: Alignment.center,
                      child: Card(
                        child: ListTile(
                          onTap: () {},
                          trailing: Checkbox(
                              activeColor: colorsApp.color_grean_body,
                              value: true,
                              onChanged: (val) {}),
                          title: Text(val.api.task_type == "reels"
                              ? "فيديو ريلز"
                              : val.api.task_type == "campaign"
                                  ? "حمله اعلانيه"
                                  : "عرض"),
                          subtitle: Text(
                            val.api.task_type == "reels"
                                ? "${val.home_data['data']['reels']['${val.api.i_task}']['product_name']}"
                                : val.api.task_type == "campaign"
                                    ? "${val.home_data['data']['campaigns']['${val.api.i_task}']['order_type']}"
                                    : "${val.home_data['data']['offers']['${val.api.i_task}']['offer_title']}",
                            style: TextStyle(color: Colors.grey),
                          ),
                          leading: CircleAvatar(
                            radius: 30,
                            child: Container(
                              height: 45,
                              width: 45,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    "assets/images/person.jpeg",
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            actions: <Widget>[
              Consumer<control>(builder: (context, val, child) {
                return Row(
                  children: [
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
                            val.SendOrder();
                            Navigator.of(context).pop();
                            CheckSendOrder(context);
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

  Future<void> CheckSendOrder(BuildContext context) async {
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
                    val.sent_order == null
                        ? CircularProgressIndicator()
                        : Container(
                            child: val.sent_order['message'] ==
                                        "Reels updated successfully" ||
                                    val.sent_order['message'] ==
                                        "Offer Order updated successfully" ||
                                    val.sent_order['message'] ==
                                        "Campaign updated successfully"
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
