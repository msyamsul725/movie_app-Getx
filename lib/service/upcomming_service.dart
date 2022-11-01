import 'dart:convert';

import 'package:fhe_template/common/contant.dart';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/upComing_model.dart';

class UpComingServices {
  final httpClient = http.Client();
  final apiUrl = '$baseUrl/3/movie/upcoming?api_key=$apiKey';
  final paginateTrendingUrl =
      '$baseUrl/3/trending/movie/upcoming?api_key=$apiKey&page=';

  Future<UpComing> upComing() async {
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      debugPrint(data.toString());
      return UpComing.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
