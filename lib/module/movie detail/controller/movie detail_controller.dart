import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhe_template/core.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController {
  MovieDetailView? view;
  @override
  void onInit() {
    fetchDetails();
    super.onInit();
  }

  var details = MovieDetail();

  void fetchDetails() {
    final movieId = Get.arguments;
    final api = MovieDetailsService();
    api.fetchMovieDetails(movieId).then((value) {
      details = value;
      update();
    });
  }

  String convertMinutesToHours(int minutes) {
    final hours = (minutes / 60).floor();
    final remainingMinutes = minutes % 60;
    return '${hours}h ${remainingMinutes}min';
  }

  addToList() async {
    await FirebaseFirestore.instance.collection("movie").add({
      "movie": {
        "movie_name": details.title,
        "photo": details.posterPath,
      },
      "created_at": Timestamp.now(),
    });
    Get.offAll(const FloatMainNavigationView());
  }
}
