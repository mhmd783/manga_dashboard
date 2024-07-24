import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mango_dash_board/prov/api.dart';

class control extends ChangeNotifier {
  ApiApp api = new ApiApp();
  String body_employee = "data";
  changeBodyEmployee(String body) {
    body_employee = body;

    notifyListeners();
  }

  //employee
  var one_employee = null;
  GetOneEmployee(int i) {
    one_employee = null;
    one_employee = all_employee_data['data'][i];
    notifyListeners();
  }

  //api
  //home
  double screenMargin = 55;
  changeAppBar(String screen) {
    if (screen == "home") {
      screenMargin = 55;
    } else if (screen == "tasks") {
      screenMargin = 150;
    } else if (screen == "employee") {
      screenMargin = 255;
    } else if (screen == "clients") {
      screenMargin = 325;
    } else if (screen == "offers") {
      screenMargin = 395;
    } else if (screen == "sub") {
      screenMargin = 480;
    } else if (screen == "finance") {
      screenMargin = 560;
    } else if (screen == "salaryemployee") {
      screenMargin = 660;
    }
    notifyListeners();
  }

  var home_data = null;
  Home() async {
    home_data = null;
    home_data = await api.Home();

    print("datacompain=====${home_data}");
    print("datacompain=====${home_data}");
    print("datacompain=====${home_data}");
    notifyListeners();
  }

  var sent_order = null;
  SendOrder() async {
    sent_order = null;
    sent_order = await api.SendOrder();
    if (sent_order != null) {
      if (sent_order['message'] == "Reels updated successfully" ||
          sent_order['message'] == "Offer Order updated successfully" ||
          sent_order['message'] == "Campaign updated successfully") {
        Home();
        if (sent_order['message'] == "Campaign updated successfully") {
          GetDetailsOrderCampain();
        }

        if (sent_order['message'] == "Reels updated successfully") {
          GetDetailsOrderReals();
        }
      }
    }
    print("sent_order=====${sent_order}");
    print("sent_order=====${sent_order}");
    print("sent_order=====${sent_order}");
    notifyListeners();
  }

  //offers
  var add_offer = null;
  AddOffer() async {
    add_offer = null;

    add_offer = await api.AddOffer();
    if (add_offer != null) {
      AllOffers();
    }
    print("datacompain=====${add_offer}");
    print("datacompain=====${add_offer}");
    print("datacompain=====${add_offer}");
    notifyListeners();
  }

  bool choseCampaign = false;
  choseCampaignforOffer(bool val) {
    choseCampaign = val;
    if (choseCampaign == false) {
      api.status_campaign_offer = "false";
    } else {
      api.status_campaign_offer = "true";
    }
    notifyListeners();
  }

  var all_offers = null;
  AllOffers() async {
    all_offers = null;
    all_offers = await api.AllOffers();
    print("datacompain=====${all_offers}");
    print("datacompain=====${all_offers}");
    print("datacompain=====${all_offers}");
    notifyListeners();
  }

  var delete_offer = null;
  DeleteOffers(int id) async {
    delete_offer = null;
    delete_offer = await api.DeleteOffers(id);
    if (delete_offer != null) {
      if (delete_offer['message'] == "Offer deleted successfully.") {
        AllOffers();
      }
    }
    print("datacompain=====${delete_offer}");
    print("datacompain=====${delete_offer}");
    print("datacompain=====${delete_offer}");
    notifyListeners();
  }

  //employee
  var datataskesemployee;
  Future GetTaskesNotDone(int id_employee) async {
    datataskesemployee = null;

    datataskesemployee = await api.GetTaskesNotDone(id_employee);

    print("datataskesnotdon=====${datataskesemployee}");
    print("datataskesnotdon=====${datataskesemployee}");
    print("datataskesnotdon=====${datataskesemployee}");
    notifyListeners();
  }

  Future GetTaskesDone(int id_employee) async {
    datataskesemployee = null;

    datataskesemployee = await api.GetTaskesDone(id_employee);

    print("datataskesdon=====${datataskesemployee}");
    print("datataskesdon=====${datataskesemployee}");
    print("datataskesdon=====${datataskesemployee}");
    notifyListeners();
  }

