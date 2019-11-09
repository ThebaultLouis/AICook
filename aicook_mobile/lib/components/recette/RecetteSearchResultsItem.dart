import 'package:aicook_mobile/views/RecetteDetails.dart';
import 'package:flutter/material.dart';

class RecetteSearchResultsItem extends StatelessWidget {
  final int index;
  const RecetteSearchResultsItem({Key key, this.index}) : super(key: key);
  final String image =
      "https://res.cloudinary.com/dkxcax6es/image/upload/v1572361327/aicook/Basically-Gojuchang-Chicken-Recipe-Wide.jpg";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecetteDetailsPage()),
        );
      },
      child: Hero(
        tag: "recetteSearch$index",
        child: Container(
          padding: new EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Card(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: <Widget>[
                Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(image), fit: BoxFit.cover)),
                    child: Container()),
                Expanded(
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Padding(
                      //   padding: const EdgeInsets.all(4.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: <Widget>[Text('A 800 m')],
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Slow-Roast Gochujang Chicken",
                              style: TextStyle(
                                  // color: Colors.deepOrange,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
                            Text(
                              "Plat principal",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black87),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
