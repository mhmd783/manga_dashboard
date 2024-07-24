import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango_dash_board/companent/app_bar_simple.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/home/dialog.dart';
import 'package:mango_dash_board/view/orders_details/body_details_order.dart';
import 'package:mango_dash_board/view/client/body_profile_client.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/container_order.dart';
import 'package:mango_dash_board/companent/photo_profile.dart';
import 'package:provider/provider.dart';

class CampainOrdersDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CampainOrdersDetails();
  }
}

class _CampainOrdersDetails extends State<CampainOrdersDetails> {
  ColorsApp colorsApp = new ColorsApp();
  DialogHome dialogHome = new DialogHome();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).GetDetailsOrderCampain();
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
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //app bar
                AppBarAppSimple(),
                //photo profile
                Container(
                  child: val.details_order_campain == null
                      ? CircularProgressIndicator()
                      : val.details_order_campain['message'] ==
                              "User and campaigns data retrieved successfully."
                          ? Column(
                              children: [
                                PhotoProfile(
                                  imagefile: val.image_client_campain,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: TextButton(
                                    onPressed: () {
                                      //${val.details_order_campain['data']['user_id']}
                                      val.id_user =
                                          val.details_order_campain['data']
                                              ['user_id'];
                                      val.GetUserData();
                                      Navigator.of(context)
                                          .pushNamed("clientprofile");
                                    },
                                    child: Text(
                                      "${val.details_order_campain['data']['first_name']} ${val.details_order_campain['data']['last_name']}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),

                                Container(
                                  child: Text(
                                      "${val.details_order_campain['data']['email']}"),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  width: 150,
                                  child: Divider(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                       "(${val.details_order_campain['data']['order_type']})  اشتراك في حمله علي "
                                          ,
                                      //"حمله علي ${val.details_order_campain['data']['order_type']}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      height: 25,
                                      width: 50,
                                      child: val.details_order_campain['data']
                                                  ['order_type'] ==
                                              "facebook"
                                          ? Image.asset(
                                              "assets/images/facebook.png")
                                          : val.details_order_campain['data']
                                                      ['order_type'] ==
                                                  "instgram"
                                              ? Image.asset(
                                                  "assets/images/instgram.png")
                                              : Stack(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 20),
                                                      child: Image.asset(
                                                          "assets/images/instgram.png"),
                                                    ),
                                                    Image.asset(
                                                        "assets/images/facebook.png"),
                                                  ],
                                                ),
                                    ),
                                  ],
                                ),
                                //body
                                BodyDetailsOrder(
                                  details_order_campain:
                                      val.details_order_campain,
                                )
                              ],
                            )
                          : Center(
                              child: IconButton(
                                  onPressed: () {
                                    val.GetDetailsOrderReals();
                                  },
                                  icon: Icon(Icons.refresh)),
                            ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: val.details_order_campain == null
            ? null
            : val.details_order_campain['message'] ==
                    "User and campaigns data retrieved successfully."
                ? val.details_order_campain['data']['send_to_emploeey'] ==
                        "false"
                    ? FloatingActionButton(
                        onPressed: () {
                          val.api.id_task =
                              val.details_order_campain['data']['campaign_id'];
                          val.api.task_type = "campaign";
                          dialogHome.ChoseEmployee(context);
                        },
                        child: Icon(Icons.send_time_extension),
                      )
                    : null
                : null,
      );
    });
  }
}