  var add_employee = null;
  AddEmployee() async {
    add_employee = null;

    add_employee = await api.AddEmployee();
    if (add_employee != null) {
      AllEmployee();
    }
    print("add_employee=====${add_employee}");
    print("add_employee=====${add_employee}");
    print("add_employee=====${add_employee}");
    notifyListeners();
  }

  StoreOldDataEmployee() {
    api.name_employee.text = one_employee['name'];
    api.selectedValue = one_employee['specialization'];
    api.email_employee.text = one_employee['email'];
    api.phone_employee.text = one_employee['phone'];
    api.password_employee.text = '';
    api.password_confirm_employee.text = '';
    api.salary_month_employee.text = one_employee['salary'];
    notifyListeners();
  }

  var edit_employee = null;
  EditEmployee() async {
    edit_employee = null;

    edit_employee = await api.EditEmployee(one_employee['id'].toString());
    if (edit_employee != null) {
      AllEmployee();
    }
    print("edit_employee=====${edit_employee}");
    print("edit_employee=====${edit_employee}");
    print("edit_employee=====${edit_employee}");
    notifyListeners();
  }

  var all_employee_data = null;
  AllEmployee() async {
    all_employee_data = null;
    all_employee_data = await api.AllEmployee();
    print("datacompain=====${all_employee_data}");
    print("datacompain=====${all_employee_data}");
    print("datacompain=====${all_employee_data}");
    notifyListeners();
  }

  var delete_employee = null;
  DeleteEmployee() async {
    delete_employee = null;
    delete_employee = await api.DeleteEmployee(one_employee['id']);
    if (delete_employee != null) {
      AllEmployee();
    }
    print("datacompain=====${delete_employee}");
    print("datacompain=====${delete_employee}");
    print("datacompain=====${delete_employee}");
    notifyListeners();
  }

  //details realse
  var details_order_reals = null;
  int id_order_realse = 0;
  GetDetailsOrderReals() async {
    details_order_reals = null;
    image_reals = null;
    image_client_reals = null;
    details_order_reals = await api.GetDetailsOrderReals(id_order_realse);
    if (details_order_reals != null) {
      if (details_order_reals['message'] ==
          "User and reels data retrieved successfully.") {
        if (details_order_reals['data']['product_image'] != "null") {
          await storimage();
        }
      }
    }

    print("datacompain=====${details_order_reals}");
    print("datacompain=====${details_order_reals}");
    print("datacompain=====${details_order_reals}");
    notifyListeners();
  }

  //image reals
  File? image_reals = null;
  Future storimage() async {
    image_reals = null;
    List<int> imageBytes =
        base64Decode(details_order_reals['data']['product_image']);
    image_reals = await _storeImageToFile(
        imageBytes, details_order_reals['data']['reel_id']);
    print(0);
    if (details_order_reals['data']['image'] != "null") {
      await storimageClientReals();
    }
    notifyListeners();
  }

  Future<File> _storeImageToFile(List<int> imageBytes, int id) async {
    //get id to stor image by defrent image
    String tempPath = Directory.systemTemp.path;

    File file = File('$tempPath/image${id}reels.jpg');
    await file.writeAsBytes(imageBytes);
    print('image${file.path} ///$tempPath');
    print('image${file.path}///$tempPath');
    return file;
  }

  //image_client_reals
  File? image_client_reals = null;
  Future storimageClientReals() async {
    image_client_reals = null;
    List<int> imageBytes = base64Decode(details_order_reals['data']['image']);
    image_client_reals = await _storeImageClientRealsToFile(
        imageBytes, details_order_reals['data']['user_id']);
    notifyListeners();
  }

  Future<File> _storeImageClientRealsToFile(
      List<int> imageBytes, int id) async {
    String tempPath = Directory.systemTemp.path;
    File file = File('$tempPath/image${id}clientreelse.jpg');
    await file.writeAsBytes(imageBytes);
    print('image===${file.path} ///$tempPath');
    print('image===${file.path}///$tempPath');
    return file;
  }

  //campains order details
  var details_order_campain = null;
  int id_order_campain = 0;
  GetDetailsOrderCampain() async {
    details_order_campain = null;
    image_client_campain = null;
    details_order_campain = await api.GetDetailsOrderCampain(id_order_campain);
    if (details_order_campain != null) {
      if (details_order_campain['message'] ==
          "User and campaigns data retrieved successfully.") {
        if (details_order_campain['data']['image'] != "null") {
          await storimageClientCampaign();
        }
      }
    }
    print("datacompain=====${details_order_campain}");
    print("datacompain=====${details_order_campain}");
    print("datacompain=====${details_order_campain}");
    notifyListeners();
  }

