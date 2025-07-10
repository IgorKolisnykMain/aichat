abstract interface class UserRepository {
  String? get userId;

  Future<void> loadData();

  Future<void> cleanData();
  Future<void> deleteAccount();
}
