import 'package:awesome_widgets/screens/alignment_screen.dart';
import 'package:awesome_widgets/screens/cliprrect_screen.dart';
import 'package:awesome_widgets/screens/home_screen.dart';
import 'package:awesome_widgets/screens/media_query_screen.dart';
import 'package:awesome_widgets/screens/wrap_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => HomeScreen(),
  "/wrap": (BuildContext context) => WrapScreen(),
  "/clipRRect": (BuildContext context) => ClipRRectScreen(),
  "/mediaQuery": (BuildContext context) => MediaQuqeryScreen(),
  "/align": (BuildContext context) => AlignmentScreen(),
};
