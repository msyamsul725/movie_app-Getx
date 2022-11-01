import 'package:fhe_template/module/movie%20detail/bindings/detail_movie_binding.dart';
import 'package:get/get.dart';

import '../module/movie detail/view/movie detail_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.DETAIL_MOVIE,
      page: () => MovieDetailView(),
      binding: DetailMovieBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
