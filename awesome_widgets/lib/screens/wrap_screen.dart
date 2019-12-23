import 'package:flutter/material.dart';

class WrapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var center = Center(child: Text("Box 2"));
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            /* If you use Row or Column it won't be wrapped and 
               the screen will break.
            */ 
            // WRAP
            child: Wrap(children: <Widget>[
              Container(
                color: Colors.red,
                height: 60,
                width: 150,
                child: Center(
                  child: Text("Box 1")
                ),
              ),
              Container(
                color: Colors.green,
                height: 60,
                width: 150,
                child: center,
              ),
              Container(
                color: Colors.blue,
                height: 60,
                width: 150,
                child: Center(child: Text("Box 3")),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