  //image_client_campaign
  File? image_client_campain = null;
  Future storimageClientCampaign() async {
    image_client_campain = null;
    List<int> imageBytes = base64Decode(details_order_campain['data']['image']);
    image_client_campain = await _storeImageClientCampaignToFile(
        imageBytes, details_order_campain['data']['campaign_id']);
    notifyListeners();
  }

  Future<File> _storeImageClientCampaignToFile(
      List<int> imageBytes, int id) async {
    String tempPath = Directory.systemTemp.path;
    File file = File('$tempPath/image${id}campaign.jpg');
    await file.writeAsBytes(imageBytes);
    print('image===${file.path} ///$tempPath');
    print('image===${file.path}///$tempPath');
    return file;
  }

  //offer

  //image_client_offer

  //user
  String body_client = "data";
  //data /order
  changBodyProfileClient(String body) {
    body_client = body;
    notifyListeners();
  }

  var user_data = null;
  int id_user = 0;
  GetUserData() async {
    image_client = null;
    user_data = null;
    user_data = await api.GetUserData(id_user);
    if (user_data != null) {
      if (user_data['message'] == "User data retrieved successfully.") {
        //image_base64:
        if (user_data['data']['image_base64'] != "null") {
          storimageClient();
        }
      }
    }
    print("user_data=====${user_data['data']['latest_subscription']}");
    print("user_data=====${user_data['data']['latest_subscription']}");
    print("user_data=====${user_data['data']['latest_subscription']}");
    // print("user_data=====${user_data}");
    // print("user_data=====${user_data}");
    notifyListeners();
  }

  //image_client
  File? image_client = null;
  Future storimageClient() async {
    image_client = null;
    List<int> imageBytes = base64Decode(user_data['data']['image_base64']);
    image_client =
        await _storeImageClientToFile(imageBytes, user_data['data']['user_id']);
    notifyListeners();
  }

  Future<File> _storeImageClientToFile(List<int> imageBytes, int id) async {
    String tempPath = Directory.systemTemp.path;
    File file = File('$tempPath/image${id}client.jpg');
    await file.writeAsBytes(imageBytes);
    print('image===${file.path} ///$tempPath');
    print('image===${file.path}///$tempPath');
    return file;
  }

  var user_orders = null;
  GetUserOrders() async {
    user_orders = null;
    user_orders = await api.GetUserOrders(id_user);
    print("datacompain=====${user_orders}");
    print("datacompain=====${user_orders}");
    print("datacompain=====${user_orders}");
    notifyListeners();
  }

  var login = null;
  Login() async {
    login = null;
    login = await api.Login();

    print("datalogin=====${login}");
    print("datalogin=====${login}");
    print("datalogin=====${login}");
    notifyListeners();
  }

  Logout() {
    api.tokenbox.put("token", null);
    notifyListeners();
  }

  var new_users = null;
  GetNewUsers() async {
    new_users = null;
    new_users = await api.GetNewUsers();

    print("new_users=====${new_users}");
    print("new_users=====${new_users}");
    print("new_users=====${new_users}");
    notifyListeners();
  }

  var all_users = null;
  var all_user_refresh = null;
  GetAllUsers() async {
    all_user_refresh = await api.GetAllUsers();
    if (all_user_refresh != null) {
      if (api.id == 0) {
        all_users = all_user_refresh;
      } else {
        for (int i = 0; i < all_user_refresh['data'].length; i++) {
          all_users['data'].add(all_user_refresh['data'][i]);
        }
      }
    }

    print("all_users=====${all_users}");
    print("all_users=====${all_users}");
    print("all_users=====${all_users}");
    notifyListeners();
  }

  var convert_user_to_old = null;
  ConvertUsertoold(int id) async {
    convert_user_to_old = null;
    convert_user_to_old = await api.ConvertUsertoold(id);
    if (convert_user_to_old != null) {
      //but message accept
      if (convert_user_to_old['message'] ==
          "User status changed successfully.") {
        GetNewUsers();
        GetUserData();
      }
    }
    print("convert_user_to_old =====${convert_user_to_old}");
    print("convert_user_to_old =====${convert_user_to_old}");
    print("convert_user_to_old =====${convert_user_to_old}");
    notifyListeners();
  }

