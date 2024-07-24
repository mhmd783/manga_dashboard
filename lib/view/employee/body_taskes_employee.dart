import 'package:flutter/material.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/text_form_search.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:provider/provider.dart';

class BodyTasksEmployee extends StatelessWidget {
  BodyTasksEmployee({super.key, required this.data});
  var data;
  @override
  Widget build(BuildContext context) {
    ColorsApp colorsApp = new ColorsApp();

    return Consumer<control>(builder: (context, val, child) {
      return val.datataskesemployee == null
          ? CircularProgressIndicator()
          : val.datataskesemployee['message'] == "Home Data."
              ? Container(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemCount: val.datataskesemployee['data'].length,
                    itemBuilder: (context, i) {
                      return MaterialButton(
                        onPressed: () {
                          //enter details task

                          //
                          val.datataskesemployee['data'][i]['type'] ==
                                  "campaign"
                              ?val.id_order_campain =
                              val.datataskesemployee['data'][i]['id']
                          :val.id_order_realse =
                              val.datataskesemployee['data'][i]['id'];
                          
                          val.datataskesemployee['data'][i]['type'] ==
                                  "campaign"
                              ?val.GetDetailsOrderCampain()
                          :val.GetDetailsOrderReals();
                          

                          val.datataskesemployee['data'][i]['type'] ==
                                  "campaign"
                              ? Navigator.of(context)
                                  .pushNamed("campainordersdetails")
                              : val.datataskesemployee['data'][i]['type'] ==
                                      "reels"
                                  ? Navigator.of(context)
                                      .pushNamed("realsordersdetails")
                                  : null;
                          //بدل قيمه نلل للي في السطر اللي فوق احط عرض للاوفر
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colorsApp.color_campain_container),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.topRight,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 100,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: Text(
                                    "${val.datataskesemployee['data'][i]['type']}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.shade400),
                                child: Icon(Icons.person_2_outlined),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  val.datataskesemployee['data'][i]['type'] ==
                                          "reels"
                                      ? "${val.datataskesemployee['data'][i]['first_name']} ${val.datataskesemployee['data'][i]['last_name']}"
                                      : "${val.datataskesemployee['data'][i]['user_first_name']} ${val.datataskesemployee['data'][i]['user_last_name']}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(val.datataskesemployee['data'][i]['type'] ==
                                      "campaign"
                                  ? "حمله اعلانيه (${val.datataskesemployee['data'][i]['order_type']})"
                                  : val.datataskesemployee['data'][i]['type'] ==
                                          "reels"
                                      ? "فديو ريلز"
                                      : "${val.datataskesemployee['data'][i]['offer_title']}"),
                              Text(
                                textAlign: TextAlign.center,
                                val.datataskesemployee['data'][i]['type'] ==
                                        "campaign"
                                    ? "${val.datataskesemployee['data'][i]['target']}... ${val.datataskesemployee['data'][i]['target_area']}"
                                    : val.datataskesemployee['data'][i]
                                                ['type'] ==
                                            "reels"
                                        ? "${val.datataskesemployee['data'][i]['product_name']}"
                                        : "",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  child:
                      IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
                );
    });
    // Consumer<control>(builder: (context, val, child) {
    //   return Container(
    //     child: GridView.builder(
    //       shrinkWrap: true,
    //       physics: ClampingScrollPhysics(),
    //       gridDelegate:
    //           SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
    //       itemCount: 10,
    //       itemBuilder: (context, i) {
    //         return Container(
    //           height: 200,
    //           width: 300,
    //           margin: EdgeInsets.all(10),
    //           padding: EdgeInsets.all(10),
    //           decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(20),
    //               color: colorsApp.color_campain_container),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Container(
    //                 alignment: Alignment.topRight,
    //                 child: Container(
    //                   alignment: Alignment.center,
    //                   width: 100,
    //                   height: 35,
    //                   decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(20),
    //                       color: Colors.white),
    //                   child: Text(
    //                     "حمله اعلانيه",
    //                     style: TextStyle(fontWeight: FontWeight.bold),
    //                   ),
    //                 ),
    //               ),
    //               Container(
    //                 margin: EdgeInsets.only(top: 20),
    //                 height: 40,
    //                 width: 40,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(20),
    //                     color: Colors.white),
    //                 child: ClipRRect(
    //                     borderRadius: BorderRadius.circular(30),
    //                     child: Image.asset(
    //                       "assets/images/person.jpeg",
    //                       fit: BoxFit.cover,
    //                     )),
    //               ),
    //               Container(
    //                 margin: EdgeInsets.symmetric(vertical: 10),
    //                 child: Text(
    //                   "mohamed hanafy",
    //                   style: TextStyle(fontWeight: FontWeight.bold),
    //                 ),
    //               ),
    //               Text("حمله اعلانيه (فيسبوك)"),
    //               Text(
    //                 textAlign: TextAlign.center,
    //                 "المنطقه القدس \n الهدف زياده عدد المتابعين",
    //                 style: TextStyle(color: Colors.grey),
    //               ),
    //             ],
    //           ),
    //         );
    //       },
    //     ),
    //   );
    // });
  }
}
