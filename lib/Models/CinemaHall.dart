import '../View/Cinema Seat/Controller/cinema_seat_controller.dart';

class CinemaHall {

  final int rows;
  final int columns;
  final List<Seat> seats;

  CinemaHall({  this.rows=10, this.columns=24, seats}):seats=(seats ?? <Seat>[]);
}
