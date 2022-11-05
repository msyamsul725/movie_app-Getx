import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../view/nyoba_view.dart';

class NyobaController extends GetxController {
  NyobaView? view;
  doBuy() async {
    await FirebaseFirestore.instance.collection("movieorder").add({
      "movie": {"movie_name": view!.items.originalTitle}
    });
    Get.back();
  }
}
