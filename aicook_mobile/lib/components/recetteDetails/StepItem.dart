import 'package:aicook_mobile/style/colors.dart';
import 'package:flutter/material.dart';

class StepItem extends StatelessWidget {
  final int index;
  final String title;
  final String content;
  const StepItem({Key key, this.index, this.title, this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: new EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              color: UsefulColors.peche4,
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Text(index < 10 ? "0$index" : index,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0)),
              ),
            ),
            SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(content),
                ],
              ),
            )
          ],
        ));
  }
}
