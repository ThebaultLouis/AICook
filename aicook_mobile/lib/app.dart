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
  static final String path = "lib/src/pages/blog/bhome1.dart";
  final Color tabColor = Color(0xffd7740c);
  final Color primaryColor = Color(0xffFD6592);
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);
  int _selectedIndex = 0;

  final List<Widget> _children = <Widget>[
    RecettePage(),
    RegimePage(),
    LocalPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Theme(
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
              appBar: AppBar(
                centerTitle: true,
                title: Text('Ai Cook'),
                leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.account_circle),
                    onPressed: () {},
                  )
                ],
                bottom: TabBar(
                  isScrollable: true,
                  labelColor: tabColor,
                  indicatorColor: tabColor,
                  unselectedLabelColor: secondaryColor,
                  onTap: _onItemTapped,
                  tabs: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Recette"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Régime"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Acheter local"),
                    )
                  ],
                ),
              ),
              body: Dismissible(
                resizeDuration: null,
                onDismissed: (DismissDirection direction) {
                  if (direction == DismissDirection.endToStart) {
                    setState(() {
                      _selectedIndex = max(0, _selectedIndex - 1);
                    });
                  } else {
                    setState(() {
                      _selectedIndex = min(2, _selectedIndex + 1);
                    });
                  }
                },
                key: new ValueKey(_selectedIndex),
                child: TabBarView(children: _children),
                // child: Center(
                //   child: _children.elementAt(_selectedIndex),
                // ),
              ))),
      // body:
      // TabBarView(
      //   children: <Widget>[
      //     ListView.separated(
      //       padding: const EdgeInsets.all(16.0),
      //       itemCount: articles.length,
      //       itemBuilder: (context, index) {
      //         return _buildArticleItem(index);
      //       },
      //       separatorBuilder: (context, index) =>
      //           const SizedBox(height: 16.0),
      //     ),
      //     Container(
      //       child: Text("Tab 2"),
      //     )10
      //     Container(
      //       child: Text("Tab 3"),
      //     ),
      //     Container(
      //       child: Text("Tab 4"),
      //     ),
      //     Container(
      //       child: Text("Tab 5"),
      //     ),
      //   ],
      // ),
    );
  }
}
