import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize:
                          isMobile ? screenWidth * 0.06 : screenWidth * 0.04,
                      height: 1.1,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
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
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isMobile
                                ? screenWidth * 0.04
                                : screenWidth * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'Developer',
                          style: TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: isMobile
                                ? screenWidth * 0.04
                                : screenWidth * 0.025,
                            fontWeight: FontWeight.bold,
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
          SizedBox(height: 16),
          AnimationConfiguration.staggeredList(
            position: 2,
            duration: const Duration(milliseconds: 700),
            child: SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                child: Container(
                  constraints: BoxConstraints(maxWidth: maxTextWidth),
                  child: Text(
                    "I'm capable of creating excellent mobile apps, handling every step from concept to deployment.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize:
                          isMobile ? screenWidth * 0.035 : screenWidth * 0.02,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                    textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    maxLines: isMobile ? 6 : 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
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
                      child: DownloadButton(),
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
