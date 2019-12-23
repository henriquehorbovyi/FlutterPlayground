
import 'package:awesome_widgets/screens/home_screen.dart';
import 'package:awesome_widgets/screens/wrap_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => HomeScreen(),
  "/wrap": (BuildContext context) => WrapScreen(),
};