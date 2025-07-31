import 'dart:async';

import 'package:aichat/src/features/ai_chat/domain/repository/thread_id_storage.dart';
import 'package:aichat/src/features/onboarding/auth/domain/models/app_user.dart';
import 'package:aichat/src/utils/firestore/user/firestore_user_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreThreadIdStorage implements ThreadIdStorage {
  static const _userThreadIds = 'user_threads';

  final FirebaseFirestore fireStore;
  late StreamSubscription<AppUser?> _userStream;
  String? _userId;

  FirestoreThreadIdStorage({
    required this.fireStore,
    required Stream<AppUser?> userStream,
  }) {
    _userStream = userStream.listen((user) {
      _userId = user?.uid;
    });
  }

  @override
  void dispose() {
    _userStream.cancel();
  }

  DocumentReference<Map<String, dynamic>> get _userDocRef => getUserDocRef(_userId, fireStore);

  @override
  Future<List<String>> getUserThreadIds() async {
    try {
      final data = (await _userDocRef.get(const GetOptions(source: Source.server))).data();
      final List<dynamic> result = data?[_userThreadIds] as List<dynamic>? ?? [];
      return result.map((e) => e as String).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> addThreadId(String threadId) async {
    try {
      final currentThreadIds = await getUserThreadIds();
      if (!currentThreadIds.contains(threadId)) {
        currentThreadIds.add(threadId);
        await _userDocRef.set({_userThreadIds: currentThreadIds}, SetOptions(merge: true));
      }
    } catch (e) {
      // If error occurs, try to create new list with just this thread ID
      await _userDocRef.set({_userThreadIds: [threadId]}, SetOptions(merge: true));
    }
  }

  @override
  Future<void> removeThreadId(String threadId) async {
    try {
      final currentThreadIds = await getUserThreadIds();
      currentThreadIds.remove(threadId);
      await _userDocRef.set({_userThreadIds: currentThreadIds}, SetOptions(merge: true));
    } catch (e) {
      // If error occurs, ignore - thread might not exist
    }
  }

  @override
  Future<void> clearAllThreadIds() async {
    await _userDocRef.set({_userThreadIds: <String>[]}, SetOptions(merge: true));
  }
}
