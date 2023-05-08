import 'package:get/get.dart';
import '../Controller/search_details_controller.dart';
class SearchDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchDetailsController());
  }
}
