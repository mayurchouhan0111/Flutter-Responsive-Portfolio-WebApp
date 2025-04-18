import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../res/constants.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrl(Uri.parse('https://drive.google.com/drive/folders/1Qxji8W1gD_FBsgJfMR12UeuKxaVFi9dQ'));
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.withOpacity(0.35),
                Colors.pink.withOpacity(0.35),
                Colors.white.withOpacity(0.10),
              ],
            ),
            border: Border.all(
              width: 2.5,
              color: Colors.white.withOpacity(0.4),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.1),
                blurRadius: 15,
                offset: const Offset(0, 6),
              ),
              BoxShadow(
                color: Colors.pink.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
            // Glassmorphism effect
            backgroundBlendMode: BlendMode.overlay,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [
                      Color(0xFF6DD5FA), // light blue
                      Color(0xFFF7797D), // light pink
                    ],
                  ).createShader(bounds);
                },
                child: const Icon(FontAwesomeIcons.download, color: Colors.white, size: 15),
              ),
              const SizedBox(width: 8),
              Text(
                'Download CV',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.white.withOpacity(0.95),
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  shadows: [
                    Shadow(
                      color: Colors.blue.withOpacity(0.12),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}