class DetailModel {
  int? id;
  String? quote, author, category;

  DetailModel({this.id, this.author, this.quote, this.category});

  factory DetailModel.mapToModel(Map m1) {
    return DetailModel(
        id: m1['id'],
        author: m1['author'],
        quote: m1['quotes'],
        category: m1['category']);
  }
}
