import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/controller.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_portfolio/view/main/components/navigation_bar.dart';
import 'components/drawer/drawer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class MainView extends StatelessWidget {
  const MainView({super.key, required this.pages});
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final MainController controller = Get.put(MainController());
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: Obx(() => TopNavigationBar(
              onMenuTap: () {
                if (!scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState?.openDrawer();
                }
              },
              selectedIndex: controller.currentPageIndex.value,
              onDestinationSelected: controller.setPage,
            )),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                itemCount: pages.length,
                onPageChanged: (index) =>
                    controller.currentPageIndex.value = index,
                itemBuilder: (context, index) {
                  return AnimationLimiter(
                    child: AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 700),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: SingleChildScrollView(
                            child: Container(
                              constraints: BoxConstraints(
                                minHeight: constraints.maxHeight,
                                minWidth: constraints.maxWidth,
                              ),
                              padding: EdgeInsets.all(24.w),
                              child: pages[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
