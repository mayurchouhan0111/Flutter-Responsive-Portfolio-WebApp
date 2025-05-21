import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'package:flutter_portfolio/view/intro/components/intro_body.dart';
import 'package:flutter_portfolio/view/intro/components/side_menu_button.dart';
import 'package:flutter_portfolio/view/intro/components/social_media_list.dart';
import 'package:flutter_portfolio/widgets/wave_background.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          WaveBackground(
            height: 350,
            child: const SizedBox.shrink(),
          ),
          Responsive(
            desktop: Row(
              children: [
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.01),
                MenuButton(onTap: () => Scaffold.of(context).openDrawer()),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.02),
                const SocialMediaIconList(),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.07),
                const Expanded(child: IntroBody()),
              ],
            ),
            tablet: Row(
              children: [
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.01),
                MenuButton(onTap: () => Scaffold.of(context).openDrawer()),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.02),
                const SocialMediaIconList(),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.07),
                const Expanded(child: IntroBody()),
              ],
            ),
            largeMobile: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        MenuButton(
                            onTap: () => Scaffold.of(context).openDrawer()),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const SocialMediaIconList(),
                    const SizedBox(height: 24),
                    const IntroBody(),
                  ],
                ),
              ),
            ),
            mobile: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        MenuButton(
                            onTap: () => Scaffold.of(context).openDrawer()),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const SocialMediaIconList(),
                    const SizedBox(height: 16),
                    const IntroBody(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
