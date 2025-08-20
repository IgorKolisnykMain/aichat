abstract class ThreadIdStorage {
  /// Get all thread IDs for the current user
  Future<List<String>> fetchUserThreadIds();

  /// Watch for changes in thread IDs for the current user
  Stream<List<String>> watchUserThreadIds();

  /// Add a new thread ID to user's list
  Future<void> addThreadId(String threadId);

  /// Remove a thread ID from user's list
  Future<void> removeThreadId(String threadId);

  /// Clear all thread IDs for the current user
  Future<void> clearAllThreadIds();

  /// Dispose resources
  void dispose();
}
