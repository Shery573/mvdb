
import 'package:get/get.dart';

import '../Controller/navPage_controller.dart';




class NavPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavPageController());
  }
}
