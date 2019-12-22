import 'dart:convert';
import 'package:provider_pattern/models/hero_model.dart';
import 'package:http/http.dart' as http;

class HeroRepository {

  Future<List<HeroModel>> getHeros() async {

    final response = await http.get("https://superheroapi.com/api/2582627765349190/search/_");
    var heroes = List<HeroModel>();

    if (response.statusCode == 200) {
        var results = jsonDecode(response.body)['results'];
    
        for(var item in results) {
          var hero = HeroModel(name: item['name']);
          heroes.add(hero);
        } 
    }
  
    return heroes;
  }
}