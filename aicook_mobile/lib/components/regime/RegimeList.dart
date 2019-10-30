import 'package:aicook_mobile/components/regime/RegimeItem.dart';
import 'package:flutter/material.dart';

class RegimeList extends StatelessWidget {
  const RegimeList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext ctx, int index) {
        return RegimeItem(
          index: index,
        );
      },
    ));
  }
}
