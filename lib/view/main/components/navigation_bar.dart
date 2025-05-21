import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_portfolio/view/intro/components/side_menu_button.dart';
import 'package:flutter_portfolio/view/main/components/connect_button.dart';
import '../../../res/constants.dart';
import 'navigation_button_list.dart';

class TopNavigationBar extends StatelessWidget {
  final VoidCallback? onMenuTap;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  const TopNavigationBar(
      {super.key,
      this.onMenuTap,
      required this.selectedIndex,
      required this.onDestinationSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      height: 80.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo or menu button
          1.sw < 700.w
              ? MenuButton(onTap: onMenuTap)
              : Image.asset(
                  'assets/images/triange_icon.png',
                  height: 40.h,
                ),
          const Spacer(flex: 2),
          // Navigation buttons for larger screens
          if (1.sw >= 700.w)
            NavigationButtonList(
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
            ),
          const Spacer(flex: 2),
          // Connect button
          const ConnectButton(),
        ],
      ),
    );
  }
}
