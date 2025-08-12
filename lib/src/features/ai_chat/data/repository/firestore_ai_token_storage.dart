import 'dart:async';

import 'package:aichat/src/exceptions/error_logger.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/ai_token_storage.dart';
import 'package:aichat/src/features/onboarding/auth/domain/models/app_user.dart';
import 'package:aichat/src/utils/firestore/user/firestore_user_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreAiTokenStorage implements AITokenStorage {
  static const _usedAiTokens = '_used_ai_tokens';

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

  DocumentReference<Map<String, dynamic>> get _userDocRef => getUserDocRef(_userId, fireStore);

  @override
  Future<List<String>> getUsedTokens() async {
    try {
      final data = (await _userDocRef.get(const GetOptions(source: Source.server))).data();
      final List<dynamic> result = data?[_usedAiTokens] as List<dynamic>? ?? [];
      return result.map((e) => e as String).toList();
    } catch (e) {
      errorLogger.logError(e, StackTrace.current);
      return [];
    }
  }

  @override
  Future<void> updateUsedTokens(List<String> usedTokens) async {
    await _userDocRef.set({_usedAiTokens: usedTokens}, SetOptions(merge: true));
  }
}
