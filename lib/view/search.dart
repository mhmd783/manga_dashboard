import 'package:flutter/material.dart';
import 'package:mango_dash_board/companent/app_bar_simple.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/text_form_search.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/search/body_search.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Search();
  }
}

class _Search extends State<Search> {
  GlobalKey<FormState> formstate1 = GlobalKey();
  GlobalKey<FormState> formstate2 = GlobalKey();
  GlobalKey<FormState> formstate3 = GlobalKey();
  ColorsApp colorsApp = new ColorsApp();
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
                child: Column(
                  children: [
                    AppBarAppSimple(),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Form(
                                key: formstate1,
                                child: TextFormAppSearch(
                                    hintText: "بحث بالاسم",
                                    controll: val.api.search_client,
                                    icon: IconButton(
                                        onPressed: () {
                                          if (formstate1.currentState!
                                              .validate()) {
                                            val.Search();
                                            print("validat");
                                          } else {
                                            print("not validat");
                                          }
                                        },
                                        icon: Icon(Icons.search)),
                                    keyboard: TextInputType.text),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: 300,
                              child: Form(
                                key: formstate2,
                                child: TextFormAppSearch(
                                    hintText: "بحث بالايميل ",
                                    controll: val.api.search_email_client,
                                    icon: IconButton(
                                        onPressed: () {
                                          if (formstate2.currentState!
                                              .validate()) {
                                            val.SearchEmail();
                                            print("validat");
                                          } else {
                                            print("not validat");
                                          }
                                        },
                                        icon: Icon(Icons.search)),
                                    keyboard: TextInputType.text),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: 300,
                              child: Form(
                                key: formstate3,
                                child: TextFormAppSearch(
                                    hintText: "بحث برقم التلفون",
                                    controll: val.api.search_phone_client,
                                    icon: IconButton(
                                        onPressed: () {
                                          if (formstate3.currentState!
                                              .validate()) {
                                            val.SearchPhone();
                                            print("validat");
                                          } else {
                                            print("not validat");
                                          }
                                        },
                                        icon: Icon(Icons.search)),
                                    keyboard: TextInputType.text),
                              )),
                        ),
                      ],
                    ),
                    Expanded(
                        child: Container(
                      child: BodySearch(color: Colors.white),
                    )),
                  ],
                ),
              ),
      );
    });
  }
}
