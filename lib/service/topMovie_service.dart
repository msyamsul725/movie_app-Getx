import 'dart:convert';

import 'package:fhe_template/model/top_rated.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../common/contant.dart';

class TopMovieServices {
  final httpClient = http.Client();
  final apiUrl = '$baseUrl/3/movie/top_rated?api_key=$apiKey';
  final paginateTrendingUrl =
      '$baseUrl/3/trending/movie/top_rated?api_key=$apiKey&page=';

  Future<TopRated> topRated() async {
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      debugPrint(data.toString());
      return TopRated.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
