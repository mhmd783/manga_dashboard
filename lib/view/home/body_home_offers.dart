import 'package:flutter/material.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/home/dialog.dart';
import 'package:provider/provider.dart';

class BodyHomeSub extends StatelessWidget {
  BodyHomeSub(
      {super.key,
      required this.title,
      required this.num,
      required this.butt,
      required this.data_sub});
  final String title;
  final int num;
  final String butt;
  var data_sub;

  @override
  Widget build(BuildContext context) {
    DialogHome dialogHome = new DialogHome();
    ColorsApp colorsApp = new ColorsApp();
    return Consumer<control>(builder: (context, val, child) {
      return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Text("${data_sub['data'].length}"),
                ),
                Expanded(child: Container()),
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      color: colorsApp.color_campain_container,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text("$title"),
                )
              ],
            ),
            Expanded(
                child: Container(
                    child: ListView.builder(
                        itemCount: data_sub['data'].length,
                        itemBuilder: (context, i) {
                          return Container(
                              child: ListTile(
                            onTap: () {
                              val.id_user = data_sub['data'][i]['user_id'];
                              val.GetUserData();
                              Navigator.of(context).pushNamed("clientprofile");
                            },
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.grey.shade400,
                              child: Icon(Icons.person_2_outlined),
                            ),
                            title: Text(
                              "${data_sub['data'][i]['user_first_name']} ${data_sub['data'][i]['user_last_name']}",
                            ),
                            subtitle: Text(
                              data_sub['data'][i]['subscription_status'] ==
                                      "sub"
                                  ? "${data_sub['data'][i]['title']}طلب اشتراك في"
                                  : "${data_sub['data'][i]['title']}طلب الغاء اشتراك في",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ));
                        })))
          ],
        ),
      );
    });
  }
}
