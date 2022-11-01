import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import '../controller/list movie_controller.dart';

import 'package:get/get.dart';

class ListMovieView extends StatelessWidget {
  const ListMovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListMovieController>(
      init: ListMovieController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "List Movie ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("movie")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) return const Text("Error");
                      if (snapshot.data == null) return Container();
                      if (snapshot.data!.docs.isEmpty) {
                        return const Text("No Data");
                      }
                      final data = snapshot.data!;
                      return SizedBox(
                        height: 380.0,
                        child: ListView.builder(
                          itemCount: data.docs.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> item = (data.docs[index].data()
                                as Map<String, dynamic>);
                            item["id"] = data.docs[index].id;
                            return Card(
                              child: ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: FancyShimmerImage(
                                      imageUrl:
                                          'https://image.tmdb.org/t/p/w500/${item['movie']['photo']}',
                                      width: 100,
                                      height: 80,
                                      boxFit: BoxFit.fill),
                                ),
                                title: Text(item['movie']['movie_name']),
                                trailing: IconButton(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection("movie")
                                        .doc(item["id"])
                                        .delete();
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  //body
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
