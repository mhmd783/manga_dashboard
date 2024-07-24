import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango_dash_board/companent/app_bar.dart';
import 'package:mango_dash_board/view/home/body_home_campain.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/home/body_home_offers.dart';
import 'package:mango_dash_board/view/home/body_home_realse.dart';
import 'package:mango_dash_board/view/home/dialog.dart';
import 'package:mango_dash_board/view/offers/dialog_add_offer.dart';
import 'package:mango_dash_board/view/offers/dialog_delete_offer.dart';
import 'package:provider/provider.dart';

class Offers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Offers();
  }
}

class _Offers extends State<Offers> {
  ColorsApp colorsApp = new ColorsApp();
  DialogAddOffer dialogAddOffer = new DialogAddOffer();
  DialogDeleteOffer dialogDeleteOffer = new DialogDeleteOffer();
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).AllOffers();
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
                    child: Container(
                  padding: EdgeInsets.all(30),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: val.all_offers == null
                      ? Center(child: CircularProgressIndicator())
                      : val.all_offers['message'] == "All Offers"
                          ? GridView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3, mainAxisExtent: 200),
                              itemCount: val.all_offers['data']['data'].length,
                              itemBuilder: (context, i) {
                                return Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: colorsApp.color_campain_container,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: IconButton(
                                                onPressed: () {
                                                  //val.all_offers['data']['data'][i]['id']
                                                  dialogDeleteOffer.DeleteOffer(
                                                      context,
                                                      val.all_offers['data']
                                                          ['data'][i]['id']);
                                                },
                                                icon:
                                                    Icon(Icons.delete_outline)),
                                          ),
                                          Expanded(child: Container()),
                                          Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 15),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: Colors.white),
                                            child: Text(
                                              "${val.all_offers['data']['data'][i]['title']}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      title: Text(
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                          "${val.all_offers['data']['data'][i]['description']}"),
                                                      trailing: Text(
                                                          style: TextStyle(
                                                              fontSize: 13),
                                                          "الوصف"),
                                                    ),
                                                    ListTile(
                                                      title: Text(
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                          "${val.all_offers['data']['data'][i]['price']}"),
                                                      trailing: Text(
                                                          style: TextStyle(
                                                              fontSize: 13),
                                                          "السعر"),
                                                    ),
                                                    ListTile(
                                                      title: Text(
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                          "${val.all_offers['data']['data'][i]['num_of_reels']}"),
                                                      trailing: Text(
                                                          style: TextStyle(
                                                              fontSize: 13),
                                                          "عدد فديوهات"),
                                                    ),
                                                    ListTile(
                                                      title: Text(
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                          val.all_offers['data']
                                                                          [
                                                                          'data'][i]
                                                                      [
                                                                      'status_campaign'] ==
                                                                  "true"
                                                              ? "مغعله"
                                                              : "غير مفعله"),
                                                      trailing: Text(
                                                          style: TextStyle(
                                                              fontSize: 13),
                                                          "حاله الحملات"),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 30,
                                              child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset(
                                                      "assets/images/boke.png")),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              })
                          : Center(
                              child: IconButton(
                                  onPressed: () {
                                    val.AllOffers();
                                  },
                                  icon: Icon(Icons.refresh)),
                            ),
                ))
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: colorsApp.color_red_body,
          onPressed: () {
            dialogAddOffer.AddOffer(context);
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
