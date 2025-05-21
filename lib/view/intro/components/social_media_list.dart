import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/intro/components/social_media_coloumn.dart';
import 'package:flutter_portfolio/view/intro/components/social_icon.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../res/constants.dart';

class SocialMediaIconList extends StatelessWidget {
  const SocialMediaIconList({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;

    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: SizedBox(
            height: isMobile ? 60 : 145,
            width: isMobile ? screenWidth * 0.8 : 50,
            child: isMobile
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Follow Me',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const SizedBox(width: defaultPadding),
                      Container(
                        width: 50,
                        height: 2,
                        margin: const EdgeInsets.symmetric(
                            horizontal: defaultPadding * 0.5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(defaultPadding),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: defaultPadding * 0.5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SocialMediaIcon(
                              icon: 'assets/icons/linkedin.svg',
                              onTap: () => launchUrl(Uri.parse(
                                  'https://www.linkedin.com/in/mayur-chouhan-2005m17/')),
                            ),
                            const SizedBox(width: defaultPadding * 0.5),
                            SocialMediaIcon(
                              icon: 'assets/icons/github.svg',
                              onTap: () => launchUrl(Uri.parse(
                                  'https://github.com/mayurchouhan0111')),
                            ),
                            const SizedBox(width: defaultPadding * 0.5),
                            const SocialMediaIcon(
                                icon: 'assets/icons/dribble.svg'),
                            const SizedBox(width: defaultPadding * 0.5),
                            const SocialMediaIcon(
                                icon: 'assets/icons/twitter.svg'),
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: defaultPadding / 6),
                      RotatedBox(
                        quarterTurns: -3,
                        child: Text(
                          'Follow Me',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      const SizedBox(height: defaultPadding / 6),
                      Container(
                        height: 15,
                        width: 1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(defaultPadding),
                        ),
                      ),
                      const SizedBox(height: defaultPadding / 6),
                      const Expanded(child: SocialMediaIconColumn()),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
