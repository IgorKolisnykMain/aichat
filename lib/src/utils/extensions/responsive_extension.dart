import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Extension for responsive sizing that works both on mobile and web
extension ResponsiveExtension on num {
  /// Responsive font size
  double get rsp {
    if (kIsWeb) {
      return toDouble() * 2;
    }
    return sp;
  }

  /// Responsive width
  double get rw {
    if (kIsWeb) {
      return toDouble() * 2;
    }
    return w;
  }

  /// Responsive height
  double get rh {
    if (kIsWeb) {
      return toDouble() * 2;
    }
    return h;
  }

  /// Responsive radius
  double get rr {
    if (kIsWeb) {
      return toDouble() * 2;
    }
    return r;
  }
}

/// Helper class for responsive design
class ResponsiveUtils {
  ResponsiveUtils._();

  /// Check if we're on web platform
  static bool get isWeb => kIsWeb;

  /// Get responsive padding based on platform
  static double getPadding(double mobile, {double? web}) {
    if (kIsWeb) {
      return web ?? mobile;
    }
    return mobile.sp;
  }

  /// Get responsive font size based on platform
  static double getFontSize(double mobile, {double? web}) {
    if (kIsWeb) {
      return web ?? (mobile * 0.8);
    }
    return mobile.sp;
  }

  /// Get max width for content on web
  static double? getMaxWidth() {
    if (kIsWeb) {
      return 1200; // Max content width for web
    }
    return null;
  }
}
