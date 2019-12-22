
class HeroModel {
  String name;
  String imageUrl;
  bool isFavorite;

  HeroModel({this.name, this.imageUrl = "", this.isFavorite = false});

  HeroModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['image.url'];
  }
}