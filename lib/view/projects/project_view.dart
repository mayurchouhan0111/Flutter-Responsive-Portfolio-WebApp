import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view%20model/getx_controllers/projects_controller.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'package:flutter_portfolio/view/projects/components/title_text.dart';
import 'package:get/get.dart';
import 'components/projects_grid.dart';

class ProjectsView extends StatelessWidget {
  ProjectsView({super.key});
  final controller = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isLargeMobile(context))
              const SizedBox(height: defaultPadding),
            const TitleText(prefix: 'Latest', title: 'Projects'),
            const SizedBox(height: defaultPadding),
            Responsive(
              desktop: ProjectGrid(crossAxisCount: 3),
              extraLargeScreen: ProjectGrid(crossAxisCount: 4),
              largeMobile: ProjectGrid(crossAxisCount: 1, ratio: 2.0),
              mobile: ProjectGrid(crossAxisCount: 1, ratio: 2.2),
              tablet: ProjectGrid(crossAxisCount: 2, ratio: 1.4),
            ),
            const SizedBox(height: defaultPadding),
          ],
        ),
      ),
    );
  }
}
