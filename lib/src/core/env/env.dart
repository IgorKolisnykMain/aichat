import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
class Env {
  @EnviedField(varName: 'REVENUE_CAT_PUBLIC_KEY', obfuscate: true)
  static String revenueCatPublicKey = _Env.revenueCatPublicKey;
  @EnviedField(varName: 'OPEN_AI_TOKEN', obfuscate: true)
  static String openAIToken = _Env.openAIToken;

  const Env._();
}
