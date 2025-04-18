import 'package:flutter/material.dart';

class WaveBackground extends StatelessWidget {
  final Widget child;
  final double height;
  final List<Color> gradientColors;
  const WaveBackground({
    super.key,
    required this.child,
    this.height = 300,
    this.gradientColors = const [
      Color(0xFF232526), // dark grey
      Color(0xFF414345), // slightly lighter grey
      Color(0xFF2C5364), // blue-grey
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: height,
          child: CustomPaint(
            painter: _WavePainter(gradientColors),
          ),
        ),
        Positioned.fill(child: child),
      ],
    );
  }
}

class _WavePainter extends CustomPainter {
  final List<Color> colors;
  _WavePainter(this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: colors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    final path = Path();
    path.lineTo(0, size.height * 0.8);
    path.cubicTo(
      size.width * 0.25, size.height,
      size.width * 0.75, size.height * 0.6,
      size.width, size.height * 0.8,
    );
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
