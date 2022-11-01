import 'dart:convert';

import 'package:fhe_template/model/video.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../common/contant.dart';

class VideoServices {
  final httpClient = http.Client();
  final apiUrl = '$baseUrl/3/movie/${Get.arguments}/videos?api_key=$apiKey';

  Future<Video> fetchVideo(int id) async {
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      debugPrint(data.toString());
      return Video.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
