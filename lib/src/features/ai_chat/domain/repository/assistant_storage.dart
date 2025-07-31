abstract class AssistantStorage {
  Future<String?> getAssistantId();
  Future<void> saveAssistantId(String assistantId);
}
