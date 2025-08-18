import 'package:freezed_annotation/freezed_annotation.dart';

part 'used_tokens.freezed.dart';
part 'used_tokens.g.dart';

@freezed
abstract class UsedTokens with _$UsedTokens {
  const factory UsedTokens({
    @Default([]) List<String> usedTokens,
  }) = _UsedTokens;

  factory UsedTokens.fromJson(Map<String, dynamic> json) => _$UsedTokensFromJson(json);
}
