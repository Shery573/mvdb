import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class AppIcon extends StatelessWidget {
  AppIcon(this.icon, {Key? key, this.size = 22, this.color}) : super(key: key);
  final AppIcons icon;
  final double size;
  final Color? color;
  final Color offWhite = Color(0xFFF8ECE5);
  @override
  Widget build(BuildContext context) {
    String i = describeEnum(icon).toLowerCase().replaceAll('_', '-');
    String path = 'assets/images/_common/icons/icon-$i.png';
    //print(path);
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: Image.asset(path,
            width: size, height: size, color: color ?? offWhite, filterQuality: FilterQuality.high),
      ),
    );
  }
}

enum AppIcons {
  close,
  close_large,
  collection,
  download,
  expand,
  fullscreen,
  fullscreen_exit,
  info,
  menu,
  next_large,
  north,
  prev,
  reset_location,
  search,
  share_android,
  share_ios,
  timeline,
  wallpaper,
  zoom_in,
  zoom_out
}