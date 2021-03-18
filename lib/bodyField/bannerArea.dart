import 'package:flutter/material.dart';
import 'package:yoresel/data/foodData.dart';
import 'package:yoresel/pages/detailPage.dart';
import 'package:yoresel/theme/colors.dart';

class BannerWidgetArea extends StatelessWidget {
  List<String> bannerImage = FoodData.foodImage;
  List<String> bannerItems = FoodData.foodName;
  List<String> bannerDescription = FoodData.foodDescription;

  @override
  Widget build(BuildContext context) {
    final screenSizeHeight = MediaQuery.of(context).size.height;
    final screenSizeWidth = MediaQuery.of(context).size.width;
    PageController controller =
        PageController(initialPage: 1, viewportFraction: 0.91);
    List<Widget> banners = List<Widget>();

    for (int i = 0; i < 4; i++) {
      var bannerView = Padding(
        padding: EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    DetailPage(bannerImage[i].toString(), bannerItems[i],bannerDescription[i])));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 2.0,
                            spreadRadius: 1.0)
                      ]),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(
                    bannerImage[i],
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [transParent, blackSh],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bannerItems[i],
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
      banners.add(bannerView);
    }

    return Container(
      width: screenSizeWidth,
      height: screenSizeHeight * 6 / 16,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,
      ),
    );
  }
}
