import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango_dash_board/companent/app_bar_simple.dart';
import 'package:mango_dash_board/view/client/body_profile_client.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/container_order.dart';
import 'package:mango_dash_board/companent/photo_profile.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/client/dialog.dart';
import 'package:provider/provider.dart';

class ClientProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClientProfile();
  }
}

class _ClientProfile extends State<ClientProfile> {
  ColorsApp colorsApp = new ColorsApp();
  DialogClient dialogClient = new DialogClient();
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
                      val.user_data == null
                          ? CircularProgressIndicator()
                          : val.user_data['message'] ==
                                  "User data retrieved successfully."
                              ? Container(
                                  child: Column(
                                    children: [
                                      PhotoProfile(
                                        imagefile: val.image_client,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Text(
                                          "${val.user_data['data']['first_name']} ${val.user_data['data']['last_name']}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                            "${val.user_data['data']['email']}"),
                                      ),
                                      //body
                                      Stack(
                                        alignment: val.body_client == "data"
                                            ? AlignmentDirectional.bottomStart
                                            : AlignmentDirectional.bottomEnd,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            height: 45,
                                            width: 250,
                                            margin: EdgeInsets.only(
                                                left: 20, top: 20),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color:
                                                    colorsApp.color_blak_app),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                                        val.changBodyProfileClient(
                                                            "data");
                                                        // val.GetUserData();
                                                      },
                                                      child: Text(
                                                        "بيانات العميل",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      )),
                                                  Expanded(child: Container()),
                                                  TextButton(
                                                      onPressed: () {
                                                        val.changBodyProfileClient(
                                                            "orders");
                                                        val.GetUserOrders();
                                                      },
                                                      child: Text(
                                                        "الاوردرات",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      )),
                                                ]),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 70, right: 40),
                                            height: 5,
                                            width: 40,
                                            color: colorsApp.color_yellow_body,
                                          )
                                        ],
                                      ),
                                      val
                                                  .user_data['data']
                                                      ['latest_subscription']
                                                  .length !=
                                              0
                                          ? val.user_data['data'][
                                                          'latest_subscription']
                                                      ['accept'] ==
                                                  "false"
                                              ? Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  child: Text(
                                                    val.user_data['data'][
                                                                    'latest_subscription']
                                                                [
                                                                'subscription_status'] ==
                                                            "sub"
                                                        ? "${val.user_data['data']['latest_subscription']['title']}طلب اشتراك في"
                                                        : "${val.user_data['data']['latest_subscription']['title']}طلب الغاء اشتراك في",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                )
                                              : Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  child: Text(
                                                    val.user_data['data'][
                                                                    'latest_subscription']
                                                                [
                                                                'subscription_status'] ==
                                                            "sub"
                                                        ? "${val.user_data['data']['latest_subscription']['title']} مشترك في"
                                                        : "${val.user_data['data']['latest_subscription']['title']}لغي اشتراكه في",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                )
                                          : SizedBox(),
                                      //data client
                                      val.body_client == "data"
                                          ? BodyProfileClient()
                                          :
                                          //client orders
                                          val.user_orders == null
                                              ? Center(
                                                  child:
                                                      CircularProgressIndicator())
                                              : val.user_orders['message'] ==
                                                      "User data retrieved successfully."
                                                  ? Row(
                                                      children: [
                                                        Expanded(
                                                            child:
                                                                ContainerOrderRealse(
                                                          color: const Color
                                                              .fromARGB(255,
                                                              147, 192, 230),
                                                          image_logo:
                                                              "assets/images/reals.png",
                                                          title: "فديو اعلاني",
                                                          data_order:
                                                              val.user_orders,
                                                        )),
                                                        Expanded(
                                                            child:
                                                                ContainerOrderCampain(
                                                          color: const Color
                                                              .fromARGB(255,
                                                              147, 192, 230),
                                                          image_logo:
                                                              "assets/images/campainorder.png",
                                                          title: "حمله اعلانيه",
                                                          data_order:
                                                              val.user_orders,
                                                        )),
                                                      ],
                                                    )
                                                  : Center(
                                                      child: IconButton(
                                                          onPressed: () {
                                                            val.GetUserOrders();
                                                          },
                                                          icon: Icon(
                                                              Icons.refresh)),
                                                    ),
                                    ],
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    val.GetUserData();
                                  },
                                  icon: Icon(Icons.refresh)),
                    ],
                  ),
                ),
              ),
        floatingActionButton: val.user_data != null
            ? val.user_data['message'] == "User data retrieved successfully."
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      val.user_data['data']['user_status'] == "new"
                          ? MaterialButton(
                              onPressed: () {
                                val.ConvertUsertoold(
                                    val.user_data['data']['user_id']);
                                dialogClient.CheckConvertUserToOld(context);
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 7),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: colorsApp.color_red_body),
                                  child: Text("ادراج العميل")),
                            )
                          : SizedBox(),
                      SizedBox(
                        height: 10,
                      ),
                      val.user_data['data']['latest_subscription'].length != 0
                          ? val.user_data['data']['latest_subscription']
                                      ['accept'] ==
                                  "false"
                              ? MaterialButton(
                                  onPressed: () {
                                    //val.user_data['data']['latest_subscription']['']
                                    val.AcceptSub(val.user_data['data']
                                        ['latest_subscription']['id']);
                                    dialogClient.CheckAcceptSupscription(
                                        context);
                                  },
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 7),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: colorsApp.color_red_body),
                                      child: Text(val.user_data['data']
                                                      ['latest_subscription']
                                                  ['subscription_status'] ==
                                              "sub"
                                          ? "تاكيد اشتراك"
                                          : "تاكيد الغاء اشتراك")),
                                )
                              : SizedBox()
                          : SizedBox(),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        onPressed: () {
                          dialogClient.AddSupscription(context);
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: colorsApp.color_red_body),
                            child: Text("اضافه اشتراك")),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      val.user_data['data']['latest_subscription'].length != 0
                          ? MaterialButton(
                              onPressed: () {
                                val.StoreDataSub();
                                dialogClient.EditSub(
                                    context,
                                    val.user_data['data']['latest_subscription']
                                        ['id']);
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 7),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: colorsApp.color_red_body),
                                  child: Text("تعديل اشتراك")),
                            )
                          : SizedBox(),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        onPressed: () {
                          dialogClient.DeleteUser(context);
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: colorsApp.color_red_body),
                            child: Text("حذف العميل")),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        onPressed: () {
                          dialogClient.SendMessage(context);
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: colorsApp.color_red_body),
                            child: Text("ارسال رساله")),
                      ),
                    ],
                  )
                : Container()
            : Container(),
      );
    });
  }
}
