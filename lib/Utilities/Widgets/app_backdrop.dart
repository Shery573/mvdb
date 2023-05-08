import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


class AppBackdrop extends StatelessWidget {
  const AppBackdrop({
    Key? key,
    this.strength = 1,
    this.child,
    required this.isOpened,
  }) : super(key: key);
  final Color black = const Color(0xFF1E1B18);
  final double strength;
  final Widget? child;
final bool isOpened;
  @override
  Widget build(BuildContext context) {
    final double normalStrength = clampDouble(strength, 0, 1);
    if (isOpened) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: normalStrength * 15, sigmaY: normalStrength * 15),
        child: child ?? SizedBox.expand(),
      );
    }
    final fill = Container(color: black.withOpacity(.8 * strength));
    return child == null
        ? fill
        : Stack(
      children: [
        child!,
        Positioned.fill(child: fill),
      ],
    );
  }
}