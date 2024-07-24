import 'package:flutter/material.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/text_form_search.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/home/dialog.dart';
import 'package:provider/provider.dart';

class BodyHomeCampain extends StatelessWidget {
  BodyHomeCampain(
      {super.key,
      required this.title,
      required this.num,
      required this.butt,
      required this.home_data});
  final String title;
  final int num;
  final String butt;
  var home_data;

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
                  child: Text("$num"),
                ),
                Expanded(child: Container()),
                MaterialButton(
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: colorsApp.color_campain_container,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text("$title"),
                  ),
                )
              ],
            ),
            Expanded(
                child: Container(
                    child: ListView.builder(
                        itemCount: num,
                        itemBuilder: (context, i) {
                          return Container(
                            child: ListTile(
                              onTap: () {
                                val.id_order_campain = home_data['data']
                                    ['campaigns']['$i']['campaign_id'];
                                Navigator.of(context)
                                    .pushNamed("campainordersdetails");
                              },
                              trailing: MaterialButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  val.api.id_task = val.id_order_realse =
                                      val.home_data['data']['campaigns']['$i']
                                          ['campaign_id'];
                                  val.api.task_type = "campaign";
                                  val.api.i_task = i;
                                  dialogHome.ChoseEmployee(context);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 70,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
                                  decoration: BoxDecoration(
                                      color: colorsApp.color_red_body,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Text("ارسال"),
                                ),
                              ),
                              title: Text(
                                "(${home_data['data']['campaigns']['$i']['order_type']})  اشتراك في حمله علي ",
                                style: TextStyle(color: Colors.black),
                              ),
                              subtitle: Text(
                                "${home_data['data']['campaigns']['$i']['user_first_name']} ${home_data['data']['campaigns']['$i']['user_last_name']}",
                                //"${home_data['data']['campaigns']['$i']['target']}.....${home_data['data']['campaigns']['$i']['target_area']}",
                                style: TextStyle(color: Colors.grey),
                              ),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.person_outline,
                                ),
                              ),
                            ),
                          );
                        })))
          ],
        ),
      );
    });
  }
}
