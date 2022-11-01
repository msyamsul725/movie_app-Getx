import 'package:fhe_template/model/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../service/search_services.dart';
import '../view/search movie_view.dart';

class SearchMovieController extends GetxController {
  SearchMovieView? view;

  final searchInput = TextEditingController();

  late final movieName = TextEditingController();
  Search searchModel = Search();

  final isLoading = false.obs;

  void search() async {
    isLoading.value = true;

    final api = SearchServices();
    final listResult = await api.searchMovie(movieName.text);
    final hasil = listResult.results;

    debugPrint(hasil.toString());

    searchResult = hasil!;

    isLoading.value = false;

    update();
  }

  List searchResult = <Result>[].obs;
}
