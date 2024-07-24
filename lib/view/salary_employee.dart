import 'package:flutter/material.dart';
import 'package:mango_dash_board/companent/app_bar.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/exports/body_export.dart';
import 'package:mango_dash_board/view/exports/dialog.dart';
import 'package:mango_dash_board/view/salary_employee/body_salary_employee.dart';
import 'package:mango_dash_board/view/supscription/body_supscription.dart';
import 'package:provider/provider.dart';

class SalaryEmployee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SalaryEmployee();
  }
}

class _SalaryEmployee extends State<SalaryEmployee> {
  ColorsApp colorsApp = new ColorsApp();
  DialogExport dialogExport = new DialogExport();
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).SalaryEmployee();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).AllDataCount();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  MediaQuery.of(context).size.width < 1000 ||
                MediaQuery.of(context).size.height < 600
            ? Container(
                child: Center(
                  child: Text("كبر حجم الشاشه"),
                ),
              )
            :Container(
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
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                AppBarApp(),
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child:  BodySalaryEmployee(),
                      ),
                ),
              ],
            ),
          )),
    );
  }
}
