import 'package:aicook_mobile/components/recette/RecetteSearchFilter.dart';
import 'package:aicook_mobile/style/colors.dart';
import 'package:flutter/material.dart';

import 'LocalSearchFilter.dart';

class LocalSearchBar extends StatefulWidget {
  LocalSearchBar({Key key}) : super(key: key);

  @override
  _LocalSearchBarState createState() => _LocalSearchBarState();
}

class _LocalSearchBarState extends State<LocalSearchBar> {
  final searchController = TextEditingController();
  FocusNode searchFocusNode;

  @override
  void initState() {
    super.initState();
    searchFocusNode = FocusNode();
    searchController.addListener(() {});
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Card(
          child: Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: searchController,
                    focusNode: searchFocusNode,
                    decoration: InputDecoration(
                      focusColor: UsefulColors.rust,
                      // fillColor: UsefulColors.peche4,
                      border: InputBorder.none,
                      icon: IconButton(
                          onPressed: () {}, icon: Icon(Icons.search)),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      searchController.clear();
                      searchFocusNode.unfocus();
                    },
                    icon: Icon(Icons.clear)),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return LocalSearchFilter();
                          });
                    },
                    icon: Icon(Icons.sort)),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.radio_button_checked))
              ],
            ),
          ),
        ),
      ),
      preferredSize: Size.fromHeight(80.0),
    );
  }
}
