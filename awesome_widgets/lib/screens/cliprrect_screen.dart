import 'package:flutter/material.dart';

class ClipRRectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Container(
                padding: EdgeInsets.all(16),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(56)),
                    child: Image.asset("cat.jpg")))),
      ),
    );
  }
}
