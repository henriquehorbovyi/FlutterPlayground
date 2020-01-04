import 'package:flutter/material.dart';

class AlignmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Wrap(children: <Widget>[
          Center(
              child: Container(
                  padding: EdgeInsets.all(42),
                  child: Text(
                    "Alignment",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ))),
          Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.black)),
              child: Column(
                children: <Widget>[
                  Align(
                    heightFactor: 0,
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      color: Colors.purple,
                      child: Text(
                        "Top left",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Align(
                      heightFactor: 0,
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        color: Colors.purple,
                        child: Text(
                          "Top right",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  Align(
                    heightFactor: 8,
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      color: Colors.purple,
                      child: Text(
                        "Bottom left",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Align(
                    heightFactor: 0,
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      color: Colors.purple,
                      child: Text(
                        "Bottom right",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
