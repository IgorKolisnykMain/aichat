class FirebaseAppUser {
  FirebaseAppUser(this._user);

  final User _user;

  String get uid => _user.uid;
  String get email => _user.email!;
}
