class LifeTimeAccountModel {
  BigInt seconds;
  BigInt nanos;

  LifeTimeAccountModel({
    required this.seconds,
    required this.nanos,
  });

  factory LifeTimeAccountModel.fromJson(Map<String, dynamic> json) {
    return LifeTimeAccountModel(
      seconds: json["seconds"],
      nanos: json["nanos"],
    );
  }
}
