import 'dart:math';

import 'package:aicook_mobile/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'views/Recette.dart';
import 'views/Regime.dart';
import 'views/Local.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePageNavigation());
  }
}

class HomePageNavigation extends StatefulWidget {
  HomePageNavigation({Key key}) : super(key: key);

  @override
  _HomePageNavigationState createState() => _HomePageNavigationState();
}

class _HomePageNavigationState extends State<HomePageNavigation> {
  final Color tabColor = Color(0xffd7740c);
  final Color primaryColor = Color(0xffFD6592);
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);
  int _selectedIndex = 0;

  final List<Widget> _children = <Widget>[
    RecettePage(),
    // RegimePage(),
    LocalPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          primaryColor: primaryColor,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            textTheme: TextTheme(
              title: TextStyle(
                color: secondaryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            iconTheme: IconThemeData(color: secondaryColor),
            actionsIconTheme: IconThemeData(
              color: secondaryColor,
            ),
          ),
        ),
        child: Scaffold(
          backgroundColor: UsefulColors.bg,
          body: _children.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.fastfood), title: Text('Recette')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_basket),
                    title: Text('Producteur'))
              ],
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              }),
        ));
  }
}
