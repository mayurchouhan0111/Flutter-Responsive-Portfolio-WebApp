import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../res/constants.dart';
import 'animated_texts_componenets.dart';
import 'download_button.dart';

class IntroBody extends StatefulWidget {
  const IntroBody({super.key});

  @override
  State<IntroBody> createState() => _IntroBodyState();
}

class _IntroBodyState extends State<IntroBody> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeController.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      _slideController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;
        final isTablet = constraints.maxWidth >= 700 && constraints.maxWidth < 1080;

        return AnimationLimiter(
          child: Container(
            constraints: BoxConstraints(
              minHeight: isMobile ? 500.h : 400.h,
            ),
            child: isMobile
                ? _buildMobileLayout()
                : _buildDesktopLayout(isTablet),
          ),
        );
      },
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
          _buildAnimatedImage(true),
          SizedBox(height: 40.h),
          _buildTextContent(true),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: _buildTextContent(false),
        ),
        SizedBox(width: 60.w),
        Expanded(
          flex: 2,
          child: _buildAnimatedImage(false),
        ),
      ],
    );
  }

  Widget _buildAnimatedImage(bool isMobile) {
    return AnimationConfiguration.staggeredList(
      position: 0,
      duration: const Duration(milliseconds: 1000),
      child: SlideAnimation(
        horizontalOffset: isMobile ? 0 : 100,
        verticalOffset: isMobile ? 50 : 0,
        child: FadeInAnimation(
          child: AnimatedImageContainer(
            width: isMobile ? 200.w : 300.w,
            height: isMobile ? 240.h : 360.h,
          ),
        ),
      ),
    );
  }

  Widget _buildTextContent(bool isMobile) {
    return AnimationConfiguration.staggeredList(
      position: 1,
      duration: const Duration(milliseconds: 800),
      child: SlideAnimation(
        horizontalOffset: isMobile ? 0 : -100,
        child: FadeInAnimation(
          child: Column(
            crossAxisAlignment: isMobile
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildMainHeading(isMobile),
              SizedBox(height: 16.h),
              _buildSubtitle(isMobile),
              SizedBox(height: 24.h),
              _buildDescription(isMobile),
              SizedBox(height: 40.h),
              _buildCTAButton(isMobile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainHeading(bool isMobile) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [
          Color(0xFF263238), // Dark blue-grey
          Color(0xFF37474F), // Medium blue-grey
          Color(0xFF455A64), // Light blue-grey
        ],
      ).createShader(bounds),
      child: Text(
        'My Personal Portfolio',
        textAlign: isMobile ? TextAlign.center : TextAlign.left,
        style: TextStyle(
          fontSize: isMobile ? 32.sp : 48.sp,
          fontWeight: FontWeight.w900,
          letterSpacing: -0.5,
          height: 1.1,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSubtitle(bool isMobile) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Flutter ',
            style: TextStyle(
              fontSize: isMobile ? 24.sp : 32.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF37474F),
            ),
          ),
          TextSpan(
            text: 'Developer',
            style: TextStyle(
              fontSize: isMobile ? 24.sp : 32.sp,
              fontWeight: FontWeight.w700,
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [
                    Color(0xFF00BCD4),
                    Color(0xFF64FFDA),
                  ],
                ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
            ),
          ),
        ],
      ),
      textAlign: isMobile ? TextAlign.center : TextAlign.left,
    );
  }

  Widget _buildDescription(bool isMobile) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: isMobile ? double.infinity : 500.w,
      ),
      child: Text(
        "I specialize in building high-performance Flutter applications with clean architecture, smooth animations, and exceptional user experiences that drive business results.",
        textAlign: isMobile ? TextAlign.center : TextAlign.left,
        style: TextStyle(
          fontSize: isMobile ? 16.sp : 18.sp,
          color: const Color(0xFF607D8B),
          height: 1.6,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.3,
        ),
      ),
    );
  }

  Widget _buildCTAButton(bool isMobile) {
    return Align(
      alignment: isMobile ? Alignment.center : Alignment.centerLeft,
      child: const DownloadButton(),
    );
  }
}
