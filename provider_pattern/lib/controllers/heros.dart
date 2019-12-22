import 'package:flutter/widgets.dart';
import 'package:provider_pattern/models/hero.dart';

class HerosController extends ChangeNotifier {
  List<HeroModel> heros = [
    HeroModel(name: "Iron Man", isFavorite: true),
    HeroModel(name: "Thor", isFavorite: true),
    HeroModel(name: "Captain America", isFavorite: true),
    HeroModel(name: "Hulk"),
    HeroModel(name: "Doctor Strange"),
    HeroModel(name: "Spider Man"),
  ];

  checkFavorite(HeroModel hero) {
    hero.isFavorite = !hero.isFavorite;
    notifyListeners();
  }
}
