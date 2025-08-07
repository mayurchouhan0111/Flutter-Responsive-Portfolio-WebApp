import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view/splash/splash_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Define breakpoints for responsive design
class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      ensureScreenSize: false,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
            scaffoldBackgroundColor: primaryColor,
            useMaterial3: true,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white), // Fixed: Use white text instead of primaryColor
          ),
          home: const ResponsiveLayout(child: SplashView()),
        );
      },
      // Removed the conflicting child parameter completely
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  final Widget child;

  const ResponsiveLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use MediaQuery for more reliable screen width detection
        double screenWidth = MediaQuery.of(context).size.width;

        if (screenWidth >= Breakpoints.desktop) {
          return _DesktopLayout(child: child);
        } else if (screenWidth >= Breakpoints.tablet) {
          return _TabletLayout(child: child);
        } else {
          return _MobileLayout(child: child);
        }
      },
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  final Widget child;

  const _DesktopLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 1200.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: child,
      ),
    );
  }
}

class _TabletLayout extends StatelessWidget {
  final Widget child;

  const _TabletLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 900.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: child,
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  final Widget child;

  const _MobileLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: child,
    );
  }
}
