import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'REVENUE_CAT_PUBLIC_KEY', obfuscate: true)
  static final String revenueCatPublicKey = _Env.revenueCatPublicKey;
  @EnviedField(varName: 'OPEN_AI_TOKEN', obfuscate: true)
  static final String openAIToken = _Env.openAIToken;
  @EnviedField(varName: 'STRIPE_PUBLISHABLE_KEY', obfuscate: true)
  static final String stripePublishableKey = _Env.stripePublishableKey;

  const Env._();
}
