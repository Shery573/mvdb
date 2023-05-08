import 'dart:convert';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../Models/movieDetailArguments.dart';
import '../../../Utilities/config.dart';

class MovieDetailsController extends GetxController {
  late Future<Map<String, dynamic>> _movieDetailsFuture;
  late Future<Map<String, dynamic>> _movieImagesFuture;
  late Future<Map<String, dynamic>> _movieVideoFuture;
  late String trailerKey = '';
  late MovieDetailArguments args;
  late RxList genres = [].obs;
  late Map nextArgs;

  List<Color> colors = [
    Color(0xFF15D2BC),
    Color(0xFFE26CA5),
    Color(0xFF564CA3),
    Color(0xFFCD9D0F)
  ];
  @override
  void onInit() {
    args = Get.arguments as MovieDetailArguments;
    print(args);

    print(args.title);
    print(args.overview);
    _movieDetailsFuture = _getMovieDetails();
    // _movieImagesFuture = _getMovieImages();
    _movieVideoFuture = _getMovieVideos();
    // ...
    super.onInit();
  }

  Future<Map<String, dynamic>> _getMovieDetails() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/${args.movieId}?api_key=$apiKey'));
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('get movie details');

        genres.value = result['genres'];
        print(genres.value);
        return result as Map<String, dynamic>;
      } else {
        print('exception in move details');
        return result as Map<String, dynamic>;
      }
    } catch (e) {
      // handle error
      print('Error: $e');
      return {};
    }
  }

  //
  // Future<Map<String, dynamic>> _getMovieImages() async {
  //
  //
  //   print(Uri.parse(
  //       'https://api.themoviedb.org/3/movie/${args.movieId}/images?api_key=$apiKey'));
  //   final response = await http.get(Uri.parse(
  //       'https://api.themoviedb.org/3/movie/${args.movieId}/images?api_key=$apiKey'));
  //   if (response.statusCode == 200) {
  //     print('get movie images');
  //     print(json.decode(response.body));
  //
  //     return json.decode(response.body);
  //   } else {
  //     //throw Exception('Failed to load movie images');
  //     print('exception in movie player');
  //     return json.decode(response.body);
  //   }
  // }
  Future<Map<String, dynamic>> _getMovieVideos() async {

    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/${args.movieId}/videos?api_key=$apiKey&type=Trailer'));
    if (response.statusCode == 200) {
      print('get movie videos');
      print(json.decode(response.body));
      var resp = json.decode(response.body);
      final teaser = resp['results'].firstWhere(
        (result) => result['type'] == 'Trailer',
        orElse: () => '',
      );
      print('printing teaset');

      print(teaser);
      trailerKey = teaser != '' ? teaser['key'] : teaser['key'];
      nextArgs={
        'trailerKey':trailerKey,
      };
print("Trailer Key: $trailerKey");
      return json.decode(response.body);
    } else {
      //throw Exception('Failed to load movie images');
      print('exception in movie player');
      return json.decode(response.body);
    }
  }
}
