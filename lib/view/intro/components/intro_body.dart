import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../res/Text_style.dart';
import '../../../res/constants.dart';
import 'animated_texts_componenets.dart';
import 'combine_subtitle.dart';
import 'description_text.dart';
import 'download_button.dart';
import 'headline_text.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;
    final isTablet = screenWidth >= 700 && screenWidth < 1080;
    final isDesktop = screenWidth >= 1080;

    return Container(
      constraints: BoxConstraints(
        minHeight: isMobile ? 500 : 400,
      ),
      child: isMobile
          ? SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 24),
                  AnimatedImageContainer(
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.35,
                  ),
                  SizedBox(height: 32),
                  _IntroTextContent(isMobile: true),
                ],
              ),
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: _IntroTextContent(isMobile: false),
                ),
                SizedBox(width: 48),
                Expanded(
                  flex: 2,
                  child: AnimatedImageContainer(
                    width: isDesktop ? screenWidth * 0.15 : screenWidth * 0.2,
                    height: isDesktop ? screenWidth * 0.18 : screenWidth * 0.23,
                  ),
                ),
              ],
            ),
    );
  }
}

class _IntroTextContent extends StatelessWidget {
  final bool isMobile;
  const _IntroTextContent({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double maxTextWidth = isMobile ? screenWidth * 0.9 : screenWidth * 0.45;
    double maxButtonWidth = isMobile ? screenWidth * 0.8 : 350;

    return AnimationLimiter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
        isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Main heading
          AnimationConfiguration.staggeredList(
            position: 0,
            duration: const Duration(milliseconds: 700),
            child: SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                child: Container(
                  constraints: BoxConstraints(maxWidth: maxTextWidth),
                  child: Text(
                    'My Personal Portfolio',
                    textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    style: headingTextStyle.copyWith(
                      fontSize: isMobile ? screenWidth * 0.06 : screenWidth * 0.04,
                      color: Color(0xFF102027), // Dark Navy
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Subtitle (Flutter Developer)
          AnimationConfiguration.staggeredList(
            position: 1,
            duration: const Duration(milliseconds: 700),
            child: SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                child: Container(
                  constraints: BoxConstraints(maxWidth: maxTextWidth),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Flutter ',
                          style: headingTextStyle.copyWith(
                            color: Color(0xFF37474F), // Charcoal gray
                            fontWeight: FontWeight.w600,
                            fontSize: isMobile ? screenWidth * 0.04 : screenWidth * 0.025,
                          ),
                        ),
                        TextSpan(
                          text: 'Developer',
                          style: headingTextStyle.copyWith(
                            color: Color(0xFF263238), // Blue-Gray or Amber `0xFFFF8F00`
                            fontWeight: FontWeight.w600,
                            fontSize: isMobile ? screenWidth * 0.04 : screenWidth * 0.025,
                          ),
                        ),
                      ],
                    ),
                    textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Description
          AnimationConfiguration.staggeredList(
            position: 2,
            duration: const Duration(milliseconds: 700),
            child: SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                child: Container(
                  constraints: BoxConstraints(maxWidth: maxTextWidth),
                  child: Text(
                    "I specialize in building high-performance Flutter apps with clean architecture, smooth animations, and professional UI/UX.",
                    style: bodyTextStyle.copyWith(
                      color: Color(0xFF455A64), // Cool Gray
                      fontSize: isMobile ? screenWidth * 0.035 : screenWidth * 0.02,
                      fontWeight: FontWeight.w400,
                      height: 1.6,
                    ),
                    textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    maxLines: isMobile ? 6 : 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),

          // CTA Button
          AnimationConfiguration.staggeredList(
            position: 3,
            duration: const Duration(milliseconds: 700),
            child: SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                child: Align(
                  alignment: isMobile ? Alignment.center : Alignment.centerLeft,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: maxButtonWidth),
                    child: SizedBox(
                      width: isMobile ? double.infinity : null,
                      child: DownloadButton(), // Button should contrast well (dark border or white)
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



