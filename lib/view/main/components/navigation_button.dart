import 'package:flutter/material.dart';

class NavigationTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isSelected;

  const NavigationTextButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.pinkAccent : Colors.white,
            ),
      ),
    );
  }
}
