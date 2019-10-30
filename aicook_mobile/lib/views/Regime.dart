import 'package:aicook_mobile/components/regime/RegimeList.dart';
import 'package:flutter/material.dart';

class RegimePage extends StatelessWidget {
  const RegimePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: RegimeList()));
  }
}
