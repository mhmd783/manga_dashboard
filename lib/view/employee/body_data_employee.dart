import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/text_form_search.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:provider/provider.dart';

class BodyDataEmployee extends StatelessWidget {
  BodyDataEmployee({
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
              leading: Text("${val.one_employee['name']}"),
              trailing: Text("الاسم"),
            ),
            Divider(
              color: Colors.grey.shade300,
              height: 2,
            ),
            ListTile(
              title: Text("${val.one_employee['specialization']}",
                  style: TextStyle(fontSize: 12)),
              trailing: Text("المسمي الوظيفي"),
            ),
            Divider(
              
              color: Colors.grey.shade300,
              height: 2,
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                        text: "${val.one_employee['email']}"));
                  },
                  icon: Icon(Icons.copy)),
              title: Text("${val.one_employee['email']}",
                  style: TextStyle(fontSize: 12)),
              trailing: Text("الايميل"),
            ),
            Divider(
              color: Colors.grey.shade300,
              height: 2,
            ),
            ListTile(
               leading: IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                        text: "${val.one_employee['phone']}"));
                  },
                  icon: Icon(Icons.copy)),
              title: Text("${val.one_employee['phone']}",
                  style: TextStyle(fontSize: 12)),
              trailing: Text("رقم الهاتف"),
            ),
            Divider(
              color: Colors.grey.shade300,
              height: 2,
            ),
            ListTile(
              leading: Text("${val.one_employee['salary']}"),
              trailing: Text("الراتب"),
            ),
          ],
        ),
      );
    });
  }
}
