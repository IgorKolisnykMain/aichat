abstract class AITokenStorage {
  Future<List<String>> fetchUsedTokens();
  Stream<List<String>> watchUsedTokens();
  Future<void> updateUsedTokens(List<String> usedTokens);
}
