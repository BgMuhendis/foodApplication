import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yoresel/bodyField/bannerArea.dart';
import 'package:yoresel/bodyField/bodyBreakfast.dart';
import 'package:yoresel/bodyField/bodyCenter.dart';
import 'package:yoresel/icons/icons.dart';
import 'package:yoresel/pages/searchPage.dart';
import 'package:yoresel/theme/colors.dart';
import 'package:yoresel/theme/text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<String> city;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    city = List<String>();
    jsonRead(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenSizeHeight = MediaQuery.of(context).size.height;
    final screenSizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: white,
        centerTitle: true,
        leading: Container(
          margin: EdgeInsets.only(top: 8, left: 8, bottom: 8),
          child: CircleAvatar(
            child: Image.asset(
              "images/turkbayragi.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: title,
        actions: [
          IconButton(
            icon: search,
            onPressed: () {
              showSearch(
                context: context,
                delegate: DataSearch(),
              );
            },
          ),
        ],
      ),
      body: Container(
        height: screenSizeHeight,
        width: screenSizeWidth,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2.0, left: 0),
                child: favoriteFood,
              ),
              BannerWidgetArea(),
              Padding(
                padding: const EdgeInsets.only(top: 2.0, left: 0),
                child: favoriteTatli,
              ),
              BodyCenter(),
              Padding(
                padding: const EdgeInsets.only(top: 2.0, left: 0),
                child: favoriteKahvalti
              ),
              BodyBreakfast(),
            ],
          ),
        ),
      ),
    );
  }

  ListView getListe() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text("$index"),
          ),
        );
      },
    );
  }

  static jsonRead(BuildContext context) async {
    var json_read = await DefaultAssetBundle.of(context)
        .loadString("assets/cities/data.json");
    List liste = json.decode(json_read.toString());
    for (var i = 1; i <= 81; i++) {
      city.add(liste[0]["$i"]);
    }
  }
}
