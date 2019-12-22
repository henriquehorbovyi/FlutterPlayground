import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_pattern/controllers/hero_controllers.dart';
import 'package:provider_pattern/pages/home_page.dart';

void main() => runApp(HerosApp());

class HerosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HeroesController>.value(value: HeroesController())
      ],
      child: MaterialApp(
        title: 'Flutter Provider Test',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: HomePage(title: 'Flutter Provider Test'),
      ),
    );
  }
}
