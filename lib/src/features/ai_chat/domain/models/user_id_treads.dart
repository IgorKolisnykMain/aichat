import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_id_treads.freezed.dart';
part 'user_id_treads.g.dart';

@freezed
abstract class UserIdTreads with _$UserIdTreads {
  factory UserIdTreads({required List<String> threads}) = _UserIdTreads;

  factory UserIdTreads.fromJson(Map<String, dynamic> json) => _$UserIdTreadsFromJson(json);
}
