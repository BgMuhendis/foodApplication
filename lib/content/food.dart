import 'package:flutter/material.dart';
import 'package:yoresel/data/foodData.dart';
import 'package:yoresel/pages/detailPage.dart';
import 'package:yoresel/theme/colors.dart';

class FoodWidget extends StatelessWidget {
  List<String> bannerImage = FoodData.foodImage;
  List<String> bannerName = FoodData.foodName;
  List<String> bannerDescription = FoodData.foodDescription;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: bannerImage.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5.0, left: 5, right: 5),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => DetailPage(
                      bannerImage[index],
                      bannerName[index],
                      bannerDescription[index])));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      bannerImage[index],
                    ),
                  )),
              child: Stack(
                children: [
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
                          bannerName[index],
                          style: TextStyle(
                            fontSize: 19.0,
                            color: white
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
      },
    );
  }
}
