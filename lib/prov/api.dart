import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class ApiApp {
  
  String ip = "https://mangamediaa.com/mango/public";
  //home
  var home_data = null;
  Future Home() async {
    home_data = null;
    String url = "$ip/api/admin/home";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        home_data = responsebody;

        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return home_data;
  }

  int id_task = 0;
  int i_task = 0;
  int i_employee = 0;
  TextEditingController salaryCampain = TextEditingController();
  int id_employee = 0;
  String task_type = "";

  var send_order;
  Future SendOrder() async {
    send_order = null;
    String url = "$ip/api/admin/send-taske-to-emploeesye";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "employee_id": id_employee.toString(),
          "task_id": id_task.toString(),
          "task_type": task_type,
          "price_sub_monthe": "${salaryCampain.text.toString()}"
        },
        headers: {'Accept': 'application/json'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        send_order = responsebody;
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return send_order;
  }

  //offers
  TextEditingController title_offer = TextEditingController();
  TextEditingController description_offer = TextEditingController();
  TextEditingController price_offer = TextEditingController();
  TextEditingController number_realse_offer = TextEditingController();
  String status_campaign_offer = 'false';
  var add_offer;
  Future AddOffer() async {
    add_offer = null;
    String url = "$ip/api/admin/create/offer";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "title": "${title_offer.text}",
          "description": "${description_offer.text}",
          "price": "${price_offer.text}",
          "num_of_reels": "${number_realse_offer.text}",
          "status_campaign": "$status_campaign_offer"
        },
        headers: {'Accept': 'application/json'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        add_offer = responsebody;
        if (add_offer["message"] == "Offer created successfully.") {
          title_offer.text = '';
          description_offer.text = '';
          price_offer.text = '';
          number_realse_offer.text = '';
          status_campaign_offer = 'false';
        }
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return add_offer;
  }

  var all_offers = null;
  Future AllOffers() async {
    all_offers = null;
    String url = "$ip/api/admin/get/all-offers";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        all_offers = responsebody;

        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return all_offers;
  }

  var delete_offers = null;
  Future DeleteOffers(int id) async {
    delete_offers = null;
    String url = "$ip/api/admin/delete/offer/$id";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        delete_offers = responsebody;

        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return delete_offers;
  }

  //employee
  TextEditingController name_employee = TextEditingController();
  TextEditingController email_employee = TextEditingController();
  TextEditingController phone_employee = TextEditingController();
  TextEditingController salary_month_employee = TextEditingController();
  TextEditingController password_employee = TextEditingController();
  TextEditingController password_confirm_employee = TextEditingController();
  String selectedValue = "اختر وظيفه";
  List<dynamic> dropdownItems = ["حمله اعلانيه", "فديو ريلز"];
  var add_employee;
  Future AddEmployee() async {
    add_employee = null;
    String url = "$ip/api/admin/add/emploeesye";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "name": "${name_employee.text.toString()}",
          "specialization": "${selectedValue}",
          "salary": "${salary_month_employee.text.toString()}",
          "email": "${email_employee.text.toString()}",
          "phone": "${phone_employee.text.toString()}",
          "password": "${password_employee.text.toString()}",
          "password_confirmation":
              "${password_confirm_employee.text.toString()}",
        },
        headers: {'Accept': 'application/json'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        add_employee = responsebody;
        name_employee.text = '';
        selectedValue = "اختر وظيفه";
        email_employee.text = '';
        phone_employee.text = '';
        password_employee.text = '';
        password_confirm_employee.text = '';
        salary_month_employee.text = '';
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return add_employee;
  }

  Future EditEmployee(String id) async {
    add_employee = null;
    String url = "$ip/api/admin/edit/emploeesye";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "name": "${name_employee.text.toString()}",
          "specialization": "${selectedValue}",
          "salary": "${salary_month_employee.text.toString()}",
          "email": "${email_employee.text.toString()}",
          "phone": "${phone_employee.text.toString()}",
          "password": "${password_employee.text.toString()}",
          "password_confirmation":
              "${password_confirm_employee.text.toString()}",
          "employee_id": id
        },
        headers: {'Accept': 'application/json'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        add_employee = responsebody;
        name_employee.text = '';
        selectedValue = "اختر وظيفه";
        email_employee.text = '';
        phone_employee.text = '';
        password_employee.text = '';
        password_confirm_employee.text = '';
        salary_month_employee.text = '';
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return add_employee;
  }

  var all_employee_data = null;
  Future AllEmployee() async {
    all_employee_data = null;
    String url = "$ip/api/admin/get-all/emploeesyees";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        all_employee_data = responsebody;

        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return all_employee_data;
  }

  var delete_employee = null;
  Future DeleteEmployee(int id) async {
    delete_employee = null;
    String url = "$ip/api/admin/delete/emploeesyee/$id";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        delete_employee = responsebody;

        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return delete_employee;
  }



  //details_order_reals enter from home
  var details_order_reals = null;
  Future GetDetailsOrderReals(int id) async {
    details_order_reals = null;
    String url = "$ip/api/admin/user-reels/$id";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        details_order_reals = responsebody;

        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return details_order_reals;
  }

  //details_order_campain enter from home
  var details_order_campain = null;
  Future GetDetailsOrderCampain(int id) async {
    details_order_campain = null;
    String url = "$ip/api/admin/user-campaigns/$id";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        details_order_campain = responsebody;

        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return details_order_campain;
  }

  //taskes employee
  var datataskesnotdon;
  Future GetTaskesNotDone(int id_employee) async {
    datataskesnotdon = null;
    String url = "$ip/api/admin/get-all-task-not-done/$id_employee";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          
        },
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        datataskesnotdon = responsebody;
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return datataskesnotdon;
  }

  var datataskesdon;
  Future GetTaskesDone(int id_employee) async {
    datataskesdon = null;
    String url = "$ip/api/admin/get-all-task-done/$id_employee";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
        },
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        datataskesdon = responsebody;
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return datataskesdon;
  }
  //user

  var user_data = null;
  Future GetUserData(int id) async {
    user_data = null;
    String url = "$ip/api/admin/get-all-user-data-poll/$id";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        user_data = responsebody;

        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return user_data;
  }

  var user_order = null;
  Future GetUserOrders(int id) async {
    user_order = null;
    String url = "$ip/api/admin/get-all-user-order/$id";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        user_order = responsebody;

        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return user_order;
  }

  //login
  TextEditingController email_admin = TextEditingController();
  TextEditingController password_admin = TextEditingController();
  late Box idbox = Hive.box("idadmin");
  late Box namebox = Hive.box("nameadmin");
  late Box emailbox = Hive.box("emailadmin");
  late Box imagebox = Hive.box("imageadmin");
  late Box tokenbox = Hive.box("tokenadmin");
  var login;
  Future Login() async {
    login = null;
    String url = "$ip/api/admin/login";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "email": "${email_admin.text.toString()}",
          "password": "${password_admin.text.toString()}"
        },
        headers: {
          'Accept': 'application/json',
        },
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        login = responsebody;
        if (login['message'] == "Admin Logged In Successfully") {
          idbox.put("id", "${login['data']['data']['id']}");
          namebox.put("name", "${login['data']['data']['name']}");
          emailbox.put("email", "${login['data']['data']['email']}");
          imagebox.put("image", "${login['data']['data']['iamge_baase64']}");
          tokenbox.put("token", "${login['data']['data']['token']}");
          print("token==${tokenbox.get("token")}");
          print("token==${tokenbox.get("token")}");
          print("token==${tokenbox.get("token")}");
        }
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return login;
  }

  var new_users = null;
  Future GetNewUsers() async {
    new_users = null;
    String url = "$ip/api/admin/get/all-new-users";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        new_users = responsebody;

        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return new_users;
  }

  var all_users = null;
  int id = 0;
  Future GetAllUsers() async {
    if (all_users != null) {
      if (all_users['message'] == "All users") {
        if (all_users['last_id'] != null) {
          id = all_users['last_id'];
        }
      }
    }
    all_users = null;

    String url = "$ip/api/admin/get/all-users/$id";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        all_users = responsebody;

        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return all_users;
  }

  var convert_user_to_old = null;
  Future ConvertUsertoold(int id) async {
    convert_user_to_old = null;
    String url = "$ip/api/admin/change-user-to-old/$id";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        convert_user_to_old = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return convert_user_to_old;
  }
  //send notification

  TextEditingController message = TextEditingController();

  var send_notification_to_all_users;
  Future SendNotificationToAllUsers() async {
    send_notification_to_all_users = null;
    String url = "$ip/api/admin/send/notification-to-allusers";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {"title": "Manga", "description": "${message.text}"},
        headers: {
          'Accept': 'application/json',
        },
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        send_notification_to_all_users = responsebody;
        message.text = '';
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return send_notification_to_all_users;
  }

  var send_notification_to_all_employees;
  Future SendNotificationToAllEmployees() async {
    send_notification_to_all_employees = null;
    String url = "$ip/api/admin/send/notification-to-employees";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {"title": "Manga", "description": "${message.text}"},
        headers: {
          'Accept': 'application/json',
        },
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        send_notification_to_all_employees = responsebody;
        message.text = '';
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return send_notification_to_all_employees;
  }

  var send_notification_to_user;
  Future SendNotificationToUser(int id_user) async {
    send_notification_to_user = null;
    String url = "$ip/api/admin/send/notification";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "user_id": id_user.toString(),
          "title": "Manga",
          "description": "${message.text}"
        },
        headers: {
          'Accept': 'application/json',
        },
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        send_notification_to_user = responsebody;
        message.text = '';
      }
      print("send_notification_to_user=====${responsebody}");
      print("send_notification_to_user=====${responsebody}");
      print("send_notification_to_user=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return send_notification_to_user;
  }

  TextEditingController title_sub = TextEditingController();
  TextEditingController description_sub = TextEditingController();
  TextEditingController price_sub = TextEditingController();
  TextEditingController number_realse_sub = TextEditingController();
  String status_campaign_sub = 'false';
  var add_sub;
  Future AddSub(int id_user) async {
    add_sub = null;
    String url = "$ip/api/admin/add-sub-for-user";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "user_id": id_user.toString(),
          "title": "${title_sub.text}",
          "description": "${description_sub.text}",
          "price_sub_monthe": "${price_sub.text}",
          "num_of_reels": "${number_realse_sub.text}",
          "status_campaign": "$status_campaign_sub"
        },
        headers: {'Accept': 'application/json'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        add_sub = responsebody;
        if (add_sub["message"] == "sub created successfully.") {
          title_sub.text = '';
          description_sub.text = '';
          price_sub.text = '';
          number_realse_sub.text = '';
          status_campaign_sub = 'false';
        }
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return add_sub;
  }

  TextEditingController title_sub_edit = TextEditingController();
  TextEditingController description_sub_edit = TextEditingController();
  TextEditingController price_sub_edit = TextEditingController();
  TextEditingController number_realse_sub_edit = TextEditingController();
  String status_campaign_sub_edit = 'false';
  var edit_sub;
  Future EditSub(int id_sub,int user_id) async {
    edit_sub = null;
    String url = "$ip/api/admin/edit-sub-for-user";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "subscription_id": id_sub.toString(),
          "user_id":user_id.toString(),
          "title": "${title_sub_edit.text}",
          "description": "${description_sub_edit.text}",
          "price_sub_monthe": "${price_sub_edit.text}",
          "num_of_reels": "${number_realse_sub_edit.text}",
          "status_campaign": "$status_campaign_sub_edit"
        },
        headers: {'Accept': 'application/json'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        edit_sub = responsebody;
        if (edit_sub["message"] == "sub created successfully.") {
          title_sub_edit.text = '';
          description_sub_edit.text = '';
          price_sub_edit.text = '';
          number_realse_sub_edit.text = '';
          status_campaign_sub_edit = 'false';
        }
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return edit_sub;
  }

  var accept_sub = null;
  Future AcceptSub(int id_sub) async {
    accept_sub = null;

    String url = "$ip/api/admin/accept-subscription/$id_sub";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        accept_sub = responsebody;

        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return accept_sub;
  }

  var delete_user = null;
  Future DeleteUser(int id_user) async {
    delete_user = null;

    String url = "$ip/api/admin/delete/user/$id_user";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        delete_user = responsebody;

        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return delete_user;
  }

  var all_sub = null;
  Future AllSub() async {
    all_sub = null;

    String url = "$ip/api/admin/get-all-subscriptions";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        all_sub = responsebody;

        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return all_sub;
  }

  var all_sub_notpay = null;
  Future AllSubNotPay() async {
    all_sub_notpay = null;
    String url = "$ip/api/admin/get-all-order/payment-date";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        all_sub_notpay = responsebody;

        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return all_sub_notpay;
  }

  var pay_sub = null;
  Future PaySub(String id_user, String subscription_id) async {
    pay_sub = null;
    String url = "$ip/api/admin/add/payment";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "user_id": id_user,
          "subscription_id": subscription_id,
        },
        headers: {'Accept': 'application/json'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        pay_sub = responsebody;
      }
      print("pay_sub=====${pay_sub}");
      print("pay_sub=====${pay_sub}");
      print("pay_sub=====${pay_sub}");
    } catch (e) {
      print(e);
    }
    return pay_sub;
  }

  var send_noti_sub_notpay = null;
  Future SendNotiToSubNotPay(int id_user) async {
    send_noti_sub_notpay = null;
    String url = "$ip/api/admin/send-not-payment/user/$id_user";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        send_noti_sub_notpay = responsebody;

        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return send_noti_sub_notpay;
  }

  TextEditingController type_export = TextEditingController();
  TextEditingController salary_export = TextEditingController();
  
  var data_export = null;
  Future DataExport() async {
    pay_sub = null;
    String url = "$ip/api/admin/get-all-data-from-outcom";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "start_date": startDate,
          "end_date": endDate,
        },
        headers: {'Accept': 'application/json'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        data_export = responsebody;
      }
      print("data_export=====${data_export}");
      print("data_export=====${data_export}");
      print("data_export=====${data_export}");
    } catch (e) {
      print(e);
    }
    return data_export;
  }
  var add_export = null;
  Future AddExport() async {
    add_export = null;
    String url = "$ip/api/admin/pay-other-finances";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "amount": salary_export.text,
          "description": type_export.text,
        },
        headers: {'Accept': 'application/json'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        add_export = responsebody;
      }
      print("add_export=====${add_export}");
      print("add_export=====${add_export}");
      print("add_export=====${add_export}");
    } catch (e) {
      print(e);
    }
    return add_export;
  }

  TextEditingController type_import = TextEditingController();
  TextEditingController salary_import = TextEditingController();
  String startDate = "null";
  String endDate = "null";
  var data_import = null;
  Future DataImport() async {
    data_import = null;
    String url = "$ip/api/admin/get-all-data-from-income";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "start_date": startDate,
          "end_date": endDate,
        },
        headers: {'Accept': 'application/json'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        data_import = responsebody;
      }
      print("data_import=====${data_import}");
      print("data_import=====${data_import}");
      print("data_import=====${data_import}");
    } catch (e) {
      print(e);
    }
    return data_import;
  }
  var add_import = null;
  Future AddImport() async {
    add_import = null;
    String url = "$ip/api/admin/pay-other-income";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "amount": salary_import.text,
          "description": type_import.text,
        },
        headers: {'Accept': 'application/json'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        add_import = responsebody;
      }
      print("add_import=====${add_import}");
      print("add_import=====${add_import}");
      print("add_import=====${add_import}");
    } catch (e) {
      print(e);
    }
    return add_import;
  }
