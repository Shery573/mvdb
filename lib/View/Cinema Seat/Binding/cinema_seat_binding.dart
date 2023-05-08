import 'package:get/get.dart';
import '../Controller/cinema_seat_controller.dart';


class CinemaSeatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CinemaSeatController());
  }
}
