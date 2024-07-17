class HomeModel {
  int? id;
  String? category;
  List? quotes = [];
  List? image = [];
  List? author = [];

  HomeModel({this.id, this.category, this.quotes, this.image, this.author});

  factory HomeModel.mapToModel(Map m1) {
    return HomeModel(
      id: m1['id'],
      category: m1['category'],
      author: m1['author'],
      quotes: m1['quotes'],
      image: m1['image'],
    );
  }
}

class ApiHomeModel {
  int? id;
  String? text, author, category;

  ApiHomeModel({this.id, this.text, this.author, this.category});

  factory ApiHomeModel.mapToModel(Map m1) {
    return ApiHomeModel(
        id: m1['id'],
        author: m1['author'],
        category: m1['category'],
        text: m1['text']);
  }
}
