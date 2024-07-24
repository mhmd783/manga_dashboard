import 'package:flutter/material.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/text_form_search.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/home/dialog.dart';
import 'package:mango_dash_board/view/supscription/dialog.dart';
import 'package:provider/provider.dart';

class BodySupscription extends StatelessWidget {
  BodySupscription(
      {super.key,
      required this.color,
      required this.title,
      required this.image});
  final Color color;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    DialogHome dialogHome = new DialogHome();
    ColorsApp colorsApp = new ColorsApp();
    DialogSupscription dialogSupscription = new DialogSupscription();
    return Consumer<control>(builder: (context, val, child) {
      return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: val.all_sub_notpay == null
            ? Center(child: CircularProgressIndicator())
            : val.all_sub_notpay['message'] == "No data found."
                ? Center(
                    child: Text(
                      'لا يوجد بيانات',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  )
                : val.all_sub_notpay['message'] == "Payment data."
                    ? Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.asset("$image"),
                              ),
                              Expanded(child: Container()),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(title),
                              )
                            ],
                          ),
                          Expanded(
                            child: Container(
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4, mainAxisExtent: 250),
                                itemCount: val.all_sub_notpay['data'].length,
                                itemBuilder: (context, i) {
                                  return Container(
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          onTap: () {
                                            print(val.all_sub_notpay['data'][i]
                                                ['user_id']);
                                            val.id_user =
                                                val.all_sub_notpay['data'][i]
                                                    ['user_id'];
                                            val.GetUserData();
                                            Navigator.of(context)
                                                .pushNamed("clientprofile");
                                          },
                                          title: Text(
                                              "${val.all_sub_notpay['data'][i]['user']['first_name']} ${val.all_sub_notpay['data'][i]['user']['last_name']}"),
                                          subtitle: Text(
                                              "${val.all_sub_notpay['data'][i]['user']['email']}"),
                                          leading: CircleAvatar(
                                            child:
                                                Icon(Icons.person_2_outlined),
                                          ),
                                        ),
                                        ListTile(
                                          leading: Text(
                                              "${val.all_sub_notpay['data'][i]['pay_date']}"),
                                          trailing: Text("تاريخ السداد"),
                                        ),
                                        ListTile(
                                          leading: Text(
                                              "${val.all_sub_notpay['data'][i]['price_sub_monthe']}"),
                                          trailing:
                                              Text("المبلغ المطلوب سداده"),
                                        ),
                                        Expanded(child: SizedBox()),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: MaterialButton(
                                                padding: EdgeInsets.all(0),
                                                onPressed: () {
                                                  dialogSupscription
                                                      .InSurePaySupscription(
                                                          context,
                                                          val.all_sub_notpay[
                                                                  'data'][i]
                                                              ['user_id'].toString(),
                                                          val.all_sub_notpay[
                                                              'data'][i]['id'].toString());
                                                  
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                      color: colorsApp
                                                          .color_red_body,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      20))),
                                                  child: Text(
                                                    "تاكيد عمليه السداد",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: MaterialButton(
                                                padding: EdgeInsets.all(0),
                                                onPressed: () {
                                                  dialogSupscription
                                                      .SendNotificatioToUserForRemperPaySupscription(
                                                          context,val.all_sub_notpay[
                                                                  'data'][i]
                                                              ['user_id']);
                                                },
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 2),
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                      color: colorsApp
                                                          .color_red_body,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                  child: Text(
                                                    "ارسال اشعار",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: IconButton(
                            onPressed: () {
                              val.AllSubNotPay();
                            },
                            icon: Icon(Icons.refresh)),
                      ),
      );
    });
  }
}
