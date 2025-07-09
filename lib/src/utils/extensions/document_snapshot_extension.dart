import 'package:cloud_firestore/cloud_firestore.dart';

extension DocumentSnapshotExtension<T extends Object?> on DocumentReference<Map<String, dynamic>> {
  Future<DocumentSnapshot<Map<String, dynamic>>> get getCacheOrServer async {
    try {
      return await get(const GetOptions(source: Source.cache));
    } catch (e) {
      return await get(const GetOptions(source: Source.server));
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> get getServerOrCache async {
    try {
      return await get(const GetOptions(source: Source.server));
    } catch (e) {
      return await get(const GetOptions(source: Source.cache));
    }
  }
}

extension QuerySnapshotExtension<T extends Object?> on Query<T> {
  Future<QuerySnapshot<T>> get getCacheOrServer async {
    try {
      return await get(const GetOptions(source: Source.cache));
    } catch (e) {
      return await get(const GetOptions(source: Source.server));
    }
  }

  Future<QuerySnapshot<T>> get getServerOrCache async {
    try {
      return await get(const GetOptions(source: Source.server));
    } catch (e) {
      return await get(const GetOptions(source: Source.cache));
    }
  }
}
