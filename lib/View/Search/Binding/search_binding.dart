import 'package:get/get.dart';
import '../Controller/search_controller.dart';
class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}
