import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_pattern/controllers/hero_controllers.dart';
import 'package:provider_pattern/models/hero_model.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);
  
  createState() {
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          leading: Consumer<HeroesController>(
            builder: (context, controller, widget) {
              var count = controller.heroes.where((hero) => hero.isFavorite).length;
              return Center(
                  child: Text(
                count.toString(),
                style: TextStyle(fontSize: 18),
              ));
            },
          ),
        ),
        body: Consumer<HeroesController>(
          builder: (context, herosController, widget) {
            return  _buildHeroList();
          },
        ));
  }

  _buildHeroList() {
    HeroesController heroesController = Provider.of<HeroesController>(context);
    
    return ListView.builder(
        itemCount: heroesController.heroes.length,
        itemBuilder: (context, index) {
          return _buildHeroItem(heroesController.heroes[index]);
        },
      );
  }

  _buildHeroItem(HeroModel hero) {
    HeroesController herosController = Provider.of<HeroesController>(context);

    return ListTile(
        title: Text(hero.name),
        trailing: hero.isFavorite
            ? Icon(Icons.star, color: Colors.yellow)
            : Icon(Icons.star_border),
        onTap: () => herosController.checkFavorite(hero));
  }
}
