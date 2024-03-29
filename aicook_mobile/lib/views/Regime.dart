import 'package:aicook_mobile/components/regime/RegimeList.dart';
import 'package:aicook_mobile/components/regime/RegimeSearchBar.dart';
import 'package:flutter/material.dart';

class RegimePage extends StatelessWidget {
  const RegimePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[RegimeSearchBar(), RegimeList()],
    ));
  }
}
