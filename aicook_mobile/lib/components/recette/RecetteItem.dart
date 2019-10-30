import 'package:aicook_mobile/style/colors.dart';
import 'package:aicook_mobile/views/RecetteDetails.dart';
import 'package:flutter/material.dart';

class RecetteItem extends StatelessWidget {
  final int index;
  final String image =
      "https://res.cloudinary.com/dkxcax6es/image/upload/v1572361327/aicook/Basically-Gojuchang-Chicken-Recipe-Wide.jpg";
  const RecetteItem({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleTextStyle = TextStyle(
      color: Colors.black87,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecetteDetailsPage()),
        );
      },
      child: Hero(
        tag: index,
        child: Container(
          padding: new EdgeInsets.all(8.0),
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(image),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 16.0, right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Slow-Roast Gochujang Chicken",
                            style: titleTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "John cena",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Plat Principal",
                            style: TextStyle(
                              // color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(height: 20.0),
                  ],
                ),
                Positioned(
                  top: 190,
                  left: 20.0,
                  child: Container(
                    color: UsefulColors.rust,
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "Nouveau",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