  //notification
  String how = '';
  //clients,employees,all
  ChoseHowSendNotification(String val) {
    how = val;
    notifyListeners();
  }

  var send_notification_to_all_users = null;
  SendNotificationToAllUsers() async {
    send_notification_to_all_users = null;
    send_notification_to_all_users = await api.SendNotificationToAllUsers();
    print(
        "send_notification_to_all_users=====${send_notification_to_all_users}");
    print(
        "send_notification_to_all_users=====${send_notification_to_all_users}");
    print(
        "send_notification_to_all_users=====${send_notification_to_all_users}");
    notifyListeners();
  }

  SendNotificationToAllEmployees() async {
    send_notification_to_all_users = null;
    send_notification_to_all_users = await api.SendNotificationToAllEmployees();
    print(
        "send_notification_to_all_employees=====${send_notification_to_all_users}");
    print(
        "send_notification_to_all_employees=====${send_notification_to_all_users}");
    print(
        "send_notification_to_all_employees=====${send_notification_to_all_users}");
    notifyListeners();
  }

  SendNotificationToUser() async {
    send_notification_to_all_users = null;
    send_notification_to_all_users = await api.SendNotificationToUser(id_user);
    print("send_notification_to_user=====${send_notification_to_all_users}");
    print("send_notification_to_user=====${send_notification_to_all_users}");
    print("send_notification_to_user=====${send_notification_to_all_users}");
    notifyListeners();
  }

  bool choseCampaignsup = false;
  choseCampaignforSub(bool val) {
    choseCampaignsup = val;
    if (choseCampaignsup == false) {
      api.status_campaign_sub = "false";
    } else {
      api.status_campaign_sub = "true";
    }
    notifyListeners();
  }

  var add_sub = null;
  AddSub() async {
    add_sub = null;
    add_sub = await api.AddSub(id_user);
    if (add_sub != null) {
      if (add_sub['message'] == "Subscription added successfully.") {
        GetUserData();
      }
    }
    print("add_sub=====${add_sub}");
    print("add_sub=====${add_sub}");
    print("add_sub=====${add_sub}");
    notifyListeners();
  }

  bool choseCampaignsupedit = false;
  choseCampaignforSubEdit(bool val) {
    choseCampaignsupedit = val;
    if (choseCampaignsupedit == false) {
      api.status_campaign_sub_edit = "false";
    } else {
      api.status_campaign_sub_edit = "true";
    }
    notifyListeners();
  }

  StoreDataSub() {
    api.title_sub_edit.text = user_data["data"]['latest_subscription']['title'];
    api.description_sub_edit.text =
        user_data["data"]['latest_subscription']['description'];
    api.price_sub_edit.text =
        user_data["data"]['latest_subscription']['price_sub_monthe'].toString();
    api.number_realse_sub_edit.text =
        user_data["data"]['latest_subscription']['num_of_reels'].toString();
    api.status_campaign_sub_edit =
        user_data["data"]['latest_subscription']['status_campaign'];
    notifyListeners();
  }

  var edit_sub = null;
  EditSub(int id_sub) async {
    edit_sub = null;
    edit_sub = await api.EditSub(id_sub, id_user);
    if (edit_sub != null) {
      if (edit_sub['message'] == "User Subscription updated successfully.") {
        GetUserData();
      }
    }
    print("edit_sub=====${edit_sub}");
    print("edit_sub=====${edit_sub}");
    print("edit_sub=====${edit_sub}");
    notifyListeners();
  }

  var accept_sub = null;
  AcceptSub(int id_sup) async {
    accept_sub = null;
    accept_sub = await api.AcceptSub(id_sup);
    if (accept_sub != null) {
      if (accept_sub['message'] == "Subscription active successfully." ||
          accept_sub['message'] == "Subscription inactive successfully.") {
        GetUserData();
        AllSub();
      }
    }
    print("accept_sub=====${accept_sub}");
    print("accept_sub=====${accept_sub}");
    print("accept_sub=====${accept_sub}");
    notifyListeners();
  }

