import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/text_form_search.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/exports/dialog.dart';
import 'package:mango_dash_board/view/home/dialog.dart';
import 'package:mango_dash_board/view/import/dialog.dart';
import 'package:mango_dash_board/view/supscription/dialog.dart';
import 'package:provider/provider.dart';

class BodyImport extends StatelessWidget {
  BodyImport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorsApp colorsApp = new ColorsApp();
    DialogImport dialogImport = new DialogImport();
    return Consumer<control>(builder: (context, val, child) {
      return Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 183, 251, 185),
                      borderRadius: BorderRadius.circular(30)),
                  child: Text("${val.amountImport}"),
                ),
                Expanded(child: Container()),
               
                CircleAvatar(
                  backgroundColor: colorsApp.color_red_body,
                  child: IconButton(
                      onPressed: () {
                        dialogImport.AddImport(context);
                      },
                      icon: Icon(Icons.add)),
                ),
                 SizedBox(
                  width: 10,
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: colorsApp.color_blak_app,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "الايرادات",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            Expanded(
              child: val.data_import == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : val.data_import['message'] == "All income data."||val.data_import['message'] == "Income data found."
                      ? Container(
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, mainAxisExtent: 250),
                            itemCount: val.data_import['data'].length,
                            itemBuilder: (context, i) {
                              return Container(
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 244, 238, 184),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Text(
                                          "${val.data_import['data'][i]['order_type']}"),
                                      trailing: Text("نوع الاوردر"),
                                    ),
                                    ListTile(
                                      leading: Text(
                                          "${Jiffy.parse(val.data_import['data'][i]['created_at']).format(pattern: 'yyyy-MM-dd')}"),
                                      trailing: Text("تاريخ"),
                                    ),
                                    ListTile(
                                      leading: Text(
                                          "${val.data_import['data'][i]['amount']}"),
                                      trailing: Text("المبلغ"),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      : Center(
                          child: IconButton(
                              onPressed: () {
                                val.DataImport();
                              },
                              icon: Icon(Icons.refresh_rounded)),
                        ),
            ),
          ],
        ),
      );
    });
  }
}
