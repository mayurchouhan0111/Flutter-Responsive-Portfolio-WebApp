import 'package:flutter/material.dart';

class MyPortfolioText extends StatelessWidget {
  const MyPortfolioText({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fontSize = width > 900
        ? 48
        : width > 600
        ? 36
        : 28;
    return Text(
      'My Personal Portfolio',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w900,
        fontSize: fontSize,
        height: 1.1,
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double fontSize = width > 900
        ? 20
        : width > 600
        ? 16
        : 14;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width > 900 ? 32 : 16),
      child: Text(
        "I'm capable of creating excellent mobile apps, ha...",
        style: TextStyle(
          color: Colors.grey,
          fontSize: fontSize,
        ),
      ),
    );
  }
}

class OpportunityBanner extends StatefulWidget {
  const OpportunityBanner({Key? key}) : super(key: key);

  @override
  State<OpportunityBanner> createState() => _OpportunityBannerState();
}

class _OpportunityBannerState extends State<OpportunityBanner> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  final String message = "I am free for opportunities – let's connect!";

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reset();
        _animationController.forward();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF34492A),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: LayoutBuilder(
        builder: (context, constraints) {
          const textStyle = TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 0.5,
          );
          final textSpan = TextSpan(text: message, style: textStyle);
          final tp = TextPainter(
            text: textSpan,
            maxLines: 1,
            textDirection: TextDirection.ltr,
          )..layout();
          final textWidth = tp.width;
          final maxWidth = constraints.maxWidth;
          final start = -textWidth;
          final end = maxWidth;

          return ClipRect(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                final double left = start + (end - start) * _animationController.value;
                return Transform.translate(
                  offset: Offset(left, 0),
                  child: SizedBox(
                    width: textWidth,
                    child: Text(
                      message,
                      style: textStyle,
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      softWrap: false,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
