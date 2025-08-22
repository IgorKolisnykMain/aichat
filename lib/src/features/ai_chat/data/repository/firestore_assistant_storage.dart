import 'package:aichat/src/exceptions/error_logger.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/assistant_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreAssistantStorage implements AssistantStorage {
  static const _assistantIdKey = 'assistant_id';
  static const _appConfigDocument = 'app_config';

  final FirebaseFirestore fireStore;

  final ErrorLogger errorLogger;

  FirestoreAssistantStorage({required this.fireStore, required this.errorLogger});

  DocumentReference<Map<String, dynamic>> get _appConfigRawRef => fireStore.doc('config/$_appConfigDocument');

  DocumentReference<String?> get _assistantIdRef => _appConfigRawRef.withConverter(
    fromFirestore: (snapshot, options) => snapshot.data()?[_assistantIdKey] as String?,
    toFirestore: (assistantId, options) => {_assistantIdKey: assistantId},
  );

  @override
  Future<String?> fetchAssistantId() async {
    try {
      return (await _assistantIdRef.get()).data();
    } catch (e) {
      errorLogger.logError(e, StackTrace.current);
      return null;
    }
  }

  @override
  Stream<String?> watchAssistantId() {
    try {
      return _assistantIdRef.snapshots().map((docSnapshot) => docSnapshot.data());
    } catch (e) {
      errorLogger.logError(e, StackTrace.current);
      return const Stream<String?>.empty();
    }
  }

  @override
  Future<void> saveAssistantId(String assistantId) async {
    await _assistantIdRef.set(assistantId);
  }
}
