import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mango_dash_board/companent/app_bar_simple.dart';
import 'package:mango_dash_board/view/employee/body_data_employee.dart';
import 'package:mango_dash_board/view/client/body_profile_client.dart';
import 'package:mango_dash_board/view/employee/body_taskes_employee.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/container_order.dart';
import 'package:mango_dash_board/companent/photo_profile.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/employee/dialog_employee.dart';
import 'package:provider/provider.dart';

class Employee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Employee();
  }
}

class _Employee extends State<Employee> {
  DialogEmployee dialogEmployee = new DialogEmployee();
  ColorsApp colorsApp = new ColorsApp();
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).Employee();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<control>(builder: (context, val, child) {
      return Scaffold(
        body:  MediaQuery.of(context).size.width < 1000 ||
                MediaQuery.of(context).size.height < 600
            ? Container(
                child: Center(
                  child: Text("كبر حجم الشاشه"),
                ),
              )
            :Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //app bar
                AppBarAppSimple(),
                //photo profile
                PhotoProfile(
                  imagefile: val.image_employee,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "${val.one_employee['name']}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Text("${val.one_employee['email']}"),
                ),
                //body
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 45,
                      width: 500,
                      margin: EdgeInsets.only(left: 20, top: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: colorsApp.color_blak_app),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white,
                                child: IconButton(
                                    onPressed: () {
                                      dialogEmployee.DeleteEmployee(context);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      size: 15,
                                    )),
                              ),
                            ),
                            Expanded(
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white,
                                child: IconButton(
                                    onPressed: () {
                                      val.StoreOldDataEmployee();
                                      Navigator.of(context)
                                          .pushNamed("editemployee");
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      size: 15,
                                    )),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: TextButton(
                                  onPressed: () {
                                    val.changeBodyEmployee("data");
                                  },
                                  child: Text(
                                    "بيانات الموظف",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                            ),
                            Expanded(
                              flex: 3,
                              child: TextButton(
                                  onPressed: () {
                                    val.changeBodyEmployee("alltaskes");
                                    val.GetTaskesDone(val.one_employee['id']);
                                    print(val.one_employee['id']);
                                  },
                                  child: Text(
                                    "كل المهام",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                            ),
                            Expanded(
                              flex: 3,
                              child: TextButton(
                                  onPressed: () {
                                    val.changeBodyEmployee("todaytaskes");

                                    val.GetTaskesNotDone(
                                        val.one_employee['id']);
                                    print(val.one_employee['id']);
                                  },
                                  child: Text(
                                    "المهام اليوميه",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                            ),
                          ]),
                    ),
                    Container(
                      //310/190/60
                      margin: EdgeInsets.only(
                          right: val.body_employee == "data"
                              ? 310
                              : val.body_employee == "alltaskes"
                                  ? 190
                                  : 60),
                      height: 5,
                      width: 40,
                      color: colorsApp.color_yellow_body,
                    )
                  ],
                ),
                //data employee
                val.body_employee == "data"
                    ? BodyDataEmployee()
                    : val.datataskesemployee == null
                        ? CircularProgressIndicator()
                        : val.datataskesemployee['message'] == "Home Data."
                            ? BodyTasksEmployee(
                                data: val.datataskesemployee,
                              )
                            : IconButton(
                                onPressed: () {
                                  val.GetTaskesDone(val.one_employee['id']);
                                },
                                icon: Icon(Icons.refresh)),
              ],
            ),
          ),
        ),
      );
    });
  }
}
