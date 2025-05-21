import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../res/constants.dart';

class ConnectButton extends StatelessWidget {
  const ConnectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(vertical: defaultPadding),
      child: InkWell(
        onTap: () {
          launchUrl(Uri.parse('https://wa.me/+916263850508'));
        },
        borderRadius: BorderRadius.circular(defaultPadding +10),
        child: Container(
          // Responsive height and width
          height: MediaQuery.sizeOf(context).width < 500 ? 44 : MediaQuery.sizeOf(context).width < 800 ? 52 : 60,
          width: MediaQuery.sizeOf(context).width < 500 ? 110 : MediaQuery.sizeOf(context).width < 800 ? 130 : 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width < 500 ? defaultPadding/1.5 : defaultPadding),
              gradient: LinearGradient(colors: [
                Colors.pink,
                Colors.blue.shade900,
              ]),
            boxShadow:const [
              BoxShadow(color: Colors.blue,offset: Offset(0, -1),blurRadius: defaultPadding/4),
              BoxShadow(color: Colors.red,offset: Offset(0, 1),blurRadius: defaultPadding/4),
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.whatsapp,
                color: Colors.greenAccent,
                size: MediaQuery.sizeOf(context).width < 500 ? 13 : MediaQuery.sizeOf(context).width < 800 ? 14 : 15,
              ),
              SizedBox(width : MediaQuery.sizeOf(context).width < 500 ? defaultPadding/6 : defaultPadding/4),
              Text(
                'Whatsapp',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Colors.white,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.sizeOf(context).width < 500 ? 12 : MediaQuery.sizeOf(context).width < 800 ? 13 : 14,
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
