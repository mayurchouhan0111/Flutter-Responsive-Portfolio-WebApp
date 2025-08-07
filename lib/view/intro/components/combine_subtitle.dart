import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/intro/components/subtitle_text.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../view model/responsive.dart';

class CombineSubtitleText extends StatefulWidget {
  const CombineSubtitleText({super.key});

  @override
  State<CombineSubtitleText> createState() => _CombineSubtitleTextState();
}

class _CombineSubtitleTextState extends State<CombineSubtitleText>
    with TickerProviderStateMixin {
  late AnimationController _shimmerController;
  late Animation<double> _shimmerAnimation;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _shimmerAnimation = Tween<double>(
      begin: -1.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: _shimmerController,
      curve: Curves.easeInOutSine,
    ));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shimmerAnimation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                (_shimmerAnimation.value - 0.5).clamp(0.0, 1.0),
                _shimmerAnimation.value.clamp(0.0, 1.0),
                (_shimmerAnimation.value + 0.5).clamp(0.0, 1.0),
              ],
              colors: const [
                Color(0xFF64FFDA), // Cyan accent
                Color(0xFF40E0D0), // Turquoise
                Color(0xFF00BCD4), // Cyan
              ],
            ).createShader(bounds);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Responsive(
                desktop: AnimatedSubtitleText(
                  start: 30.sp, end: 40.sp, text: 'Flutter ',
                ),
                largeMobile: AnimatedSubtitleText(
                  start: 30.sp, end: 25.sp, text: 'Flutter ',
                ),
                mobile: AnimatedSubtitleText(
                  start: 25.sp, end: 20.sp, text: 'Flutter ',
                ),
                tablet: AnimatedSubtitleText(
                  start: 40.sp, end: 30.sp, text: 'Flutter ',
                ),
              ),
              Responsive(
                desktop: AnimatedSubtitleText(
                  start: 30.sp, end: 40.sp, text: 'Developer', gradient: true,
                ),
                largeMobile: AnimatedSubtitleText(
                  start: 30.sp, end: 25.sp, text: 'Developer', gradient: true,
                ),
                mobile: AnimatedSubtitleText(
                  start: 25.sp, end: 20.sp, text: 'Developer', gradient: true,
                ),
                tablet: AnimatedSubtitleText(
                  start: 40.sp, end: 30.sp, text: 'Developer', gradient: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
