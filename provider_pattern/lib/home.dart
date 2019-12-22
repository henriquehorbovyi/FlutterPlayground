

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_pattern/controllers/heros.dart';
import 'package:provider_pattern/models/hero.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  createState() => _HomePageState();
 }

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Consumer<HerosController>(
          builder: (context, controller, widget) {
            var count = controller.heros.where((hero) => hero.isFavorite).length;
            return Center(
              child: Text("$count", style: TextStyle(fontSize: 18),)
            );
          },
        ),
      ),
      body: Consumer<HerosController>(
        builder: (context, herosController, widget) {
          return _buildHeroList();
        },
      )
      );
  }

  _buildHeroList() {
    HerosController heroController = Provider.of<HerosController>(context);

    return ListView.builder(
        itemCount: heroController.heros.length,
        itemBuilder: (context, index) {
          return _buildHeroItem(heroController.heros[index]); 
        },
    );
  }

  _buildHeroItem(HeroModel hero) {
    HerosController herosController = Provider.of<HerosController>(context);

    return ListTile(
      title: Text(hero.name),
      trailing: hero.isFavorite ? Icon(Icons.star, color: Colors.yellow) : Icon(Icons.star_border),
      onTap: () => herosController.checkFavorite(hero)
    );     
  }

}