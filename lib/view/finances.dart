import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mango_dash_board/companent/app_bar.dart';
import 'package:mango_dash_board/view/allclients/body_all_clients.dart';
import 'package:mango_dash_board/view/exports/body_export.dart';
import 'package:mango_dash_board/view/home/body_home_campain.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/home/body_home_offers.dart';
import 'package:mango_dash_board/view/home/body_home_realse.dart';
import 'package:mango_dash_board/view/home/dialog.dart';
import 'package:mango_dash_board/view/import/body_import.dart';
import 'package:provider/provider.dart';

class Finances extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Finances();
  }
}

class _Finances extends State<Finances> {
  ColorsApp colorsApp = new ColorsApp();
  DialogHome dialogHome = new DialogHome();
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).DataImport();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).DataExport();
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
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 183, 251, 185),
                                borderRadius: BorderRadius.circular(30)),
                            child: Text("${val.calculatincomeOutcome}"),
                          ),
                          Expanded(child: Container()),
                          Container(
                            alignment: Alignment.center,
                            padding:
                                EdgeInsets.only(left: 15, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                color: colorsApp.color_blak_app,
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              children: [
                                MaterialButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2023),
                                      lastDate: DateTime.now(),
                                    ).then((value) {
                                      if (value != null) {
                                        val.api.startDate = value.toString();

                                        val.api.startDate =
                                            Jiffy.parse(val.api.startDate)
                                                .format(pattern: 'yyyy-MM-dd');

                                        val.changeDateStartImport();
                                      }
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Text(
                                      val.api.startDate == "null"
                                          ? "اختر تاريخ البدايه"
                                          : "${val.api.startDate} :تارخ البدايه",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                MaterialButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2023),
                                      lastDate: DateTime.now(),
                                    ).then((value) {
                                      if (value != null) {
                                        val.api.endDate = value.toString();

                                        val.api.endDate =
                                            Jiffy.parse(val.api.endDate)
                                                .format(pattern: 'yyyy-MM-dd');
                                        print(val.api.endDate);
                                        val.changeDateEndImport();
                                      }
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Text(
                                      val.api.endDate == "null"
                                          ? "اختر تاريخ النهايه "
                                          : "${val.api.endDate} :تاريخ النهايه",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {
                                    if (val.api.startDate != "null" &&
                                        val.api.endDate != "null") {
                                      if (Jiffy.parse(val.api.startDate)
                                              .isBefore(Jiffy.parse(
                                                  val.api.endDate)) ||
                                          val.api.startDate ==
                                              val.api.endDate) {
                                        val.DataImport();
                                        val.DataExport();
                                      } else {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              backgroundColor:
                                                  Colors.grey.withOpacity(0.7),
                                              elevation: 20,
                                              content: Text(
                                                "يجب ان يكون تاريخ النهايه اكبر من تاريخ البدايه او يساويه",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ),
                                              duration: Duration(seconds: 3),
                                            ),
                                          );
                                        });
                                      }
                                    } else {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            backgroundColor:
                                                Colors.grey.withOpacity(0.7),
                                            elevation: 20,
                                            content: Text(
                                              " الرجاء ادخال تاريخ البدايه والنهايه",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                            ),
                                            duration: Duration(seconds: 3),
                                          ),
                                        );
                                      });
                                    }
                                  },
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.search),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(child: BodyImport()),
                            //campains
                            Expanded(
                              child: BodyExport(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      );
    });
  }
}
