import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mango_dash_board/companent/colors.dart';
import 'package:mango_dash_board/companent/text_form_search.dart';
import 'package:mango_dash_board/prov/prov.dart';
import 'package:provider/provider.dart';

class ContainerOrderOffer extends StatelessWidget {
  ContainerOrderOffer({
    super.key,
    required this.color,
    required this.image_logo,
    required this.title,
    required this.data_order,
  });
  final Color color;
  final String image_logo;
  final String title;
  var data_order;

  @override
  Widget build(BuildContext context) {
    ColorsApp colorsApp = new ColorsApp();
    return Consumer<control>(builder: (context, val, child) {
      return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        width: 300,
        height: 500,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Container(
                        height: 20,
                        width: 20,
                        child: Image.asset("$image_logo")),
                  ),
                  Expanded(child: Container()),
                  Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text("$title"),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: data_order['data']['offer_orders'].length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        leading: Container(
                            width: 30,
                            height: 30,
                            child: Image.asset("$image_logo")),
                        title: Text(
                            "${data_order['data']['offer_orders'][i]['offer_title']}"),
                        subtitle: Text("21/6/2024"),
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class ContainerOrderRealse extends StatelessWidget {
  ContainerOrderRealse({
    super.key,
    required this.color,
    required this.image_logo,
    required this.title,
    required this.data_order,
  });
  final Color color;
  final String image_logo;
  final String title;
  var data_order;

  @override
  Widget build(BuildContext context) {
    ColorsApp colorsApp = new ColorsApp();
    return Consumer<control>(builder: (context, val, child) {
      return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        width: 300,
        height: 500,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Container(
                        height: 20,
                        width: 20,
                        child: Image.asset("$image_logo")),
                  ),
                  Expanded(child: Container()),
                  Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text("$title"),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: data_order['data']['reels'].length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        onTap: () {
                          val.id_order_realse =
                              data_order['data']['reels'][i]['reel_id'];
                          Navigator.of(context).pushNamed("realsordersdetails");
                        },
                        leading: Container(
                            width: 30,
                            height: 30,
                            child: Image.asset("$image_logo")),
                        title: Text(
                            "${data_order['data']['reels'][i]['product_name']}"),
                        subtitle: Text(
                            "${Jiffy.parse(data_order['data']['reels'][i]['created_at']).yMd}"),
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class ContainerOrderCampain extends StatelessWidget {
  ContainerOrderCampain({
    super.key,
    required this.color,
    required this.image_logo,
    required this.title,
    required this.data_order,
  });
  final Color color;
  final String image_logo;
  final String title;
  var data_order;

  @override
  Widget build(BuildContext context) {
    ColorsApp colorsApp = new ColorsApp();
    return Consumer<control>(builder: (context, val, child) {
      return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        width: 300,
        height: 500,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Container(
                        height: 20,
                        width: 20,
                        child: Image.asset("$image_logo")),
                  ),
                  Expanded(child: Container()),
                  Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text("$title"),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount:
                        data_order['data']['advertising_campaigns'].length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        onTap: () {
                          val.id_order_campain = data_order['data']
                              ['advertising_campaigns'][i]['campaign_id'];
                          Navigator.of(context)
                              .pushNamed("campainordersdetails");
                        },
                        leading: Container(
                            width: 30,
                            height: 30,
                            child: Image.asset("$image_logo")),
                        title: Text(
                            "${data_order['data']['advertising_campaigns'][i]['order_type']}"),
                        subtitle: Text("${Jiffy.parse(data_order['data']['advertising_campaigns'][i]['created_at']).yMd}"),
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
