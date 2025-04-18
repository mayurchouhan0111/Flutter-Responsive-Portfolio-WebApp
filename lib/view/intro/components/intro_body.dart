import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';
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
    var size = MediaQuery.sizeOf(context);
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: AnimationLimiter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              if (!Responsive.isDesktop(context))
                SizedBox(
                  height: size.height * 0.06,
                ),
              if (!Responsive.isDesktop(context))
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.23,
                    ),
                    const AnimatedImageContainer(
                      width: 150,
                      height: 200,
                    ),
                  ],
                ),
              if (!Responsive.isDesktop(context))
                SizedBox(
                  height: size.height * 0.1,
                ),
              AnimationConfiguration.staggeredList(
                position: 0,
                duration: const Duration(milliseconds: 700),
                child: SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: const Responsive(
                      desktop: MyPortfolioText(start: 40, end: 50),
                      largeMobile: MyPortfolioText(start: 40, end: 35),
                      mobile: MyPortfolioText(start: 35, end: 30),
                      tablet: MyPortfolioText(start: 50, end: 40)),
                  ),
                ),
              ),
              if (kIsWeb && Responsive.isLargeMobile(context))
                Container(
                  height: defaultPadding,
                  color: Colors.transparent,
                ),
              AnimationConfiguration.staggeredList(
                position: 1,
                duration: const Duration(milliseconds: 700),
                child: SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: const CombineSubtitleText(),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              AnimationConfiguration.staggeredList(
                position: 2,
                duration: const Duration(milliseconds: 700),
                child: SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: const Responsive(
                      desktop: AnimatedDescriptionText(start: 14, end: 15),
                      largeMobile: AnimatedDescriptionText(start: 14, end: 12),
                      mobile: AnimatedDescriptionText(start: 14, end: 12),
                      tablet: AnimatedDescriptionText(start: 17, end: 14),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: defaultPadding * 2,
              ),
              AnimationConfiguration.staggeredList(
                position: 3,
                duration: const Duration(milliseconds: 700),
                child: SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: const DownloadButton(),
                  ),
                ),
              ),
                ],
              ),
            ),
          ),
        ),
        const Spacer(),
        if (Responsive.isDesktop(context)) const AnimatedImageContainer(),
        const Spacer(),
      ],
    );
  }
}
