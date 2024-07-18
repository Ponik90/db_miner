class QuotesModel {
  String? name;
  int? id;

  QuotesModel({this.name, this.id});

  factory QuotesModel.mapToModel(Map m1) {
    return QuotesModel(id: m1['id'], name: m1['name']);
  }
}
