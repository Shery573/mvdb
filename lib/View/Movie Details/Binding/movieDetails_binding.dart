
import 'package:get/get.dart';


import '../Controller/movieDetails_controller.dart';

class MovieDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieDetailsController());
  }
}
