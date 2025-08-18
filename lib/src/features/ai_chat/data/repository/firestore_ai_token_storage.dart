import 'dart:async';

import 'package:aichat/src/exceptions/error_logger.dart';
import 'package:aichat/src/features/ai_chat/domain/models/used_tokens.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/ai_token_storage.dart';
import 'package:aichat/src/features/onboarding/auth/domain/models/app_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const _users = 'users';

class FirestoreAiTokenStorage implements AITokenStorage {
  final FirebaseFirestore fireStore;
  late StreamSubscription<AppUser?> _userStream;
  String? _userId;

  final ErrorLogger errorLogger;

  FirestoreAiTokenStorage({
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

  DocumentReference<Map<String, dynamic>> get _userAiTokenRef => fireStore.doc('$_users/$_userId');

  @override
  Future<List<String>> getUsedTokens() async {
    try {
      final doc = await _userAiTokenRef
          .withConverter(
            fromFirestore: (snapshot, options) => UsedTokens.fromJson(snapshot.data()!),
            toFirestore: (usedTokens, options) => usedTokens.toJson(),
          )
          .get();
      return doc.data()?.usedTokens ?? [];
    } catch (e) {
      errorLogger.logError(e, StackTrace.current);
      return [];
    }
  }

  @override
  Future<void> updateUsedTokens(List<String> usedTokens) async {
    await _userAiTokenRef.set(
      UsedTokens(usedTokens: usedTokens).toJson(),
      SetOptions(merge: true),
    );
  }
}
