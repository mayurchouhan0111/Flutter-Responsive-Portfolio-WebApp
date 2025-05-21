import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../model/certificate_model.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/certification_controller.dart';

class CertificateStack extends StatelessWidget {
  final controller = Get.put(CertificationController());
  CertificateStack({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        controller.onHover(index, value);
      },
      onTap: () {
        if (certificateList[index].credential.isNotEmpty) {
          launchUrl(Uri.parse(certificateList[index].credential));
        }
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: bgColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              certificateList[index].name,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: defaultPadding / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    certificateList[index].organization,
                    style: const TextStyle(color: Colors.amber),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  certificateList[index].date,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding / 2),
            Text.rich(
              TextSpan(
                text: 'Skills: ',
                style: const TextStyle(color: Colors.white),
                children: [
                  TextSpan(
                    text: certificateList[index].skills,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            if (certificateList[index].credential.isNotEmpty)
              Container(
                height: 32,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [
                      Colors.pink,
                      Colors.blue.shade900,
                    ],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.blue,
                      offset: Offset(0, -1),
                      blurRadius: 5,
                    ),
                    BoxShadow(
                      color: Colors.red,
                      offset: Offset(0, 1),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'View Credentials',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      CupertinoIcons.arrow_turn_up_right,
                      color: Colors.white,
                      size: 12,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
