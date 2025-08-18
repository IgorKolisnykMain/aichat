import 'dart:async';

import 'package:aichat/src/exceptions/error_logger.dart';
import 'package:aichat/src/features/ai_chat/domain/models/ai_message.dart';
import 'package:aichat/src/features/ai_chat/domain/models/chat_history.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/chat_storage.dart';
import 'package:aichat/src/features/onboarding/auth/domain/models/app_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const _users = 'users';

class FirestoreChatStorage implements ChatStorage {
  final FirebaseFirestore fireStore;
  late StreamSubscription<AppUser?> _userStream;
  String? _userId;

  final ErrorLogger errorLogger;

  FirestoreChatStorage({
    required this.fireStore,
    required Stream<AppUser?> userStream,
    required this.errorLogger,
  }) {
    _userStream = userStream.listen((user) {
      _userId = user?.uid;
    });
  }

  void dispose() {
    _userStream.cancel();
  }

  DocumentReference<Map<String, dynamic>> get _userChatHistoryRef => fireStore.doc('$_users/$_userId');

  @override
  Future<ChatHistory> getChatHistory() async {
    try {
      final userChatHistoryDocSnap = await _userChatHistoryRef
          .withConverter(
            fromFirestore: (snapshot, options) => ChatHistory.fromJsonChatHistory(snapshot.data()!),
            toFirestore: (userChat, options) => userChat.toJsonChatHistory(),
          )
          .get();

      return userChatHistoryDocSnap.data() ?? const ChatHistory(messages: []);
    } catch (e) {
      errorLogger.logError(e, StackTrace.current);
      return const ChatHistory(messages: []);
    }
  }

  @override
  Future<void> addMessage(AiMessage message) async {
    final chatHistory = await getChatHistory();
    final updatedHistory = chatHistory.addMessage(message);
    // TODO: Move the chatHistory field to a separate collection in Firestore.
    _userChatHistoryRef.set(updatedHistory.toJsonChatHistory(), SetOptions(merge: true));
  }

  @override
  Future<String> createThread() {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteThread(String threadId) {
    throw UnimplementedError();
  }

  @override
  Future<ChatHistory> getThreadHistory(String threadId) {
    return getChatHistory();
  }
}
