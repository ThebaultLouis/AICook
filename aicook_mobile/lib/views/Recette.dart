import 'package:aicook_mobile/components/recette/RecetteList.dart';
import 'package:aicook_mobile/components/recette/RecetteSearchBar.dart';
import 'package:aicook_mobile/style/colors.dart';
import 'package:flutter/material.dart';

class RecettePage extends StatelessWidget {
  const RecettePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: UsefulColors.bg,

        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[RecetteSearchBar(), RecetteList()],
        )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: UsefulColors.peche4,
          onPressed: () {},
          tooltip: 'GuessMyFood',
          child: Icon(
            Icons.photo_camera,
          ),
        ), //
      ),
    );
  }
}
