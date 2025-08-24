import 'dart:async';

import 'package:aichat/src/core/di/modules/firebase_module.dart';
import 'package:aichat/src/features/onboarding/auth/domain/models/app_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_metadata_repository.g.dart';

/// Helper repository class to watch the user medatata in Firestore
@Riverpod(keepAlive: true)
class UserMetadataRepository extends _$UserMetadataRepository {
  late final FirebaseFirestore _firestore;

  @override
  UserMetadataRepository build() {
    _firestore = ref.read(firestoreProvider);
    return this;
  }

  Stream<DateTime?> watchUserMetadata(UserID uid) {
    final ref = _firestore.doc('metadata/$uid');
    return ref.snapshots().map((snapshot) {
      final data = snapshot.data();
      final refreshTime = data?['refreshTime'];
      if (refreshTime is Timestamp) {
        return refreshTime.toDate();
      } else {
        return null;
      }
    });
  }
}
