import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import '../../../res/Text_style.dart';
import '../../../view model/responsive.dart';


class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.prefix, required this.title});

  final String prefix;
  final String title;

  @override
  Widget build(BuildContext context) {
    final double fontSize = !Responsive.isDesktop(context)
        ? (Responsive.isLargeMobile(context) ? 20 : 30)
        : 50;

    final TextStyle textStyle = headingTextStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      color: Colors.white,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$prefix ',
          style: textStyle,
        ),
        if (kIsWeb && Responsive.isDesktop(context))
          ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.pink, Colors.cyanAccent],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcIn,
            child: Text(
              title,
              style: textStyle,
            ),
          )
        else
          Text(
            title,
            style: textStyle,
          ),
      ],
    );
  }
}
