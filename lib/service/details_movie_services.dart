import 'dart:convert';

import 'package:fhe_template/common/contant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/movie_details.dart';

class MovieDetailsService {
  final httpClient = http.Client();
  final apiUrl = '$baseUrl/3/movie/${Get.arguments}?api_key=$apiKey';

  Future<MovieDetail> fetchMovieDetails(int movieId) async {
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      debugPrint(data.toString());
      return MovieDetail.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
