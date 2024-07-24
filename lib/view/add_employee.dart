import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango_dash_board/companent/app_bar.dart';
import 'package:mango_dash_board/companent/app_bar_simple.dart';
import 'package:mango_dash_board/companent/container_add_employee.dart';
import 'package:mango_dash_board/companent/drop_dowen.dart';
import 'package:mango_dash_board/view/all_employee/dialog.dart';
import 'package:mango_dash_board/view/home/body_home_campain.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/text_form_search.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/home/dialog.dart';
import 'package:provider/provider.dart';

class AddEmployee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddEmployee();
  }
}

class _AddEmployee extends State<AddEmployee> {
  ColorsApp colorsApp = new ColorsApp();
  DialogAllEmployee dialogAllEmployee = new DialogAllEmployee();
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Consumer<control>(builder: (context, val, child) {
      return Scaffold(
        body:  MediaQuery.of(context).size.width < 1000 ||
                MediaQuery.of(context).size.height < 600
            ? Container(
                child: Center(
                  child: Text("كبر حجم الشاشه"),
                ),
              )
            : Form(
          key: formstate,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorsApp.color_grean_body,
                  colorsApp.color_yellow_body,
                  colorsApp.color_yellow_body,
                  colorsApp.color_red_body
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                AppBarAppSimple(),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Expanded(
                                  child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              bottomLeft: Radius.circular(30)),
                                          color: Colors.white),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(20),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: DrobDowenButtonApp(
                                                      selectedValue:
                                                          val.api.selectedValue,
                                                      dropdownItems: val
                                                          .api.dropdownItems),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Expanded(
                                                  child: ContainerAddEmployee(
                                                      title: "اسم الموظف",
                                                      hintText: "الاسم",
                                                      controll:
                                                          val.api.name_employee,
                                                      keyboard:
                                                          TextInputType.text),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(20),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: ContainerAddEmployeeInt(
                                                      title: "رقم تلفون الموظف",
                                                      hintText: "رقم التلفون",
                                                      controll: val
                                                          .api.phone_employee,
                                                      keyboard:
                                                          TextInputType.number),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Expanded(
                                                  child: ContainerAddEmployee(
                                                      title: "ايميل الموظف",
                                                      hintText: "الايميل",
                                                      controll: val
                                                          .api.email_employee,
                                                      keyboard: TextInputType
                                                          .emailAddress),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(20),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: ContainerAddEmployee(
                                                      title:
                                                          "تاكيد كلمه سر الموظف",
                                                      hintText:
                                                          "تاكيد كلمه السر",
                                                      controll: val.api
                                                          .password_confirm_employee,
                                                      keyboard: TextInputType
                                                          .emailAddress),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Expanded(
                                                  child: ContainerAddEmployee(
                                                      title: "كلمه سر الموظف",
                                                      hintText: "كلمه السر",
                                                      controll: val.api
                                                          .password_employee,
                                                      keyboard:
                                                          TextInputType.number),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(20),
                                            child: Row(
                                              children: [
                                                Expanded(child: Container()),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Expanded(
                                                  child: ContainerAddEmployeeInt(
                                                      title: "حدد راتب الموظف",
                                                      hintText: "0.00",
                                                      controll: val.api
                                                          .salary_month_employee,
                                                      keyboard:
                                                          TextInputType.number),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ))),
                            ],
                          ),
                        ),
                        //campains
                        Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30)),
                                gradient: LinearGradient(
                                  colors: [
                                    colorsApp.color_grean_body,
                                    colorsApp.color_yellow_body,
                                    colorsApp.color_yellow_body,
                                    colorsApp.color_red_body
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 100,
                                      width: 100,
                                      child: Image.asset(
                                          "assets/images/mango.png")),
                                  Container(
                                      height: 70,
                                      width: 170,
                                      child: Image.asset(
                                        "assets/images/mangomedia.png",
                                        fit: BoxFit.cover,
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(top: 40),
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.blue,
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {
                                        if (formstate.currentState!
                                            .validate()) {
                                          val.AddEmployee();
                                          dialogAllEmployee.CheckAddEmployee(
                                              context);
                                          print("validat");
                                        } else {
                                          print("not validat");
                                        }
                                      },
                                      child: Text(
                                        "حفظ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
