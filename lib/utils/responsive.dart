import 'package:flutter/material.dart';

class Responsive {
  // =======================
  // Base responsive values
  // =======================
  static late double width;
  static late double height;

  static void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  // Your existing breakpoints (kept unchanged)
  static bool get isMobile => width < 600;
  static bool get isTablet => width >= 600 && width < 1024;
  static bool get isDesktop => width >= 1024;

  // =======================
  // Added: scale factor
  // (Useful for spacing, padding, chips, icons)
  // =======================
  static double scaleFactor(BuildContext context) {
    if (isDesktop) return 1.0;
    if (isTablet) return 0.93;

    // For mobile
    if (width < 360) return 0.82; // very small phones
    return 0.90;
  }

  // =======================
  // TEXT SIZE HELPERS (your original)
  // =======================

  static double get desktopText30 {
    if (isDesktop) return 30;
    if (isTablet) return 28;
    return 26;
  }

  static double get desktopText24 {
    if (isDesktop) return 24;
    if (isTablet) return 22;
    return 20;
  }

  static double get desktopText20 {
    if (isDesktop) return 20;
    if (isTablet) return 18;
    return 17;
  }

  static double get desktopText18 {
    if (isDesktop) return 18;
    if (isTablet) return 17;
    return 16;
  }

  static double get desktopText16 {
    if (isDesktop) return 16;
    if (isTablet) return 15;
    return 14;
  }

  static double get desktopText14 {
    if (isDesktop) return 14;
    return 13;
  }

  static double get desktopText12 {
    if (isDesktop) return 12;
    if (isTablet) return 10;
    return 9;
  }

  // =======================
  // FLOATING BUTTON SIZES (your original)
  // =======================
  static double get floatingButtonSize {
    if (isDesktop) return 60;
    if (isTablet) return 53;
    return 43.5;
  }

  static double get floatingIconSize {
    if (isDesktop) return 28;
    if (isTablet) return 24;
    return 20;
  }

  static double get floatingBadgeSize {
    if (isDesktop) return 24;
    if (isTablet) return 20;
    return 16;
  }

  static double get floatingBadgeFont {
    if (isDesktop) return 12;
    if (isTablet) return 10;
    return 8;
  }

  static double get buttonHeight {
    if(isDesktop) return 40;
    if(isTablet) return 38;
    return 37;
  }
}
