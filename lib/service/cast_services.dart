import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../common/contant.dart';
import '../model/cast.dart';

class CastService {
  final httpClient = http.Client();
  final apiUrl = '$baseUrl/3/movie/${Get.arguments}/credits?api_key=$apiKey';

  Future<Cast> fetchCast(int movieId) async {
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      debugPrint(data.toString());
      return Cast.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
