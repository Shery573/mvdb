import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mvdb/Utilities/config.dart';


class SearchDetailsController extends GetxController {
  late Future<Map<String, dynamic>> _movieDetailsFuture;
  late Future<Map<String, dynamic>> _movieImagesFuture;
  late Future<Map<String, dynamic>> _movieVideoFuture;
  late int _movieId = 934433;
  late String _title = '';
  late String _overview = '';
  late String _releaseDate = '';
  late String? _backDrop = '';
  String picUrl = '';
  late var trailerKey = '';
  late List genresR = [];
 late final Map<String, dynamic> arguments;
@override
  void onInit(){
  arguments = Get.arguments;
  print(arguments);
  super.onInit();
}

}
