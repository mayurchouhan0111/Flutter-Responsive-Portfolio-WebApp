import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../res/constants.dart';

class DownloadButton extends StatefulWidget {
  const DownloadButton({super.key});

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _glowController;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _glowController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedBuilder(
        animation: _glowAnimation,
        builder: (context, child) {
          return GestureDetector(
            onTap: () => launchUrl(Uri.parse(
                'https://drive.google.com/drive/folders/1Qxji8W1gD_FBsgJfMR12UeuKxaVFi9dQ')),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutCubic,
              padding: EdgeInsets.symmetric(
                vertical: _isHovered ? 16.h : 14.h,
                horizontal: _isHovered ? 32.w : 28.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: _isHovered
                      ? [
                    const Color(0xFF00BCD4).withOpacity(0.8),
                    const Color(0xFF64FFDA).withOpacity(0.6),
                    const Color(0xFF40E0D0).withOpacity(0.4),
                  ]
                      : [
                    const Color(0xFF37474F).withOpacity(0.6),
                    const Color(0xFF455A64).withOpacity(0.4),
                    const Color(0xFF263238).withOpacity(0.2),
                  ],
                ),
                border: Border.all(
                  color: _isHovered
                      ? const Color(0xFF00BCD4).withOpacity(0.6)
                      : Colors.white.withOpacity(0.2),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: _isHovered
                        ? const Color(0xFF00BCD4).withOpacity(0.4 * _glowAnimation.value)
                        : Colors.black.withOpacity(0.1),
                    blurRadius: _isHovered ? 25.r : 15.r,
                    offset: Offset(0, _isHovered ? 10.h : 6.h),
                    spreadRadius: _isHovered ? 2.r : 0,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: _isHovered
                          ? [Colors.white, const Color(0xFFE3F2FD)]
                          : [Colors.white70, Colors.white54],
                    ).createShader(bounds),
                    child: Icon(
                      FontAwesomeIcons.download,
                      color: Colors.white,
                      size: 18.sp,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    'Download Resume',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      shadows: _isHovered
                          ? [
                        Shadow(
                          color: const Color(0xFF00BCD4).withOpacity(0.5),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
