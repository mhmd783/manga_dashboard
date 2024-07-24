import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango_dash_board/companent/app_bar.dart';
import 'package:mango_dash_board/view/allOrdersNotDone/body_all_orders_campain.dart';
import 'package:mango_dash_board/view/allOrdersNotDone/body_all_orders_realse.dart';
import 'package:mango_dash_board/view/allclients/body_all_clients.dart';
import 'package:mango_dash_board/view/home/body_home_campain.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/home/body_home_offers.dart';
import 'package:mango_dash_board/view/home/body_home_realse.dart';
import 'package:mango_dash_board/view/home/dialog.dart';
import 'package:provider/provider.dart';

class AllOrdersNotDone extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AllOrdersNotDone();
  }
}

class _AllOrdersNotDone extends State<AllOrdersNotDone> {
  ColorsApp colorsApp = new ColorsApp();
  DialogHome dialogHome = new DialogHome();
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).AllEmployee();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).AllOrdersNotFnished();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).AllDataCount();
    });
    
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
                        child: val.all_orders_not_finshed == null
                            ? Container(
                                color: Colors.white,
                                child: Center(
                                    child: CircularProgressIndicator()))
                            : val.all_orders_not_finshed['message'] == "Orders Send But Not Done."
                                ? BodyAllOrdersRealse(
                                    //Container(color: Colors.white,child: Center(child: Text("لايوجد بيانات"),),)
                                    title: "الفديو",
                                    num: val.all_orders_not_finshed['data']['reels']
                                        .length, //${val.all_orders_not_finshed['data']['reals'].length}
                                    butt: "ارسال ",
                                    data: val.all_orders_not_finshed)
                                : Container(
                                    color: Colors.white,
                                  ),
                      ),
                      //campains
                      Expanded(
                        child: val.all_orders_not_finshed == null
                            ? Container(
                                color: Colors.white,
                                child: Center(
                                    child: CircularProgressIndicator()))
                            : val.all_orders_not_finshed['message'] == "Orders Send But Not Done."
                                ? BodyAllOrdersCampain(
                                    title: "الحملات",
                                    num: val
                                        .all_orders_not_finshed['data']['campaigns']
                                        .length,
                                    butt: "ارسال المهام",
                                    data: val.all_orders_not_finshed)
                                : Container(
                                    color: Colors.white,
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
