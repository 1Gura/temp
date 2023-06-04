class DataModel {
  int id;
  String title;
  String description;
  bool done;

  DataModel({
    required this.id,
    required this.title,
    required this.description,
    required this.done,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      done: json["done"],
    );
  }
}
