import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view%20model/getx_controllers/projects_controller.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'package:flutter_portfolio/view/projects/components/title_text.dart';
import 'package:get/get.dart';
import '../intro/components/partical.dart';
import 'ProjectsController.dart';
import 'components/projects_grid.dart';



class ProjectView extends StatefulWidget {
  const ProjectView({super.key});

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  final ProjectsController controller = Get.put(ProjectsController());

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        // Bubble particle background
        const ParticleBackground(numberOfParticles: 150, color: Color(0xCCFFFFFF)),

        // Foreground content with some padding for visibility
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context)
                  ? defaultPadding / 2
                  : defaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (Responsive.isLargeMobile(context))
                  const SizedBox(height: defaultPadding),
                const TitleText(prefix: 'Latest', title: 'Projects'),
                const SizedBox(height: defaultPadding),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (controller.projects.isEmpty) {
                    return const Center(child: Text("No projects found."));
                  }
                  return Responsive(
                    desktop: ProjectGrid(
                      projects: controller.projects,
                      crossAxisCount: 3,
                      maxDescriptionLines: 3, // Pass max line info
                    ),
                    extraLargeScreen: ProjectGrid(
                      projects: controller.projects,
                      crossAxisCount: 4,
                      maxDescriptionLines: 3,
                    ),
                    tablet: ProjectGrid(
                      projects: controller.projects,
                      crossAxisCount: 2,
                      ratio: 1.4,
                      maxDescriptionLines: 3,
                    ),
                    largeMobile: ProjectGrid(
                      projects: controller.projects,
                      crossAxisCount: 1,
                      ratio: 2.0,
                      maxDescriptionLines: 3,
                    ),
                    mobile: ProjectGrid(
                      projects: controller.projects,
                      crossAxisCount: 1,
                      ratio: 2.2,
                      maxDescriptionLines: 3,
                    ),
                  );
                }),
                const SizedBox(height: defaultPadding),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
