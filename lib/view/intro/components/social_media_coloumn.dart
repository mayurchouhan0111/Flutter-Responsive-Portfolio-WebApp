import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/intro/components/social_icon.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../res/constants.dart';

class SocialMediaIconColumn extends StatelessWidget {
  const SocialMediaIconColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialMediaIcon(
          icon: 'assets/icons/linkedin.svg',
          onTap: () => launchUrl(
              Uri.parse('https://www.linkedin.com/in/mayur-chouhan-2005m17/')),
        ),
        const SizedBox(height: defaultPadding * 0.25),
        SocialMediaIcon(
          icon: 'assets/icons/github.svg',
          onTap: () =>
              launchUrl(Uri.parse('https://github.com/mayurchouhan0111')),
        ),
      ],
    );
  }
}
