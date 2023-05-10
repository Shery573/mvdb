import 'dart:convert';

import 'package:dartz/dartz_unsafe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mvdb/Models/Movies.dart';

class HomeController extends GetxController {
  final _movies = <Movies>[].obs;
  var _page = 1;
  var _isLoading = false;

  List<Movies> get movies => _movies.toList();

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    if (_isLoading) return;
    _isLoading = true;
    final newMovies = await _fetchMoviesFromApi(_page);
    _movies.addAll(newMovies);
    _page++;
    _isLoading = false;
  }

  Future<List<Movies>> _fetchMoviesFromApi(int page) async {
    var uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=05dee23f86abf205d7c36db7af088b8e&page=$page');

    var response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    var result = jsonDecode(response.body);
    print(result);
    List<Movies> movies = [];
    for (var item in result['results']) {
      movies.add(Movies(
          name: item['original_title'],
          id: item['id'].toString(),
          backDrop: 'https://image.tmdb.org/t/p/w500${item['backdrop_path']}',
          poster: "https://image.tmdb.org/t/p/w500${item['poster_path']}",
          overView: item['overview'],
          releaseDate: item['release_date']));
    }
    return movies;
  }
}
