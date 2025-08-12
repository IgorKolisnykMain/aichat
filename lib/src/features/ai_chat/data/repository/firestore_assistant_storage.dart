import 'package:aichat/src/exceptions/error_logger.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/assistant_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreAssistantStorage implements AssistantStorage {
  static const _assistantIdKey = 'assistant_id';
  static const _appConfigDocument = 'app_config';

  final FirebaseFirestore fireStore;

  final ErrorLogger errorLogger;

  FirestoreAssistantStorage({required this.fireStore, required this.errorLogger});

  DocumentReference<Map<String, dynamic>> get _appConfigRef => fireStore.collection('config').doc(_appConfigDocument);

  @override
  Future<String?> getAssistantId() async {
    try {
      final data = (await _appConfigRef.get()).data();
      return data?[_assistantIdKey] as String?;
    } catch (e) {
      errorLogger.logError(e, StackTrace.current);
      return null;
    }
  }

  @override
  Future<void> saveAssistantId(String assistantId) async {
    await _appConfigRef.set({_assistantIdKey: assistantId}, SetOptions(merge: true));
  }
}
