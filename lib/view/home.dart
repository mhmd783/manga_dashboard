import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango_dash_board/companent/app_bar.dart';
import 'package:mango_dash_board/view/allclients/body_all_clients.dart';
import 'package:mango_dash_board/view/home/body_home_campain.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/home/body_home_offers.dart';
import 'package:mango_dash_board/view/home/body_home_realse.dart';
import 'package:mango_dash_board/view/home/dialog.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  ColorsApp colorsApp = new ColorsApp();
  DialogHome dialogHome = new DialogHome();
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).Home();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).AllEmployee();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).GetNewUsers();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).AllSub();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).AllDataCount();
    });
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
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      //AppBar
                      AppBarApp(),

                      // & orders offers Campain reals
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  //realse
                                  Expanded(
                                    child: val.home_data == null
                                        ? Container(
                                            color: Colors.white,
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator()))
                                        : val.home_data['message'] ==
                                                "Home Data."
                                            ? BodyHomeRealse(
                                                //Container(color: Colors.white,child: Center(child: Text("لايوجد بيانات"),),)
                                                title: "الفديو",
                                                num: val
                                                    .home_data['data']['reels']
                                                    .length, //${val.home_data['data']['reals'].length}
                                                butt: "ارسال ",
                                                home_data: val.home_data)
                                            : Container(
                                                padding: EdgeInsets.all(20),
                                                margin: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.white),
                                                child: Center(
                                                    child: Text(
                                                  "لا يوجد بيانات",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey),
                                                )),
                                              ),
                                  ),
                                  //sub
                                  Expanded(
                                    child: val.all_sub == null
                                        ? Container(
                                            color: Colors.white,
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator()))
                                        : val.all_sub['message'] ==
                                                "Subscriptions retrieved successfully."
                                            ? BodyHomeSub(
                                                title: "الاشتراكات",
                                                num: 0,
                                                butt: "ارسال المهام",
                                                data_sub: val.all_sub)
                                            : Container(
                                                padding: EdgeInsets.all(20),
                                                margin: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.white),
                                                child: Center(
                                                    child: Text(
                                                  "لا يوجد بيانات",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey),
                                                )),
                                              ),
                                  ),
                                ],
                              ),
                            ),
                            //campains
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: val.home_data == null
                                        ? Container(
                                            color: Colors.white,
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator()))
                                        : val.home_data['message'] ==
                                                "Home Data."
                                            ? BodyHomeCampain(
                                                title: "الحملات",
                                                num: val
                                                    .home_data['data']
                                                        ['campaigns']
                                                    .length,
                                                butt: "ارسال المهام",
                                                home_data: val.home_data)
                                            : Container(
                                                padding: EdgeInsets.all(20),
                                                margin: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.white),
                                                child: Center(
                                                    child: Text(
                                                  "لا يوجد بيانات",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey),
                                                )),
                                              ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      height:
                                          MediaQuery.of(context).size.height -
                                              120,
                                      padding: EdgeInsets.all(5),
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white),

                                      ///container all employee
                                      child: val.new_users == null
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : val.new_users['message'] ==
                                                  "All new users"
                                              ? BodyAllClients(
                                                  data: val.new_users,
                                                  title:
                                                      "عملاء بانتظار الموافقه",
                                                  num: 1)
                                              : Center(
                                                  child: IconButton(
                                                      onPressed: () {
                                                        val.GetNewUsers();
                                                      },
                                                      icon:
                                                          Icon(Icons.refresh)),
                                                ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            dialogHome.SendMessage(context);
          },
          child: Icon(Icons.send),
        ),
      );
    });
  }
}
