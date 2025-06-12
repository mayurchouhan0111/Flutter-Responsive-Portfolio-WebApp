
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/projects/components/project_deatail.dart';
import 'package:get/get.dart';
import '../../../model/project_model.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/projects_controller.dart';
import 'image_viewer.dart';

class ProjectStack extends StatefulWidget {
  ProjectStack({super.key, required this.index});
  final int index;

  @override
  State<ProjectStack> createState() => _ProjectStackState();
}

class _ProjectStackState extends State<ProjectStack> {
  bool isHovered = false;
  final controller = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: InkWell(
          onHover: (value) {
            controller.onHover(widget.index, value);
          },
          onTap: () {
            ImageViewer(context, projectList[widget.index].image);
          },
          borderRadius: BorderRadius.circular(30),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isHovered ? primaryColor : bgColor,
              boxShadow: [
                if (isHovered)
                  BoxShadow(
                    color: primaryColor.withOpacity(0.5),
                    offset: const Offset(0, 5),
                    blurRadius: 10,
                  ),
              ],
            ),
            child: ProjectDetail(index: widget.index),
          ),
        ),
      ),
    );
  }
}