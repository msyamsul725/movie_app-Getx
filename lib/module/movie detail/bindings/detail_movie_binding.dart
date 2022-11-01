import 'package:fhe_template/core.dart';
import 'package:get/get.dart';

class DetailMovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailController>(
      () => MovieDetailController(),
    );
  }
}
