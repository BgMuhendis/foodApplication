import 'package:flutter/material.dart';
import 'package:yoresel/data/breakFastData.dart';
import 'package:yoresel/data/dessertData.dart';
import 'package:yoresel/data/foodData.dart';

class DataSearch extends SearchDelegate<String> {
  List<String> foodName = List<String>();
  List<String> foodImage = List<String>();
  List<String> foodDescription = List<String>();

  List<String> suggestionList = List<String>();
  

  jsonRead(BuildContext context) async {
    foodName = BreakFastData.breakFastName +
        DessertData.dessertName +
        FoodData.foodName;
    
    // var json_read = await DefaultAssetBundle.of(context)
    //     .loadString("assets/cities/data.json");
    // List liste = json.decode(json_read.toString());

    // for (var i = 1; i <= 81; i++) {
    //   city.add(liste[0]["$i"]);
    // }
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Visibility(
        visible: query.isEmpty ? false : true,
        child: IconButton(
          icon: Icon(Icons.clear),
          color: Colors.black,
          onPressed: () {
            query = "";
          },
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    jsonRead(context);
    final query_statu = query.isEmpty ? true : false;
    suggestionList = !query_statu
        ? foodName
            .where((element) =>
                element.toLowerCase().startsWith(query.toLowerCase()))
            .toList()
        : [""];
    // city.clear();
    return query_statu
        ? Text("")
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView.builder(
              itemCount: suggestionList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    
                  },
                  child: Card(
                    child: ListTile(
                      trailing: Icon(Icons.arrow_forward),
                      title: RichText(
                        text: TextSpan(
                            text:
                                suggestionList[index].substring(0, query.length),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    suggestionList[index].substring(query.length),
                                style: TextStyle(color: Colors.black54),
                              )
                            ]),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
