import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../view model/responsive.dart';
import 'components/intro_body.dart';
import 'components/partical.dart';
import 'components/side_menu_button.dart';
import 'components/social_media_list.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: screenSize.height,
      color:  Colors.transparent, // background color
      child: Stack(
        children: [
          const ParticleBackground(numberOfParticles: 150, color:  Color(0xCCFFFFFF)),

          Responsive(
            desktop: _buildDesktopTabletLayout(context, screenSize),
            tablet: _buildDesktopTabletLayout(context, screenSize),
            largeMobile: _buildMobileLayout(context, screenSize, spacing: 24),
            mobile: _buildMobileLayout(context, screenSize, spacing: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopTabletLayout(BuildContext context, Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MenuButton(onTap: () => Scaffold.of(context).openDrawer()),
          SizedBox(width: size.width * 0.02),
          const SocialMediaIconList(),
          SizedBox(width: size.width * 0.07),
          const Expanded(child: IntroBody()),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, Size size,
      {required double spacing}) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: spacing, vertical: spacing + 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              MenuButton(onTap: () => Scaffold.of(context).openDrawer()),
              const Spacer(),
            ],
          ),
          SizedBox(height: spacing),
          const SocialMediaIconList(),
          SizedBox(height: spacing),
          const IntroBody(),
        ],
      ),
    );
  }
}
