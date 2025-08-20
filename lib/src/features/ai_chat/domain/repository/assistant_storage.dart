abstract class AssistantStorage {
  Future<String?> fetchAssistantId();
  Stream<String?> watchAssistantId();
  Future<void> saveAssistantId(String assistantId);
}
