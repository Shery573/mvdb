import 'package:get/get.dart';
import 'package:mvdb/View/Cinema%20Seat/Screen/cinema_seat_screen.dart';
import 'package:mvdb/View/Home/Binding/home_binding.dart';
import 'package:mvdb/View/Movie%20Details/Binding/movieDetails_binding.dart';
import 'package:mvdb/View/Movie%20Details/Screen/movieDetails_screen.dart';
import 'package:mvdb/View/Navigation%20Page/Binding/navPage_binding.dart';
import 'package:mvdb/View/Navigation%20Page/Screen/navPage_screen.dart';
import 'package:mvdb/View/Search/Binding/search_binding.dart';
import 'package:mvdb/View/Ticket%20Booking/Binding/ticket_booking_binding.dart';

import '../View/Cinema Seat/Binding/cinema_seat_binding.dart';
import '../View/Player/Binding/player_binding.dart';
import '../View/Player/Screen/player_screen.dart';
import '../View/Search Details/Screen/search_details_screen.dart';
import '../View/Ticket Booking/Screen/ticket_booking_screen.dart';

class AppRoutes {
  static const String initalRoute='/';
  static const String movieDetails='/movieDetails';
  static const String player='/player';
  static const String searchDetails='/searchDetails';
  static const String ticketBooking='/ticketBooking';
  static const String cinemaSeat='/cinemaSeat';
  static List<GetPage> pages =[
    GetPage(
      name: initalRoute,
      page: () => NavPage(),
      bindings: [
        NavPageBinding(),
        HomeBinding(),
        SearchBinding(),
      ],
    ),
    GetPage(name: movieDetails,
        page: ()=>MovieDetails(),
      bindings: [
        MovieDetailsBinding()
      ],
    ),
    GetPage(
      name: player,
      page: () => Player(),
      bindings: [
        PlayerBinding(),
      ],
    ),
    GetPage(name: searchDetails,
      page: ()=>SearchDetails(),
      bindings: [
        MovieDetailsBinding()
      ],
    ),
    GetPage(name: ticketBooking,
      page: ()=>TicketBooking(),
      bindings: [
        TicketBookingBinding()
      ],
    ),
    GetPage(name: cinemaSeat,
      page: ()=>CinemaSeat(),
      bindings: [
        CinemaSeatBinding()
      ],
    )
  ];
}