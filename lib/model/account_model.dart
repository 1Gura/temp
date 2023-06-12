

class AccountModel {
  String id;
  int type;
  String name;
  int status;

  // LifeTimeAccountModel openedDate;
  // LifeTimeAccountModel closedDate;
  int accessLevel;

  AccountModel({
    required this.id,
    required this.type,
    required this.name,
    required this.status,
    // required this.openedDate,
    // required this.closedDate,
    required this.accessLevel,
  });

  factory AccountModel.fromJson(dynamic json) {
    return AccountModel(
      id: json["id"],
      type: json["type"],
      name: json["name"],
      status: json["status"],
      // openedDate: json["openedDate"],
      // closedDate: json["closedDate"],
      accessLevel: json["accessLevel"],
    );
  }
}
