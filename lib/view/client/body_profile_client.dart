import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BodyProfileClient extends StatelessWidget {
  BodyProfileClient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorsApp colorsApp = new ColorsApp();
    return Consumer<control>(builder: (context, val, child) {
      return Container(
        margin: EdgeInsets.all(20),
        width: 500,
        //height: 300,
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black,
                width: 1,
                style: BorderStyle.solid,
                strokeAlign: BorderSide.strokeAlignCenter),
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            ListTile(
              title: Text(
                "${val.user_data['data']['first_name']} ${val.user_data['data']['last_name']}",
                style: TextStyle(fontSize: 12),
              ),
              trailing: Text("الاسم"),
            ),
            Divider(
              color: Colors.grey.shade300,
              height: 2,
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                        text: "${val.user_data['data']['email']}"));
                  },
                  icon: Icon(Icons.copy)),
              title: Text(
                "${val.user_data['data']['email']}",
                style: TextStyle(fontSize: 12),
              ),
              trailing: Text("الايميل"),
            ),
            Divider(
              color: Colors.grey.shade300,
              height: 2,
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () async {
                    Clipboard.setData(ClipboardData(
                        text: "${val.user_data['data']['phone']}"));
                  },
                  icon: Icon(Icons.copy)),
              title: Text(
                "${val.user_data['data']['phone']}",
                style: TextStyle(fontSize: 12),
              ),
              trailing: Text("رقم الهاتف"),
            ),
            Divider(
              color: Colors.grey.shade300,
              height: 2,
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                        text: "${val.user_data['data']['address']}"));
                  },
                  icon: Icon(Icons.copy)),
              title: Text(
                "${val.user_data['data']['address']}",
                style: TextStyle(fontSize: 12),
              ),
              trailing: Text("العنوان"),
            ),

            val.user_data['data']['polls'].length != 0
                ? Column(
                    children: [
                      Divider(
                        color: Colors.grey.shade300,
                        height: 2,
                      ),
                      ListTile(
                        leading: IconButton(
                            onPressed: () {
                              Clipboard.setData(ClipboardData(
                                  text:
                                      "${val.user_data['data']['polls'][0]['facebook_link']}"));
                            },
                            icon: Icon(Icons.copy)),
                        title: TextButton(
                          onPressed: () async {
                            final Uri _url = Uri.parse(
                                '${val.user_data['data']['polls'][0]['facebook_link']}');
                            Uri url = Uri.parse(
                                '${val.user_data['data']['polls'][0]['facebook_link']}');
                            if (await canLaunchUrl(url)) {
                              if (!await launchUrl(url)) {
                                throw Exception('Could not launch $_url');
                              }
                            }
                          },
                          child: Text(
                            "${val.user_data['data']['polls'][0]['facebook_link']}",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        trailing: Text("حساب فيسبوك"),
                      ),
                      //
                      Divider(
                        color: Colors.grey.shade300,
                        height: 2,
                      ),
                      ListTile(
                        leading: IconButton(
                            onPressed: () {
                              Clipboard.setData(ClipboardData(
                                  text:
                                      "${val.user_data['data']['polls'][0]['instagram_link']}"));
                            },
                            icon: Icon(Icons.copy)),
                        title: TextButton(
                          onPressed: () async {
                            final Uri _url = Uri.parse(
                                '${val.user_data['data']['polls'][0]['instagram_link']}');
                            Uri url = Uri.parse(
                                '${val.user_data['data']['polls'][0]['instagram_link']}');
                            if (await canLaunchUrl(url)) {
                              if (!await launchUrl(url)) {
                                throw Exception('Could not launch $_url');
                              }
                            }
                          },
                          child: Text(
                            "${val.user_data['data']['polls'][0]['instagram_link']}",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        trailing: Text("حساب انستجرام"),
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        height: 2,
                      ),
                      ListTile(
                        title: Text(
                          "${val.user_data['data']['polls'][0]['status_in_media']}",
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: Text("اعماله السابقه"),
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        height: 2,
                      ),
                      ListTile(
                        title: Text(
                          "${val.user_data['data']['polls'][0]['note']}",
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: Text("ملاحظه"),
                      ),
                    ],
                  )
                : SizedBox(),

            //sub data
            val.user_data["data"]['latest_subscription'].length != 0
                ? Container(
                    child: Column(
                      children: [
                        Divider(
                          color: Colors.grey.shade300,
                          height: 2,
                        ),
                        ListTile(
                          title: Text(
                            "${val.user_data["data"]['latest_subscription']['title']}",
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing: Text("العنوان"),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          height: 2,
                        ),
                        ListTile(
                          title: Text(
                            "${val.user_data["data"]['latest_subscription']['description']}",
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing: Text("الوصف"),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          height: 2,
                        ),
                        ListTile(
                          title: Text(
                            "${val.user_data["data"]['latest_subscription']['price_sub_monthe']}",
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing: Text("السعر"),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          height: 2,
                        ),
                        ListTile(
                          title: Text(
                            "${val.user_data["data"]['latest_subscription']['num_of_reels']}/${val.user_data["data"]['latest_subscription']['num_of_reels_sub']}",
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing: Text("عدد الفديوهات"),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          height: 2,
                        ),
                        ListTile(
                          title: Text(
                            val.user_data['data']['latest_subscription']
                                        ['status_campaign'] ==
                                    "true"
                                ? "مغعله"
                                : "غير مفعله",
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing: Text("الحملات"),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          height: 2,
                        ),
                        ListTile(
                          title: Text(
                            "${val.user_data["data"]['latest_subscription']['pay_date']}",
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing: Text("تاريخ الدفع"),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
          ],
        ),
      );
    });
  }
}
