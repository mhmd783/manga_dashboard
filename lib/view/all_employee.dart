import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango_dash_board/companent/app_bar.dart';
import 'package:mango_dash_board/view/all_employee/body_all_employee.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/text_form_search.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:provider/provider.dart';

class AllEmployee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AllEmployee();
  }
}

class _AllEmployee extends State<AllEmployee> {
  ColorsApp colorsApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).AllEmployee();
    });
    super.initState();
  }
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
            : Container(
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
              padding: EdgeInsets.all(10),
              child: Column(children: [
                //AppBar
                AppBarApp(),
                //employs
                Container(
                  alignment: Alignment.topLeft,
                  height: MediaQuery.of(context).size.height - 120,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),

                  ///container all employee
                  child:val.all_employee_data==null?Center(child: CircularProgressIndicator()): BodyAllEmployee(),
                )
              ]),
            )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: colorsApp.color_red_body,
          onPressed: () {
            Navigator.of(context).pushNamed("addemployee");
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
