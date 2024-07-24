import 'package:flutter/material.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/text_form_search.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/home/dialog_logout.dart';
import 'package:provider/provider.dart';

class AppBarApp extends StatelessWidget {
  AppBarApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorsApp colorsApp = new ColorsApp();
    DialogLogOut dialogLogout = new DialogLogOut();
    return Consumer<control>(builder: (context, val, child) {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            //logo
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [colorsApp.colorlogo1, colorsApp.colorlogo2],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30)),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white.withOpacity(0.0),
                child: Image.asset("assets/images/mango.png"),
              ),
            ),
            // pages app
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: colorsApp.color_blak_app),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            val.changeAppBar("home");
                            Navigator.of(context).pushReplacementNamed("home");
                          },
                          child: Text(
                            "الرئيسيه",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () {
                            val.changeAppBar("tasks");
                            Navigator.of(context)
                                .pushReplacementNamed("allordersnotdone");
                          },
                          child: Text(
                            val.all_data_count != null
                                ? val.all_data_count['message'] == "All data."
                                    ? "مهام الموظفين ${val.all_data_count['data']['campaigns'] + val.all_data_count['data']['reels']}"
                                    : "مهام الموظفين"
                                : "مهام الموظفين",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () {
                            val.changeAppBar("employee");
                            Navigator.of(context)
                                .pushReplacementNamed("allemployee");
                          },
                          child: Text(
                            "الموظفين",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () {
                            val.changeAppBar("clients");
                            Navigator.of(context)
                                .pushReplacementNamed("allclients");
                          },
                          child: Text(
                            "العملاء",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () {
                            val.changeAppBar("offers");
                            Navigator.of(context)
                                .pushReplacementNamed("offers");
                          },
                          child: Text(
                            "العروض",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () {
                            val.changeAppBar("sub");
                            Navigator.of(context)
                                .pushReplacementNamed("supscription");
                          },
                          child: Text(
                            val.all_data_count != null
                                ? val.all_data_count['message'] == "All data."
                                    ? "الاشتراكات ${val.all_data_count['data']['subscriptions']}"
                                    : "الاشتراكات"
                                : "الاشتراكات",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () {
                            val.changeAppBar("finance");
                            Navigator.of(context)
                                .pushReplacementNamed("finances");
                          },
                          child: Text(
                            "الماليات",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () {
                            val.changeAppBar("salaryemployee");
                            Navigator.of(context)
                                .pushReplacementNamed("salaryemployee");
                          },
                          child: Text(
                            val.all_data_count != null
                                ? val.all_data_count['message'] == "All data."
                                    ? "مرتبات الموظفين ${val.all_data_count['data']['salaries']}"
                                    : "مرتبات الموظفين"
                                : "مرتبات الموظفين",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: val.screenMargin),
                  height: 3,
                  width: 40,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 17.0, // soften the shadow
                        spreadRadius: 6.0, //extend the shadow
                        offset: Offset(
                          1.0, // Move to right 5  horizontally
                          -10.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Expanded(child: Container()),

            //notificaion and person acount
            Container(
              margin: EdgeInsets.only(left: 10),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("search");
                    },
                    icon: Icon(
                      Icons.search,
                      size: 18,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white,
                child: IconButton(
                    onPressed: () {
                      dialogLogout.logout(context);
                    },
                    icon: Icon(
                      Icons.person_2_outlined,
                      size: 18,
                    )),
              ),
            ),
          ],
        ),
      );
    });
  }
}
