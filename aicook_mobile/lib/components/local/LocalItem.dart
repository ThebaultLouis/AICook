import 'package:aicook_mobile/style/colors.dart';
import 'package:aicook_mobile/views/LocalDetails.dart';
import 'package:flutter/material.dart';

class LocalItem extends StatelessWidget {
  final int index;
  const LocalItem({Key key, this.index}) : super(key: key);

  final String image =
      "https://res.cloudinary.com/dkxcax6es/image/upload/v1572373816/aicook/ferme.jpg";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LocalDetailsPage()),
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
            child: Row(
              children: <Widget>[
                Container(
                    height: 125,
                    width: 110,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(image), fit: BoxFit.cover)),
                    child: Container()),
                Expanded(
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[Text('A 800 m')],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "La ferme de dédé",
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
                            Text(
                              "Grenoble, France",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black87),
                            ),

                            // Text(
                            //   item.place,
                            //   style: TextStyle(fontSize: 14, color: Colors.black87),
                            // ),
                            SizedBox(
                              height: 10,
                            ),
                            // Row(
                            //   children: <Widget>[
                            //     Icon(
                            //       Icons.star,
                            //       color: UsefulColors.peche4,
                            //       size: 18,
                            //     ),
                            //     Icon(
                            //       Icons.star,
                            //       color: UsefulColors.peche4,
                            //       size: 18,
                            //     ),
                            //     Icon(
                            //       Icons.star,
                            //       color: UsefulColors.peche4,
                            //       size: 18,
                            //     ),
                            //     Icon(
                            //       Icons.star,
                            //       color: UsefulColors.peche4,
                            //       size: 18,
                            //     ),
                            //     Icon(
                            //       Icons.star,
                            //       color: UsefulColors.peche4,
                            //       size: 18,
                            //     ),
                            //   ],
                            // ),
                            // Row(
                            //   children: <Widget>[
                            //     Text(
                            //       "5.0/80",
                            //       style: TextStyle(fontSize: 13),
                            //     ),
                            //     SizedBox(
                            //       width: 5,
                            //     ),
                            //     Text(
                            //       "Ratings",
                            //       style: TextStyle(fontSize: 13),
                            //     ),
                            //   ],
                            // )
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
