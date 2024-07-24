import 'package:flutter/material.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:provider/provider.dart';

class DialogEmployee {
  ColorsApp colorsApp = new ColorsApp();
  Future<void> DeleteEmployee(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<control>(builder: (context, val, child) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            scrollable: true,
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            title: Text('تحقق'),
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
                      margin: EdgeInsets.all(20),
                      child: Text(
                        "هل انت متاكد من حذف الموظف",
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
                      Navigator.of(context).pop();
                      val.DeleteEmployee();
                      CheckDeleteEmployee(context);
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

  Future<void> CheckDeleteEmployee(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<control>(builder: (context, val, child) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            scrollable: true,
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            title: Text('تحقق'),
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
                    val.delete_employee == null
                        ? CircularProgressIndicator()
                        : Container(
                            child: val.delete_employee['message'] ==
                                    "Employee deleted successfully."
                                ? Text(
                                    "تم الحذف",
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
                      if (val.delete_employee['message'] ==
                          "Employee deleted successfully.") {
                        Navigator.of(context).pop();
                      }

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
