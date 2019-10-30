import 'package:aicook_mobile/components/local/LocalItem.dart';
import 'package:flutter/material.dart';

class LocalList extends StatelessWidget {
  const LocalList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 20,
      itemBuilder: (BuildContext ctx, int index) {
        return LocalItem(
          index: index,
        );
      },
    ));
  }
}
