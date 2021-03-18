import 'package:flutter/material.dart';
import 'package:yoresel/icons/icons.dart';
import 'package:yoresel/pages/citiesPage.dart';
import 'package:yoresel/pages/homePage.dart';
import 'package:yoresel/pages/searchPage.dart';
import 'package:yoresel/theme/text.dart';

class RouterPage extends StatefulWidget {
  @override
  _RouterPageState createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();
  List<Widget> _screen = [
    HomePage(),
    CitiesPage(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _onPageChanged(int index) {}

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
    setState(() {
      _selectedIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12.0,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: favorite, title: favorite_text),
          BottomNavigationBarItem(icon: food, title: food_text),
        ],
      ),
    );
  }
}
