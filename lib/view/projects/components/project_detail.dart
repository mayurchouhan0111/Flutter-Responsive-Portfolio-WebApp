import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/projects/components/project_link.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/project_model.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';

class ProjectDetail extends StatelessWidget {
  final int index;
  const ProjectDetail({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width <= 500;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          projectList[index].name,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? 15.sp : 20.sp,
              ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: isMobile ? 6.h : defaultPadding),
        Text(
          projectList[index].description,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.grey,
                height: 1.4,
                fontSize: isMobile ? 10.sp : 14.sp,
              ),
          maxLines: isMobile ? 2 : 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: isMobile ? 6.h : 16),
        ProjectLinks(index: index),
        const SizedBox(height: defaultPadding / 2),
      ],
    );
  }
}