  var delete_user = null;
  DeleteUser() async {
    delete_user = null;
    delete_user = await api.DeleteUser(id_user);
    if (delete_user != null) {
      if (delete_user['message'] == "User deleted successfully.") {
        GetUserData();
      }
    }
    print("delete_user=====${delete_user}");
    print("delete_user=====${delete_user}");
    print("delete_user=====${delete_user}");
    notifyListeners();
  }

  var all_sub = null;
  AllSub() async {
    all_sub = null;
    all_sub = await api.AllSub();
    print("all_sub=====${all_sub}");
    print("all_sub=====${all_sub}");
    print("all_sub=====${all_sub}");
    notifyListeners();
  }

  var all_sub_notpay = null;
  AllSubNotPay() async {
    all_sub_notpay = null;
    all_sub_notpay = await api.AllSubNotPay();
    print("all_sub_notpay=====${all_sub_notpay}");
    print("all_sub_notpay=====${all_sub_notpay}");
    print("all_sub_notpay=====${all_sub_notpay}");
    notifyListeners();
  }

  var pay_sub = null;
  PaySub(String id_user_sub, String subscription_id) async {
    pay_sub = null;
    pay_sub = await api.PaySub(id_user_sub, subscription_id);
    if (pay_sub != null) {
      if (pay_sub['message'] == "Subscription is active now") {
        AllDataCount();
        AllSubNotPay();
      }
    }
    print("pay_sub=====${pay_sub}");
    print("pay_sub=====${pay_sub}");
    print("pay_sub=====${pay_sub}");
    notifyListeners();
  }

  var send_noti_sub_notpay = null;
  SendNotiToSubNotPay(int id_user) async {
    send_noti_sub_notpay = null;
    send_noti_sub_notpay = await api.SendNotiToSubNotPay(id_user);

    print("send_noti_sub_notpay=====${send_noti_sub_notpay}");
    print("send_noti_sub_notpay=====${send_noti_sub_notpay}");
    print("send_noti_sub_notpay=====${send_noti_sub_notpay}");
    notifyListeners();
  }

  var all_orders_not_finshed = null;
  Future AllOrdersNotFnished() async {
    all_orders_not_finshed = null;
    all_orders_not_finshed = await api.AllOrdersNotFnished();
    print("all_orders_not_finshed=====${all_orders_not_finshed}");
    print("all_orders_not_finshed=====${all_orders_not_finshed}");
    print("all_orders_not_finshed=====${all_orders_not_finshed}");
    notifyListeners();
  }

  StoreOneEmployee(int id) {
    one_employee = null;
    for (int i = 0; i < all_employee_data['data'].length; i++) {
      if (id == all_employee_data['data'][i]['id']) {
        one_employee = all_employee_data['data'][i];
      }
    }
    //
    notifyListeners();
  }

  var salary_employee = null;
  Future SalaryEmployee() async {
    salary_employee = null;
    salary_employee = await api.SalaryEmployee();
    print("salary_employee=====${salary_employee}");
    print("salary_employee=====${salary_employee}");
    print("salary_employee=====${salary_employee}");
    notifyListeners();
  }

  var pay_employee = null;
  Future PayEmployee(String id_employee) async {
    pay_employee = null;
    pay_employee = await api.PayEmployee(id_employee);
    if (pay_employee != null) {
      if (pay_employee['message'] == "Salary Paid Successfully") {
        AllDataCount();
        SalaryEmployee();
      }
    }
    print("pay_employee=====${pay_employee}");
    print("pay_employee=====${pay_employee}");
    print("pay_employee=====${pay_employee}");
    notifyListeners();
  }

  changeDateStartExport() {
    api.startDate = api.startDate;
    notifyListeners();
  }

  changeDateEndExport() {
    api.endDate = api.endDate;
    notifyListeners();
  }

  var data_export = null;
  Future DataExport() async {
    amountExport = 0.0;
    data_export = null;
    data_export = await api.DataExport();
    if (data_export != null) {
      if (data_export['message'] == "Outcome data found." ||
          data_export['message'] == "All outcome data.") {
        CountAmountExport();
      }
    }
    CalculatIncomeOutcome();
    print("data_export=====${data_export}");
    print("data_export=====${data_export}");
    print("data_export=====${data_export}");
    notifyListeners();
  }

  double amountExport = 0.0;
  CountAmountExport() {
    amountExport = 0.0;
    for (int i = 0; i < data_export['data'].length; i++) {
      amountExport =
          amountExport + double.parse(data_export['data'][i]['amount']);
    }
    CalculatIncomeOutcome();
    print(amountExport);
    print(amountExport);
    print(amountExport);
    notifyListeners();
  }

