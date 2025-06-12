import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/getx_controllers/certification_controller.dart';
import 'package:flutter_portfolio/view/projects/components/title_text.dart';
import 'package:get/get.dart';
import '../../res/constants.dart';
import '../../view model/responsive.dart';
import '../intro/components/partical.dart';
import 'components/certification_grid.dart';



class Certifications extends StatelessWidget {
  final controller = Get.put(CertificationController());
  Certifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Bubble particle background
        const ParticleBackground(
          numberOfParticles: 150,
          color: Color(0xCCFFFFFF),
        ),

        // Foreground scrollable content
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (Responsive.isLargeMobile(context))
                  const SizedBox(height: defaultPadding),
                const TitleText(prefix: 'Certifications & ', title: 'License'),
                const SizedBox(height: defaultPadding),
                Responsive(
                  desktop: CertificateGrid(crossAxisCount: 3, ratio: 1.5),
                  extraLargeScreen: CertificateGrid(crossAxisCount: 4, ratio: 1.6),
                  largeMobile: CertificateGrid(crossAxisCount: 1, ratio: 1.8),
                  mobile: CertificateGrid(crossAxisCount: 1, ratio: 1.4),
                  tablet: CertificateGrid(crossAxisCount: 2, ratio: 1.7),
                ),
                const SizedBox(height: defaultPadding),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
