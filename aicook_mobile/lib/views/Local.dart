import 'package:aicook_mobile/components/local/LocalList.dart';
import 'package:aicook_mobile/components/local/LocalSearchBar.dart';
import 'package:aicook_mobile/style/colors.dart';
import 'package:flutter/material.dart';

class LocalPage extends StatelessWidget {
  const LocalPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: UsefulColors.bg,
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 300.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        "assets/images/local/local_couverture_01.jpg",
                      ),
                      fit: BoxFit.cover,
                    )),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 50,
                    right: 50,
                    child: GestureDetector(
                      onTap: () {
                        //                 Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => RecetteDetailsPage()),
                        // );
                      },
                      child: Hero(
                        tag: "recette_search",
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          color: Color.fromARGB(180, 255, 255, 255),
                          child: Container(
                              padding: new EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.search),
                                  Text('Rechercher plus de producteurs...')
                                ],
                              )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            LocalList()
          ],
        )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: UsefulColors.peche4,
          onPressed: () {},
          tooltip: 'GuessMyFood',
          child: Icon(
            Icons.shopping_basket,
          ),
        ), //
      ),
    );
  }
}
