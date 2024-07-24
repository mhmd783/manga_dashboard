import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/text_form_search.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BodyDetailsOrder extends StatelessWidget {
  BodyDetailsOrder({super.key, required this.details_order_campain});
  var details_order_campain;

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
              leading: Text("${details_order_campain['data']['order_type']}"),
              trailing: Text("المنصه"),
            ),
            Divider(
              color: Colors.grey.shade300,
              height: 2,
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                        text:
                            "${details_order_campain['data']['instagram_link']}"));
                  },
                  icon: Icon(Icons.copy)),
              title: TextButton(
                onPressed: () async {
                  final Uri _url = Uri.parse(
                      '${details_order_campain['data']['instagram_link']}');
                  Uri url = Uri.parse(
                      '${details_order_campain['data']['instagram_link']}');
                  if (await canLaunchUrl(url)) {
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $_url');
                    }
                  }
                },
                child: Text(
                  "${details_order_campain['data']['instagram_link']}",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              trailing: Text("رابط الصفحه انستجرام"),
            ),
            Divider(
              color: Colors.grey.shade300,
              height: 2,
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                        text: "${details_order_campain['data']['post_link']}"));
                  },
                  icon: Icon(Icons.copy)),
              title: TextButton(
                onPressed: () async {
                  final Uri _url = Uri.parse(
                      '${details_order_campain['data']['instagram_post_link']}');
                  Uri url = Uri.parse(
                      '${details_order_campain['data']['instagram_post_link']}');
                  if (await canLaunchUrl(url)) {
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $_url');
                    }
                  }
                },
                child: Text(
                  "${details_order_campain['data']['instagram_post_link']}",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              trailing: Text("رابط المنشور علي انستجرام"),
            ),
            Divider(
              color: Colors.grey.shade300,
              height: 2,
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                        text:
                            "${details_order_campain['data']['facebook_link']}"));
                  },
                  icon: Icon(Icons.copy)),
              title: TextButton(
                onPressed: () async {
                  final Uri _url = Uri.parse(
                      '${details_order_campain['data']['facebook_link']}');
                  Uri url = Uri.parse(
                      '${details_order_campain['data']['facebook_link']}');
                  if (await canLaunchUrl(url)) {
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $_url');
                    }
                  }
                },
                child: Text(
                  "${details_order_campain['data']['facebook_link']}",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              trailing: Text("رابط الصفحه فيسبوك"),
            ),
            Divider(
              color: Colors.grey.shade300,
              height: 2,
            ),

            ///
            ListTile(
              leading: IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                        text:
                            "${details_order_campain['data']['facebook_post_link']}"));
                  },
                  icon: Icon(Icons.copy)),
              title: TextButton(
                onPressed: () async {
                  final Uri _url = Uri.parse(
                      '${details_order_campain['data']['facebook_post_link']}');
                  Uri url = Uri.parse(
                      '${details_order_campain['data']['facebook_post_link']}');
                  if (await canLaunchUrl(url)) {
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $_url');
                    }
                  }
                },
                child: Text(
                  "${details_order_campain['data']['facebook_post_link']}",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              trailing: Text("رابط المنشور علي فيسيوك"),
            ),
            Divider(
              color: Colors.grey.shade300,
              height: 2,
            ),
            ListTile(
              leading: Text("${details_order_campain['data']['target']}"),
              trailing: Text("الهدف من الحمله"),
            ),
            Divider(
              color: Colors.grey.shade300,
              height: 2,
            ),
            ListTile(
              leading: Text("${details_order_campain['data']['day_price']}\$"),
              trailing: Text("الميزاميه اليويميه"),
            ),
            Divider(
              color: Colors.grey.shade300,
              height: 2,
            ),
            ListTile(
              leading: Text("${details_order_campain['data']['target_area']}"),
              trailing: Text("الجمهور المستهدف"),
            ),
          ],
        ),
      );
    });
  }
}
