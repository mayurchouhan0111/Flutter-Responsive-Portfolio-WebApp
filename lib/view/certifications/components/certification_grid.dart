import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../model/certificate_model.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/certification_controller.dart';
import 'certificates_details.dart';

class CertificateGrid extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;
  CertificateGrid({super.key, this.crossAxisCount = 3, this.ratio = 1.3});
  final controller = Get.put(CertificationController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: AnimationLimiter(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: certificateList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: ratio,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding,
            ),
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 500),
                columnCount: crossAxisCount,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: Obx(
                      () => AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(
                          vertical: defaultPadding / 2,
                          horizontal: defaultPadding / 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [
                              Colors.pinkAccent,
                              Colors.blue,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.pink,
                              offset: const Offset(-2, 0),
                              blurRadius: controller.hovers[index] ? 20 : 10,
                            ),
                            BoxShadow(
                              color: Colors.blue,
                              offset: const Offset(2, 0),
                              blurRadius: controller.hovers[index] ? 20 : 10,
                            ),
                          ],
                        ),
                        child: CertificateStack(index: index),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
