import 'package:flutter/material.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/text_form_app.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:provider/provider.dart';

class DialogAddOffer {
  ColorsApp colorsApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  Future<void> AddOffer(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<control>(builder: (context, val, child) {
          return Form(
            key: formstate,
            child: AlertDialog(
              backgroundColor: Colors.white,
              shadowColor: Colors.white,

              scrollable: true,
              // titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
              // title: Text('Verify'),
              elevation: 10,
              content: Container(
                  padding: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/images/mango.png"),
                      ),
                      Container(
                        height: 50,
                        width: 100,
                        child: Image.asset(
                          "assets/images/mangomedia.png",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Divider(
                          height: 1,
                          color: Colors.grey.shade300,
                          thickness: 2,
                          endIndent: 100,
                          indent: 100,
                        ),
                      ),
                      Container(
                          width: 400,
                          child: TextFormApp(
                              hintText: "عنوان العرض",
                              controll: val.api.title_offer,
                              keyboard: TextInputType.text)),
                      Container(
                        width: 400,
                        child: TextFormApp(
                            hintText: "وصف العرض",
                            controll: val.api.description_offer,
                            keyboard: TextInputType.text),
                      ),
                      Container(
                        width: 400,
                        child: TextFormAppInt(
                            hintText: "سعر الاشتراك الشهري",
                            controll: val.api.price_offer,
                            keyboard: TextInputType.text),
                      ),
                      Container(
                        width: 400,
                        child: TextFormAppInt(
                            hintText: "عدد فديوهات الاشتراك",
                            controll: val.api.number_realse_offer,
                            keyboard: TextInputType.text),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("يشمل الحملات بلا حدود"),
                          Checkbox(
                              activeColor: colorsApp.color_grean_body,
                              value: val.choseCampaign,
                              onChanged: (value) {
                                val.choseCampaignforOffer(value!);
                                print(value);
                                print(val.choseCampaign);
                                print(val.api.status_campaign_offer);
                              }),
                        ],
                      ),
                    ],
                  )),
              actions: <Widget>[
                Consumer<control>(builder: (context, val, child) {
                  return Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: colorsApp.color_yellow_body,
                        ),
                        child: MaterialButton(
                          child: Text(
                            "ارسال",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            if (formstate.currentState!.validate()) {
                              val.AddOffer();
                              Navigator.of(context).pop();
                              CheckAddOffer(context);
                              print("validat");
                            } else {
                              print("not validat");
                            }
                          },
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          );
        });
      },
    );
  }

  Future<void> CheckAddOffer(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<control>(builder: (context, val, child) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,

            scrollable: true,
            // titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            // title: Text('Verify'),
            elevation: 10,
            content: Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Image.asset("assets/images/mango.png"),
                    ),
                    Container(
                      height: 50,
                      width: 100,
                      child: Image.asset(
                        "assets/images/mangomedia.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        height: 1,
                        color: Colors.grey.shade300,
                        thickness: 2,
                        endIndent: 100,
                        indent: 100,
                      ),
                    ),
                    val.add_offer == null
                        ? CircularProgressIndicator()
                        : Container(
                            child: val.add_offer['message'] ==
                                    "Offer created successfully."
                                ? Text(
                                    "تم الارسال",
                                    style: TextStyle(
                                        color: colorsApp.color_grean_body,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(
                                    "خطاء",
                                    style: TextStyle(
                                        color: colorsApp.color_red_body,
                                        fontWeight: FontWeight.bold),
                                  ),
                          )
                  ],
                )),
            actions: <Widget>[
              Consumer<control>(builder: (context, val, child) {
                return Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colorsApp.color_yellow_body,
                  ),
                  child: MaterialButton(
                    child: Text(
                      "تم",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                );
              }),
            ],
          );
        });
      },
    );
  }
}
