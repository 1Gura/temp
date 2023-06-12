class AccountsResponseModel {
  List<AccountsResponseModel> accounts;

  AccountsResponseModel({required this.accounts});

  factory AccountsResponseModel.fromJson(dynamic json) {
    return AccountsResponseModel(
      accounts: json["accounts"],
    );
  }
}
