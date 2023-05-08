import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvdb/View/Player/Controller/player_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class Player extends StatelessWidget {
 Player({Key? key}) : super(key: key);
var controller = Get.find<PlayerController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayer(
        controller: controller.video_controller,
        onEnded: (_) {
          Navigator.pop(context);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.video_controller.pause();
          Navigator.pop(context);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
