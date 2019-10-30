import 'package:aicook_mobile/components/recetteDetails/StepItem.dart';
import 'package:aicook_mobile/style/colors.dart';
import 'package:flutter/material.dart';

class RecetteDetailsPage extends StatelessWidget {
  const RecetteDetailsPage({Key key}) : super(key: key);
  final String image =
      "https://res.cloudinary.com/dkxcax6es/image/upload/v1572361327/aicook/Basically-Gojuchang-Chicken-Recipe-Wide.jpg";

  Widget _buildInfo(String name, IconData icon) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 30,
            // color: UsefulColors.peche4,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              foregroundDecoration: BoxDecoration(color: Colors.black26),
              height: 400,
              child: Image.network(image, fit: BoxFit.cover)),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Slow-Roast Gochujang Chicken",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                          color: UsefulColors.rust,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        "8.4/85 reviews",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(26.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _buildInfo("4", Icons.people),
                          _buildInfo("15 min", Icons.work),
                          _buildInfo("25 min", Icons.hourglass_empty),
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        "Recette".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.0),
                      ),
                      const SizedBox(height: 10.0),
                      Column(
                        children: List.generate(5, (index) {
                          return StepItem(
                            index: index + 1,
                            title: "Etape",
                            content:
                                "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              // title: Text(
              //   "Recette",
              //   style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
