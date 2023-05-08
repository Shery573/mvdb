import 'package:get/get.dart';
import '../Controller/ticket_booking_controller.dart';
class TicketBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TicketBookingController());
  }
}
