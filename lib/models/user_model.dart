class User {
  String _phoneNo;

  User(this._phoneNo);

  String get phoneNo => _phoneNo;

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNo,
      };
}
