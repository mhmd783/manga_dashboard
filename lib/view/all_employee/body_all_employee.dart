import 'package:flutter/material.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/text_form_search.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:provider/provider.dart';

class BodyAllEmployee extends StatelessWidget {
  BodyAllEmployee({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorsApp colorsApp = new ColorsApp();
    return Consumer<control>(builder: (context, val, child) {
      return GridView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisExtent: 100),
        itemCount: val.all_employee_data['data'].length,
        itemBuilder: (context, i) {
          return Container(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              height: 80,
              width: 350,
              decoration: BoxDecoration(
                color: colorsApp.color_campain_container,
                borderRadius: BorderRadius.circular(50),
              ),
              child: ListTile(
                onTap: () {
                  val.GetOneEmployee(i);
                  Navigator.of(context).pushNamed("employee");
                },
                // trailing: IconButton(onPressed: () {}, icon: Icon(Icons.call)),
                title: Text("${val.all_employee_data['data'][i]['name']}"),
                subtitle: Text(
                    "${val.all_employee_data['data'][i]['specialization']}"),
                leading: CircleAvatar(
                  radius: 30,
                  child: Container(
                    height: 45,
                    width: 45,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "assets/images/person.jpeg",
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
