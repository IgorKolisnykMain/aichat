import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_arg.freezed.dart';
part 'email_arg.g.dart';

@freezed
class EmailArg with _$EmailArg {
  factory EmailArg({required String email}) = _EmailArg;

  factory EmailArg.fromJson(Map<String, dynamic> json) => _$EmailArgFromJson(json);
}
