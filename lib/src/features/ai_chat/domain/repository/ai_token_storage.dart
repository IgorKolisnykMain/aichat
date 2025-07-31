abstract class AITokenStorage {
  Future<List<String>> getUsedTokens();
  Future<void> updateUsedTokens(List<String> usedTokens);
}
