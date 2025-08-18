import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TimestampNullableConverter implements JsonConverter<DateTime?, dynamic> {
  const TimestampNullableConverter();

  @override
  DateTime? fromJson(dynamic timestamp) {
    if (timestamp == null) {
      return null;
    }
    return (timestamp as Timestamp).toDate().toLocal();
  }

  @override
  Timestamp? toJson(DateTime? date) {
    if (date == null) {
      return null;
    }
    return Timestamp.fromDate(date.toUtc());
  }
}