  var add_export = null;
  Future AddExport() async {
    add_export = null;
    add_export = await api.AddExport();
    //Paid Successfully
    if (add_export != null) {
      if (add_export['message'] == "Paid Successfully") {
        DataExport();
      }
    }
    print("add_export=====${add_export}");
    print("add_export=====${add_export}");
    print("add_export=====${add_export}");
    notifyListeners();
  }

  changeDateStartImport() {
    api.startDate = api.startDate;
    notifyListeners();
  }

  changeDateEndImport() {
    api.endDate = api.endDate;
    notifyListeners();
  }

  var data_import = null;
  Future DataImport() async {
    amountImport = 0.0;
    data_import = null;
    data_import = await api.DataImport();
    if (data_import != null) {
      if (data_import['message'] == "All income data." ||
          data_import['message'] == "Income data found.") {
        CountAmountImport();
      }
    }
    CalculatIncomeOutcome();
    print("data_import=====${data_import}");
    print("data_import=====${data_import}");
    print("data_import=====${data_import}");
    notifyListeners();
  }

  double amountImport = 0.0;
  CountAmountImport() {
    amountImport = 0.0;
    for (int i = 0; i < data_import['data'].length; i++) {
      amountImport =
          amountImport + double.parse(data_import['data'][i]['amount']);
    }
    CalculatIncomeOutcome();
    print(amountImport);
    print(amountImport);
    print(amountImport);
    notifyListeners();
  }

  var add_import = null;
  Future AddImport() async {
    add_import = null;
    add_import = await api.AddImport();
    //Paid Successfully
    if (add_import != null) {
      if (add_import['message'] == "Paid Successfully") {
        DataImport();
      }
    }
    print("add_import=====${add_import}");
    print("add_import=====${add_import}");
    print("add_import=====${add_import}");
    notifyListeners();
  }

  double calculatincomeOutcome = 0.0;
  CalculatIncomeOutcome() {
    calculatincomeOutcome = 0.0;
    calculatincomeOutcome = amountImport - amountExport;
    notifyListeners();
  }

  var all_data_count = null;
  Future AllDataCount() async {
    //All data. message
    all_data_count = null;
    all_data_count = await api.AllDataCount();
    print("all_data_count=====${all_data_count}");
    print("all_data_count=====${all_data_count}");
    print("all_data_count=====${all_data_count}");
    notifyListeners();
  }

  var search = null;

  Future Search() async {
    search = null;
    search = await api.Search();
    print("search=====${search}");
    print("search=====${search}");
    print("search=====${search}");
    notifyListeners();
  }

  Future SearchEmail() async {
    search = null;
    search = await api.SearchEmail();
    print("search_email=====${search}");
    print("search_email=====${search}");
    print("search_email=====${search}");
    notifyListeners();
  }

  Future SearchPhone() async {
    search = null;
    search = await api.SearchPhone();
    print("search_email=====${search}");
    print("search_email=====${search}");
    print("search_email=====${search}");
    notifyListeners();
  }

  var employee = null;
  Future Employee() async {
    image_employee = null;
    employee = null;
    employee = await api.Employee(one_employee['id']);
    if (employee != null) {
      if (employee['message'] == "Employee Data.") {
        if (employee['data']['iamge_baase64'] != "null") {
          StorImageEmployee();
        }
      }
    }
    print("employee=====${employee}");
    print("employee=====${employee}");
    print("employee=====${employee}");
    notifyListeners();
  }

  File? image_employee = null;
  Future StorImageEmployee() async {
    image_employee = null;
    List<int> imageBytes = base64Decode(employee['data']['iamge_baase64']);
    image_employee =
        await _storeImageEmployeeToFile(imageBytes, employee['data']['id']);

    notifyListeners();
  }

  Future<File> _storeImageEmployeeToFile(List<int> imageBytes, int id) async {
    //get id to stor image by defrent image
    String tempPath = Directory.systemTemp.path;

    File file = File('$tempPath/image${id}employee.jpg');
    await file.writeAsBytes(imageBytes);
    print('image${file.path} ///$tempPath');
    print('image${file.path}///$tempPath');
    return file;
  }
}
