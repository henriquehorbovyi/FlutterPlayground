import 'package:awesome_widgets/components/awesome_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Showcase: SafeArea :P 
    return SafeArea(
      child: Scaffold(
        body: AwesomeWidgets(),
      ),
    );
  }
}
