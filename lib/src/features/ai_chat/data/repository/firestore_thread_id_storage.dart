import 'dart:async';

import 'package:aichat/src/exceptions/error_logger.dart';
import 'package:aichat/src/features/ai_chat/domain/models/user_id_treads.dart';
import 'package:aichat/src/features/ai_chat/domain/repository/thread_id_storage.dart';
import 'package:aichat/src/features/onboarding/auth/domain/models/app_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const _userThreadIds = 'threads';
const _userFieldName = 'users';

class FirestoreThreadIdStorage implements ThreadIdStorage {
  final FirebaseFirestore fireStore;
  late StreamSubscription<AppUser?> _userStream;
  String? _userId;

  final ErrorLogger errorLogger;

  FirestoreThreadIdStorage({
    required this.fireStore,
    required Stream<AppUser?> userStream,
    required this.errorLogger,
  }) {
    _userStream = userStream.listen((user) {
      _userId = user?.uid;
    });
  }

  @override
  void dispose() {
    _userStream.cancel();
  }

  DocumentReference<Map<String, dynamic>> get _userThreadIdsRawRef => fireStore.doc('$_userFieldName/$_userId');
  DocumentReference<UserIdTreads> get _userThreadIdsRef => _userThreadIdsRawRef
          .withConverter(
            fromFirestore: (snapshot, options) => UserIdTreads.fromJson(snapshot.data()!),
            toFirestore: (userChat, options) => userChat.toJson(),
          );



  @override
  Future<List<String>> fetchUserThreadIds() async {
    try {
      final doc = await _userThreadIdsRef
          .get();
      return doc.data()?.threads ?? [];
    } catch (e) {
      errorLogger.logError(e, StackTrace.current);
      return [];
    }
  }
  @override
  Stream<List<String>> watchUserThreadIds() {
    try {
      final doc = await _userThreadIdsRawRef
          .withConverter(
            fromFirestore: (snapshot, options) => UserIdTreads.fromJson(snapshot.data()!),
            toFirestore: (userChat, options) => userChat.toJson(),
          )
          .get();
      return doc.data()?.threads ?? [];
    } catch (e) {
      errorLogger.logError(e, StackTrace.current);
      return [];
    }
  }

  @override
  Future<void> addThreadId(String threadId) async {
    final currentThreadIds = await getUserThreadIds();
    currentThreadIds.add(threadId);
    await _userThreadIdsRawRef.set(
      {_userThreadIds: currentThreadIds},
      SetOptions(merge: true),
    );
  }

  @override
  Future<void> removeThreadId(String threadId) async {
    final currentThreadIds = await getUserThreadIds();
    currentThreadIds.remove(threadId);
    await _userThreadIdsRawRef.set(
      {_userThreadIds: currentThreadIds},
      SetOptions(merge: true),
    );
  }

  @override
  Future<void> clearAllThreadIds() async {
    await _userThreadIdsRawRef.set(
      {_userThreadIds: <String>[]},
      SetOptions(merge: true),
    );
  }
}
