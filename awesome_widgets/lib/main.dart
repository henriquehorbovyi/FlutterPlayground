import 'package:awesome_widgets/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AwesomeApp());
}

class AwesomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: routes,
    );
  }
}
