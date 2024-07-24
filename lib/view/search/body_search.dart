import 'package:flutter/material.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/text_form_search.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:provider/provider.dart';

class BodySearch extends StatelessWidget {
  BodySearch({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    ColorsApp colorsApp = new ColorsApp();
    return Consumer<control>(builder: (context, val, child) {
      return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: val.search == null
            ? Center(
                child: Text(
                'لا يوجد بيانات',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ))
            : val.search['message'] == "User not found"
                ? Center(
                    child: Text(
                      'لا يوجد بيانات',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  )
                : val.search['message'] == "User found"||val.search['message'] == "User found."
                    ? Container(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4, mainAxisExtent: 220),
                          itemCount: 1, // val.search['data'].length,
                          itemBuilder: (context, i) {
                            return Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: colorsApp.color_yellow_body,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      print(val.search['data']['id']);
                                      val.id_user = val.search['data']['id'];
                                      val.GetUserData();
                                      Navigator.of(context)
                                          .pushNamed("clientprofile");
                                    },
                                    title: Text(
                                        "${val.search['data']['first_name']} ${val.search['data']['last_name']}"),
                                    subtitle:
                                        Text("${val.search['data']['email']}"),
                                    leading: CircleAvatar(
                                      child: Icon(Icons.person_2_outlined),
                                    ),
                                  ),
                                  ListTile(
                                    leading:
                                        Text("${val.search['data']['phone']}"),
                                    trailing: Text("رقم تلفون"),
                                  ),
                                  ListTile(
                                    leading: Text(val.search['data']
                                                ['user_status'] ==
                                            "old"
                                        ? "الحساب نشط"
                                        : "الحساب لم يوافق عليه"),
                                    trailing: Text("حاله الحساب"),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: Text(
                          'لا يوجد بيانات',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ),
      );
    });
  }
}
