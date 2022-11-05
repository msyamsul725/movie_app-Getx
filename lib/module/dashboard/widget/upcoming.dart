import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class UpCommingMovieA extends StatefulWidget {
  const UpCommingMovieA({
    Key? key,
  }) : super(key: key);

  @override
  State<UpCommingMovieA> createState() => _UpCommingMovieAState();
}

class _UpCommingMovieAState extends State<UpCommingMovieA> {
  List UpComingMovies = <Results>[].obs;

  @override
  void initState() {
    fetchUpComing();
    super.initState();
  }

  void fetchUpComing() async {
    final api = await UpComingServices().upComing();
    final listResult = api.results;
    UpComingMovies = listResult!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 160,
      child: ListView.builder(
        itemCount: UpComingMovies.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var item = UpComingMovies[index];
          return InkWell(
            onTap: () {
              Get.toNamed(
                Routes.DETAIL_MOVIE,
                arguments: item.id,
              );
            },
            child: Container(
              width: 160,
              height: 160,
              margin: const EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16.0),
                ),
                color: Colors.blue[400],
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FancyShimmerImage(
                        imageUrl:
                            'https://image.tmdb.org/t/p/w500/${item.posterPath}',
                        width: 200,
                        height: 300,
                        boxFit: BoxFit.fill),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6.0),
                    margin: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          12.0,
                        ),
                      ),
                    ),
                    child: const Text(
                      "Up Comming",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: const BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0),
                        ),
                      ),
                      child: Text(
                        item.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
