import 'package:flutter/material.dart';

class AwesomeWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 16),
          Text(
            "Awesome Widgets",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Wrap(
            children: <Widget>[
              listTile("Wrap", () {
                Navigator.pushNamed(context, "/wrap");
              }),
              listTile("ClipRRect", () {
                Navigator.pushNamed(context, "/clipRRect");
              }),
              listTile("MediaQuery", () {
                Navigator.pushNamed(context, "/mediaQuery");
              }),
            ],
          )
        ],
      ),
    );
  }
}

ListTile listTile(String texto, ListTileAction action) {
  return ListTile(
    title: Text(texto),
    onTap: () => action(),
  );
}

typedef ListTileAction = Function();
