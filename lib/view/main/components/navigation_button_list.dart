import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/controller.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';

import 'navigation_button.dart';

class NavigationButtonList extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const NavigationButtonList({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Row(
            children: [
              NavigationTextButton(
                onTap: () => onDestinationSelected(0),
                text: 'Home',
                isSelected: selectedIndex == 0,
              ),
              NavigationTextButton(
                onTap: () => onDestinationSelected(1),
                text: 'Projects',
                isSelected: selectedIndex == 1,
              ),
              NavigationTextButton(
                onTap: () => onDestinationSelected(2),
                text: 'Certifications',
                isSelected: selectedIndex == 2,
              ),
            ],
          ),
        );
      },
    );
  }
}
