import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/text_form_search.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/exports/dialog.dart';
import 'package:mango_dash_board/view/home/dialog.dart';
import 'package:mango_dash_board/view/salary_employee/dialog.dart';
import 'package:mango_dash_board/view/supscription/dialog.dart';
import 'package:provider/provider.dart';

class BodySalaryEmployee extends StatelessWidget {
  BodySalaryEmployee({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DialogSalaryEmployee dialogSalaryEmployee = new DialogSalaryEmployee();
    ColorsApp colorsApp = new ColorsApp();
    return Consumer<control>(builder: (context, val, child) {
      return val.salary_employee == null
          ? Center(child: CircularProgressIndicator())
          : val.salary_employee['message'] == "All Employees data."
              ? Container(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, mainAxisExtent: 200),
                      itemCount: val.salary_employee['data'].length,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 244, 238, 184),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  val.StoreOneEmployee(
                                      val.salary_employee['data'][i]['id']);
                                  Navigator.of(context).pushNamed("employee");
                                },
                                title: Text(
                                    "${val.salary_employee['data'][i]['name']}"),
                                subtitle: Text(
                                    "${val.salary_employee['data'][i]['email']}"),
                                leading: CircleAvatar(
                                  child: Icon(Icons.person_2_outlined),
                                ),
                              ),
                              ListTile(
                                leading: Text(
                                    "${val.salary_employee['data'][i]['salary']}"),
                                trailing: Text("الراتب"),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  dialogSalaryEmployee.CheckSendSalaryEmployee(
                                      context);
                                  val.PayEmployee(val.salary_employee['data'][i]['id'].toString());
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: colorsApp.color_red_body,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Text("تاكيد صرف الراتب"),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              : Center(
                  child: IconButton(
                      onPressed: () {
                        val.SalaryEmployee();
                      },
                      icon: Icon(Icons.refresh)),
                );
    });
  }
}
