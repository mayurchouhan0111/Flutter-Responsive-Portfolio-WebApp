import 'package:flutter/material.dart';
import '../../../res/constants.dart';

class MenuButton extends StatelessWidget {
  final VoidCallback? onTap;
  const MenuButton({super.key, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 200),
        builder: (context, value, child) {
          return InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: defaultPadding * 2.0 * value,
              width: defaultPadding * 2.0 * value,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.pinkAccent.withOpacity(.5),
                        offset: const Offset(1, 1)),
                    BoxShadow(
                        color: Colors.blue.withOpacity(.5),
                        offset: const Offset(-1, -1)),
                  ]),
              child: Center(
                  child: ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                          colors: [Colors.pink, Colors.blue.shade900])
                      .createShader(bounds);
                },
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: defaultPadding * 1.2 * value,
                ),
              )),
            ),
          );
        },
      ),
    );
  }
}