/////

  var all_orders_not_finshed = null;
  Future AllOrdersNotFnished() async {
    all_orders_not_finshed = null;
    String url = "$ip/api/admin/get-all-task-not-done";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        all_orders_not_finshed = responsebody;

        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return all_orders_not_finshed;
  }

  var salary_employee = null;
  Future SalaryEmployee() async {
    salary_employee = null;
    String url = "$ip/api/admin/get-all-salaries/payment-date";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        salary_employee = responsebody;

        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return salary_employee;
  }

  var pay_employee = null;
  Future PayEmployee(String id_employee) async {
    pay_employee = null;
    String url = "$ip/api/admin/pay-salary-to-employee";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "employee_id": id_employee,
        },
        headers: {'Accept': 'application/json'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        pay_employee = responsebody;
      }
      print("pay_employee=====${pay_employee}");
      print("pay_employee=====${pay_employee}");
      print("pay_employee=====${pay_employee}");
    } catch (e) {
      print(e);
    }
    return pay_employee;
  }
  var all_data_count = null;
  Future AllDataCount() async {
    all_data_count = null;
    String url = "$ip/api/admin/get-all-date";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        all_data_count = responsebody;

        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return all_data_count;
  }
  TextEditingController search_client = TextEditingController();
  var search = null;
  Future Search() async {
    search = null;
    String url = "$ip/api/admin/search-user";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "name": search_client.text,
        },
        headers: {'Accept': 'application/json'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        search = responsebody;
      }
      print("search=====${search}");
      print("search=====${search}");
      print("search=====${search}");
    } catch (e) {
      print(e);
    }
    return search;
  }
  TextEditingController search_email_client = TextEditingController();
  var search_email = null;
  Future SearchEmail() async {
    search_email = null;
    String url = "$ip/api/admin/search-user-by-email";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "email": search_email_client.text,
        },
        headers: {'Accept': 'application/json'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        search_email = responsebody;
      }
      print("search_email=====${search_email}");
      print("search_email=====${search_email}");
      print("search_email=====${search_email}");
    } catch (e) {
      print(e);
    }
    return search_email;
  }
  TextEditingController search_phone_client = TextEditingController();
  var search_phone = null;
  Future SearchPhone() async {
    search_phone = null;
    String url = "$ip/api/admin/search-user-by-phone";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "phone": search_phone_client.text,
        },
        headers: {'Accept': 'application/json'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        search_phone = responsebody;
      }
      print("search_phone=====${search_phone}");
      print("search_phone=====${search_phone}");
      print("search_phone=====${search_phone}");
    } catch (e) {
      print(e);
    }
    return search_phone;
  }

  var employee = null;
  Future Employee(id_employee) async {
    employee = null;
    String url = "$ip/api/admin/get-employee-data/$id_employee";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        employee = responsebody;

        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return employee;
  }
}
