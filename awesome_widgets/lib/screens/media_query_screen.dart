import 'package:flutter/material.dart';

class MediaQuqeryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return SafeArea(
      child: Scaffold(
          body: (orientation == Orientation.portrait)
              ? Column(
                  children: elements(),
                )
              : Row(
                  children: elements(),
                )),
    );
  }

  List<Widget> elements() {
    return [
      Flexible(
        flex: 5,
        child: Container(
          color: Colors.blue,
        ),
      ),
      Flexible(
        flex: 5,
        child: Container(
          color: Colors.yellow,
        ),
      )
    ];
  }
}
