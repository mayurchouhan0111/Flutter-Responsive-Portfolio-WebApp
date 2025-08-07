import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/intro/components/social_icon.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../res/constants.dart';

class SocialMediaIconColumn extends StatelessWidget {
  const SocialMediaIconColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0.1),
            Colors.white.withOpacity(0.05),
          ],
        ),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSocialIcon(
            'assets/icons/linkedin.svg',
                () => launchUrl(Uri.parse('https://www.linkedin.com/in/mayur-chouhan-2005m17/')),
            Colors.blue,
          ),
          SizedBox(height: 16.h),
          _buildSocialIcon(
            'assets/icons/github.svg',
                () => launchUrl(Uri.parse('https://github.com/mayurchouhan0111')),
            Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(String icon, VoidCallback onTap, Color accentColor) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 300),
      tween: Tween(begin: 1.0, end: 1.0),
      builder: (context, scale, child) {
        return MouseRegion(
          onEnter: (_) {},
          child: GestureDetector(
            onTapDown: (_) {},
            onTapUp: (_) => onTap(),
            child: AnimatedScale(
              scale: scale,
              duration: const Duration(milliseconds: 150),
              child: Container(
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: accentColor.withOpacity(0.3),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: accentColor.withOpacity(0.2),
                      blurRadius: 15.r,
                      offset: Offset(0, 4.h),
                    ),
                  ],
                ),
                child: SocialMediaIcon(icon: icon, onTap: onTap),
              ),
            ),
          ),
        );
      },
    );
  }
}
