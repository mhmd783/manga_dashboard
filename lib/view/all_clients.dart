import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango_dash_board/companent/app_bar.dart';
import 'package:mango_dash_board/view/all_employee/body_all_employee.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/text_form_search.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/allclients/body_all_clients.dart';
import 'package:provider/provider.dart';

class AllClients extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AllClients();
  }
}

class _AllClients extends State<AllClients> {
  ColorsApp colorsApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).GetAllUsers();
    });
    super.initState();
  }

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
              padding: EdgeInsets.all(10),
              child: Column(children: [
                //AppBar
                AppBarApp(),
                //employs
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.topLeft,
                        height: MediaQuery.of(context).size.height - 120,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),

                        ///container all employee
                        child: val.all_users == null
                            ? Center(child: CircularProgressIndicator())
                            : val.all_users['message'] == "All users"
                                ? Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: BodyAllClients(
                                              data: val.all_users,
                                              title: 'كل العملاء',
                                              num: 3),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            val.GetAllUsers();
                                          },
                                          icon: Icon(Icons.refresh))
                                    ],
                                  )
                                : Center(
                                  child: IconButton(
                                      onPressed: () {
                                        val.GetAllUsers();
                                      },
                                      icon: Icon(Icons.refresh)),
                                ),
                      ),
                    ),
                  ],
                )
              ]),
            )),
      );
    });
  }
}
