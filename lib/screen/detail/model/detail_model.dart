class DetailModel {
  int? id;
  String? quote, author;

  DetailModel({this.id, this.author, this.quote});

  factory DetailModel.mapToModel(Map m1) {
    return DetailModel(id: m1['id'], author: m1['author'], quote: m1['quotes']);
  }
}
