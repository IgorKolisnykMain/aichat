import 'package:aichat/src/features/onboarding/subscription/domain/enums/subscription_plan.dart';
import 'package:purchases_flutter/models/package_wrapper.dart';

extension PackageExtension on Package {
  SubscriptionPlan? mapPackageToPlan() {
    if (packageType == PackageType.monthly) {
      return SubscriptionPlan.monthly;
    } else if (packageType == PackageType.annual) {
      return SubscriptionPlan.yearly;
    } else if (identifier.toLowerCase().contains('trial')) {
      return SubscriptionPlan.freeTrial;
    }
    return null;
  }
}
