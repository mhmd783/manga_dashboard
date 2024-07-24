import 'package:flutter/material.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/text_form_search.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/home/dialog.dart';
import 'package:provider/provider.dart';

class BodyAllOrdersRealse extends StatelessWidget {
  BodyAllOrdersRealse(
      {super.key,
      required this.title,
      required this.num,
      required this.butt,
      required this.data});
  final String title;
  final int num;
  final String butt;
  var data;

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
                        itemCount: num,
                        itemBuilder: (context, i) {
                          return Container(
                            child: ListTile(
                              onTap: () {
                                print(
                                    data['data']['reels']['$i']['employee_id']);
                                val.StoreOneEmployee(
                                    data['data']['reels']['$i']['employee_id']);
                                Navigator.of(context).pushNamed("employee");
                              },
                              title: Text(
                                "(${data['data']['reels']['$i']['product_name']}) فديو ريلز",
                                style: TextStyle(color: Colors.black),
                              ),
                              subtitle: Text(
                                "${data['data']['reels']['$i']['employee_name']} اسم الموظف",
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