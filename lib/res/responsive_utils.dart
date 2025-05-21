import 'package:flutter/material.dart';

class ResponsiveUtils {
  // Breakpoints
  static const double mobileBreakpoint = 500;
  static const double largeMobileBreakpoint = 700;
  static const double tabletBreakpoint = 1080;
  static const double desktopBreakpoint = 1400;

  // Screen size helpers
  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width <= mobileBreakpoint;

  static bool isLargeMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width <= largeMobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width <= tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width > tabletBreakpoint;

  static bool isExtraLargeScreen(BuildContext context) =>
      MediaQuery.sizeOf(context).width > desktopBreakpoint;

  // Responsive value helpers
  static double getResponsiveValue({
    required BuildContext context,
    required double mobile,
    required double tablet,
    required double desktop,
  }) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return tablet;
    return desktop;
  }

  static EdgeInsets getResponsivePadding({
    required BuildContext context,
    required EdgeInsets mobile,
    required EdgeInsets tablet,
    required EdgeInsets desktop,
  }) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return tablet;
    return desktop;
  }

  static double getResponsiveFontSize({
    required BuildContext context,
    required double mobile,
    required double tablet,
    required double desktop,
  }) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return tablet;
    return desktop;
  }

  // Layout helpers
  static Widget responsiveBuilder({
    required BuildContext context,
    required Widget mobile,
    required Widget tablet,
    required Widget desktop,
  }) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return tablet;
    return desktop;
  }

  // Grid helpers
  static int getResponsiveGridCrossAxisCount(BuildContext context) {
    if (isMobile(context)) return 1;
    if (isLargeMobile(context)) return 2;
    if (isTablet(context)) return 3;
    return 4;
  }

  static double getResponsiveGridSpacing(BuildContext context) {
    if (isMobile(context)) return 8.0;
    if (isLargeMobile(context)) return 16.0;
    if (isTablet(context)) return 24.0;
    return 32.0;
  }
}
