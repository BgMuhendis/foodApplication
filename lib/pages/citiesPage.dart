import 'package:flutter/material.dart';
import 'package:yoresel/content/breakfast.dart';
import 'package:yoresel/content/dessert.dart';
import 'package:yoresel/content/food.dart';
import 'package:yoresel/theme/colors.dart';
import 'package:yoresel/theme/text.dart';

class CitiesPage extends StatefulWidget {
  @override
  _CitiesPageState createState() => _CitiesPageState();
}

class _CitiesPageState extends State<CitiesPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0)
      ..addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: citiesTitle,
      ),
      body: Column(
        children: [
          Container(
            
            margin: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[200]
            ),
            child: TabBar(
              isScrollable: true,
              indicatorPadding: EdgeInsets.all(1),
              unselectedLabelColor: black,
              labelStyle: TextStyle(fontSize: 20),
              labelPadding: EdgeInsets.only(left:37, right: 37, top:10,bottom: 10),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade300,
              ),
              controller: _tabController,
              tabs: [
                Text(
                  "Yemek",
                  style: TextStyle(color: black),
                ),
                Text(
                  "Kahvaltı",
                  style: TextStyle(color: black),
                ),
                Text(
                  "Tatlı",
                  style: TextStyle(color: black),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                FoodWidget(),
                BreakFastWidget(),
                DessertWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
