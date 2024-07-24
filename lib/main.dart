import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:mango_dash_board/view/add_employee.dart';
import 'package:mango_dash_board/view/all_clients.dart';
import 'package:mango_dash_board/view/all_employee.dart';
import 'package:mango_dash_board/view/client_profile.dart';
import 'package:mango_dash_board/view/employee.dart';
import 'package:mango_dash_board/view/employee/edit_employee.dart';
import 'package:mango_dash_board/view/finances.dart';
import 'package:mango_dash_board/view/home.dart';
import 'package:mango_dash_board/view/login.dart';
import 'package:mango_dash_board/view/campain_orders_details.dart';
import 'package:mango_dash_board/view/offers.dart';
import 'package:mango_dash_board/view/allOrdersNotDone.dart';
import 'package:mango_dash_board/view/reals_order_datails.dart';
import 'package:mango_dash_board/view/salary_employee.dart';
import 'package:mango_dash_board/view/search.dart';
import 'package:mango_dash_board/view/supscription.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  await Hive.openBox('idadmin');
  await Hive.openBox('nameadmin');
  await Hive.openBox('emailadmin');
  await Hive.openBox('imageadmin');
  await Hive.openBox('tokenadmin');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    late Box tokenbox = Hive.box("tokenadmin");
    return ChangeNotifierProvider(
        create: (context) {
          return control();
        },
        child: MaterialApp(
          theme: ThemeData(), 
          debugShowCheckedModeBanner: false,
          routes: {
            "login": (context) => Login(),
            "home": (context) => Home(),
            "clientprofile": (context) => ClientProfile(),
            "campainordersdetails": (ontext) => CampainOrdersDetails(),
            "employee": (context) => Employee(),
            "allemployee": (context) => AllEmployee(),
            "realsordersdetails": (context) => RealsOrdersDetails(),
            "allclients": (context) => AllClients(),
            "addemployee": (context) => AddEmployee(),
            "editemployee": (context) => EditEmployee(),
            "offers": (context) => Offers(),
            "supscription": (context) => Supscription(),
            "salaryemployee":(context)=>SalaryEmployee(),
            "allordersnotdone":(context)=>AllOrdersNotDone(),
            "finances":(context)=>Finances(),
            "search":(context)=>Search()
          },
          //home: Search(),
          home:tokenbox.get("token")==null? Login():Home(),
        ));
  }
}
