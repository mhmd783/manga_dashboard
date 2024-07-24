import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango_dash_board/companent/app_bar_simple.dart';
import 'package:mango_dash_board/companent/container_reals_order_details.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/home/dialog.dart';
import 'package:mango_dash_board/view/orders_details/body_details_order.dart';
import 'package:mango_dash_board/view/client/body_profile_client.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/container_order.dart';
import 'package:mango_dash_board/companent/photo_profile.dart';
import 'package:provider/provider.dart';

class RealsOrdersDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RealsOrdersDetails();
  }
}

class _RealsOrdersDetails extends State<RealsOrdersDetails> {
  ColorsApp colorsApp = new ColorsApp();
  DialogHome dialogHome = new DialogHome();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).GetDetailsOrderReals();
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
                val.details_order_reals == null
                    ? Center(child: CircularProgressIndicator())
                    : val.details_order_reals['message'] ==
                            "User and reels data retrieved successfully."
                        ? Container(
                            width: double.infinity,
                            child: Column(
                              children: [
                                PhotoProfile(
                                  imagefile:val.image_client_reals,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: TextButton(
                                    onPressed: () {
                                      val.id_user =
                                          val.details_order_reals['data']
                                              ['user_id'];
                                      val.GetUserData();
                                      Navigator.of(context).pushNamed("clientprofile");
                                    },
                                    child: Text(
                                      "${val.details_order_reals['data']['first_name']} ${val.details_order_reals['data']['last_name']}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),

                                Container(
                                  child: Text(
                                      "${val.details_order_reals['data']['email']}"),
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
                                      " اشتراك فديو ريلز",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: 25,
                                        width: 25,
                                        child: Image.asset(
                                            "assets/images/reals.png")),
                                  ],
                                ),
                                //body
                                Container(
                                  padding: EdgeInsets.all(40),
                                  child: Row(children: [
                                    //image
                                    Expanded(
                                      child: Container(
                                          height: 500,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(50),
                                                bottomRight:
                                                    Radius.circular(50)),
                                            child: val.image_reals!=null
                                                ? Image.file(
                                                    val.image_reals!,
                                                    fit: BoxFit.fill,
                                                  )
                                                : Icon(
                                                    Icons.picture_in_picture),
                                          )),
                                    ),

                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: ContainerRealsOrdersDetails(
                                                        title: "وصف المنتج",
                                                        subtitle:
                                                            "${val.details_order_reals['data']['product_description']}"),
                                                  ),
                                                  Expanded(
                                                    child: ContainerRealsOrdersDetails(
                                                        title: "اسم المنتج",
                                                        subtitle:
                                                            "${val.details_order_reals['data']['product_name']}"),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: ContainerRealsOrdersDetails(
                                                        title: "سعر المنتج",
                                                        subtitle:
                                                            "${val.details_order_reals['data']['product_price']}"),
                                                  ),
                                                  Expanded(
                                                    child: ContainerRealsOrdersDetails(
                                                        title:
                                                            "طريقه استخدام المنتج",
                                                        subtitle:
                                                            "${val.details_order_reals['data']['product_usage']}"),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: ContainerRealsOrdersDetails(
                                                        title:
                                                            "الهدايا علي المنتج",
                                                        subtitle:
                                                            "${val.details_order_reals['data']['gift']}"),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Expanded(
                                                    child: ContainerRealsOrdersDetails(
                                                        title:
                                                            "العروض علي المنتج",
                                                        subtitle:
                                                            "${val.details_order_reals['data']['offers']}"),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ))
                                  ]),
                                )
                              ],
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              val.GetDetailsOrderReals();
                            },
                            icon: Icon(Icons.refresh)),
              ],
            ),
          ),
        ),
        floatingActionButton: val.details_order_reals == null
            ? null
            : val.details_order_reals['message'] ==
                            "User and reels data retrieved successfully."
                ? val.details_order_reals['data']['send_to_emploeey'] == "false"
                    ? FloatingActionButton(
                        onPressed: () {
                          val.api.id_task =
                              val.details_order_reals['data']['reel_id'];
                          val.api.task_type = "reels";
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
