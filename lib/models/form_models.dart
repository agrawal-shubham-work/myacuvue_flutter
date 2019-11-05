class FormModel {
  String _firstName, _lastName, _gender, _dob, _email, _nric;
  String _wearSpectacles;
  String _wearContactLenses, _durationOfContcatLenses;

  FormModel(
      this._firstName,
      this._lastName,
      this._gender,
      this._dob,
      this._email,
      this._nric,
      this._wearSpectacles,
      this._wearContactLenses,
      this._durationOfContcatLenses);

  get durationOfContcatLenses => _durationOfContcatLenses;

  String get wearContactLenses => _wearContactLenses;

  String get wearSpectacles => _wearSpectacles;

  get nric => _nric;

  get email => _email;

  get dob => _dob;

  get gender => _gender;

  get lastName => _lastName;

  String get firstName => _firstName;

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "dob": dob,
        "email": email,
        "nric": nric,
        "wearSpectacles": wearSpectacles,
        "wearContactLenses": wearContactLenses,
        "durationOfContcatLenses": durationOfContcatLenses,
      };
}
