import 'package:aicook_mobile/style/colors.dart';
import 'package:aicook_mobile/views/RegimeDetails.dart';
import 'package:flutter/material.dart';

class RegimeItem extends StatelessWidget {
  final int index;
  const RegimeItem({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleTextStyle = TextStyle(
      color: Colors.black87,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );
    var descriptionTextStyle = TextStyle(
      color: Colors.black87,
      fontSize: 17.0,
      // fontWeight: FontWeight.bold,
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegimeDetailsPage()),
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
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Régime communiste",
                            style: titleTextStyle,
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    //   child: Row(
                    //     children: <Widget>[
                    //       Text(
                    //         "Vladimir Putin",
                    //         style: TextStyle(
                    //           color: Colors.grey,
                    //           fontSize: 14.0,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Vladimir Putin",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: UsefulColors.peche4,
                            size: 18,
                          ),
                          Icon(
                            Icons.star,
                            color: UsefulColors.peche4,
                            size: 18,
                          ),
                          Icon(
                            Icons.star,
                            color: UsefulColors.peche4,
                            size: 18,
                          ),
                          Icon(
                            Icons.star,
                            color: UsefulColors.peche4,
                            size: 18,
                          ),
                          Icon(
                            Icons.star,
                            color: UsefulColors.peche4,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          // Text(
                          //   "4.3/800",
                          //   style: TextStyle(fontSize: 13),
                          // )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('6 mois', style: descriptionTextStyle),
                        Text(
                          '5 kg',
                          style: descriptionTextStyle,
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.brightness_low),
                            Icon(Icons.brightness_medium),
                            Icon(Icons.brightness_3),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.euro_symbol),
                            Icon(Icons.euro_symbol),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
                // index % 2 != 0
                //     ? Positioned(
                //         top: 3,
                //         right: 3.0,
                //         child: Container(
                //           // color: UsefulColors.rust,
                //           padding: const EdgeInsets.all(4.0),
                //           decoration: BoxDecoration(
                //               color: UsefulColors.rust,
                //               borderRadius: BorderRadius.circular(4.0)),
                //           child: Text(
                //             "Nouveau",
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontSize: 12.0,
                //             ),
                //           ),
                //         ),
                //       )
                //     : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
