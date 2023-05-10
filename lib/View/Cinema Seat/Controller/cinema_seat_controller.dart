import 'dart:convert';

import 'package:dartz/dartz_unsafe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mvdb/Models/CinemaHall.dart';
import 'package:mvdb/Models/Movies.dart';

import '../../../Models/Seat.dart';

class CinemaSeatController extends GetxController {
  var selectedRow = -1.obs;
  var selectedCol = -1.obs;
  var rows = 24.obs;
  var columns = 10.obs;
  var selectedSeat = ''.obs;
  int regularSeatPrice = 50;
  int premiumSeatPrice = 150;
  RxList<List<int>> seatTypes =
      List.generate(24, (index) => List.filled(10, 0)).obs;
  RxList<Seat> seats = <Seat>[].obs;
  late var cinemaHall;
  var title = ''.obs;
  var cinemaDate = ''.obs;
  var cinemaTime = ''.obs;
  var totalCost = 0.obs;
  @override
  void onInit() {
    getCinemaHall();
    cinemaHall = CinemaHall(seats: seats.value);
    var args = Get.arguments as Map<String, dynamic>;
    title.value = args["title"];
    cinemaDate.value = args["cinemaDate"];
    cinemaTime.value = args["cinemaTime"];
    super.onInit();
  }

  void getCinemaHall() {
    int id = 0;
    for (int i = 0; i < rows.value; i++) {
      for (int j = 0; j < columns.value; j++) {
        Seat temp = Seat(id: id, row: i, column: j);
        seats.add(temp);
        id++;
      }
    }
  }
}
