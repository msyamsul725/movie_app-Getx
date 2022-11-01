// ignore_for_file: file_names

import 'dart:convert';

import 'package:fhe_template/common/contant.dart';
import 'package:fhe_template/model/now_playing.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NowPlayingServices {
  final httpClient = http.Client();
  final apiUrl = '$baseUrl/3/movie/now_playing?api_key=$apiKey';

  Future<NowPlaying> fetchNowPlaying() async {
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      debugPrint(data.toString());
      return NowPlaying.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
