import 'package:flutter/material.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/text_form_search.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/home/dialog.dart';
import 'package:provider/provider.dart';

class BodyAllClients extends StatelessWidget {
  BodyAllClients(
      {super.key, required this.title, required this.num, required this.data});
  final String title;
  final int num;
  var data;

  @override
  Widget build(BuildContext context) {
    DialogHome dialogHome = new DialogHome();
    ColorsApp colorsApp = new ColorsApp();
    return Consumer<control>(builder: (context, val, child) {
      return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Text("${data['data'].length}"),
                ),
                Expanded(child: Container()),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: colorsApp.color_campain_container,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text("$title"),
                )
              ],
            ),
            Expanded(
                child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: num, mainAxisExtent: 100),
                        itemCount: data['data'].length,
                        itemBuilder: (context, i) {
                          return Container(
                            child: ListTile(
                              onTap: () {
                                val.id_user = data['data'][i]['id'];
                                val.GetUserData();
                                //مهم
                                //val.ConvertUsertoold(data['data'][i]['id']);
                                Navigator.of(context)
                                    .pushNamed("clientprofile");
                              },
                              title: Text(
                                  "${data['data'][i]['first_name']} ${data['data'][i]['last_name']}"),
                              subtitle: Text(
                                "${data['data'][i]['email']}",
                                style: TextStyle(color: Colors.grey),
                              ),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade400,
                                child: Icon(Icons.person_2_outlined),
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
