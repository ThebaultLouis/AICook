import 'package:aicook_mobile/components/recette/RecetteItem.dart';
import 'package:flutter/material.dart';

class RecetteList extends StatelessWidget {
  const RecetteList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      // primary: false,
      itemCount: 20,
      itemBuilder: (BuildContext ctx, int index) {
        return RecetteItem(
          index: index,
        );
      },
    ));
  }
}
