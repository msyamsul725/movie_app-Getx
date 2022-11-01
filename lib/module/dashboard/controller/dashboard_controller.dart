import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../model/search.dart';
import '../../../service/search_services.dart';
import '../view/dashboard_view.dart';

class DashboardController extends GetxController {
  DashboardView? view;

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
