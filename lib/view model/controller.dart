import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPageIndex = 0.obs;

  void setPage(int index) {
    if (currentPageIndex.value != index) {
      currentPageIndex.value = index;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Add listener to pageController to update currentPageIndex when page changes
    pageController.addListener(() {
      if (pageController.page != null &&
          pageController.page!.round() != currentPageIndex.value) {
        currentPageIndex.value = pageController.page!.round();
      }
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
