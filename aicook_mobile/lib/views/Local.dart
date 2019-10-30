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
          children: <Widget>[LocalSearchBar(), LocalList()],
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
