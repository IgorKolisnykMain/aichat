import 'package:purchases_flutter/purchases_flutter.dart';

extension PackageUtils on Package {
  double? getMonthlyPrice() {
    final price = storeProduct.price;
    final duration = packageType.duration;

    if (duration == null) return null;

    return switch (packageType) {
      PackageType.weekly => price * 4.33, // Approximate weeks per month
      PackageType.monthly => price,
      PackageType.twoMonth => price / 2,
      PackageType.threeMonth => price / 3,
      PackageType.sixMonth => price / 6,
      PackageType.annual => price / 12,
      _ => null,
    };
  }
}

extension PackageTypeUtils on PackageType {
  Duration? get duration {
    return switch (this) {
      PackageType.weekly => const Duration(days: 7),
      PackageType.monthly => const Duration(days: 30),
      PackageType.twoMonth => const Duration(days: 60),
      PackageType.threeMonth => const Duration(days: 90),
      PackageType.sixMonth => const Duration(days: 180),
      PackageType.annual => const Duration(days: 365),
      _ => null,
    };
  }
}
