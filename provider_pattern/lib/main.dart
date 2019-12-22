import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_pattern/controllers/heros.dart';
import 'package:provider_pattern/home.dart';

void main() => runApp(HerosApp());

class HerosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HerosController>.value(value: HerosController())
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
