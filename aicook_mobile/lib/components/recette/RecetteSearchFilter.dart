import 'package:aicook_mobile/style/colors.dart';
import 'package:flutter/material.dart';

class RecetteSearchFilter extends StatefulWidget {
  RecetteSearchFilter({Key key}) : super(key: key);

  @override
  _RecetteSearchFilterState createState() => _RecetteSearchFilterState();
}

class _RecetteSearchFilterState extends State<RecetteSearchFilter> {
  List<bool> _type = [false, false, false];
  int _stars;

  TextStyle headline = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: const Text('Filtrer par'),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'Effacer',
            style: TextStyle(color: UsefulColors.peche4),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text(
            'Filtrer',
            // style: TextStyle(color: UsefulColors.rust)
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Type", style: headline),
                  ],
                ),
                ListTile(
                  title: const Text('Entrée'),
                  leading: Checkbox(
                    value: _type[0],
                    onChanged: (bool value) {
                      setState(() {
                        _type[0] = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Plat principal'),
                  leading: Checkbox(
                    value: _type[1],
                    onChanged: (bool value) {
                      setState(() {
                        _type[1] = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Dessert'),
                  leading: Checkbox(
                    value: _type[2],
                    onChanged: (bool value) {
                      setState(() {
                        _type[2] = value;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Note", style: headline),
                  ],
                ),
                ListTile(
                  title: const Text('5 étoiles'),
                  leading: Radio(
                    value: 5,
                    groupValue: _stars,
                    onChanged: (int value) {
                      setState(() {
                        _stars = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Plus de 4 étoiles'),
                  leading: Radio(
                    value: 4,
                    groupValue: _stars,
                    onChanged: (int value) {
                      setState(() {
                        _stars = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Plus de 3 étoiles'),
                  leading: Radio(
                    value: 3,
                    groupValue: _stars,
                    onChanged: (int value) {
                      setState(() {
                        _stars = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Plus de 2 étoiles'),
                  leading: Radio(
                    value: 2,
                    groupValue: _stars,
                    onChanged: (int value) {
                      setState(() {
                        _stars = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Plus de 1 étoile'),
                  leading: Radio(
                    value: 1,
                    groupValue: _stars,
                    onChanged: (int value) {
                      setState(() {
                        _stars = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
