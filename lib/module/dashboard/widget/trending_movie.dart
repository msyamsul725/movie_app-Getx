import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:fhe_template/model/trending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../service/trending_services.dart';

class TrendingMovieA extends StatefulWidget {
  const TrendingMovieA({
    Key? key,
  }) : super(key: key);

  @override
  State<TrendingMovieA> createState() => _TrendingMovieState();
}

class _TrendingMovieState extends State<TrendingMovieA> {
  List trendingMoviews = <Results>[].obs;
  final isTrendingLoading = false.obs;

  @override
  void initState() {
    fetchTrending();
    super.initState();
  }

  void fetchTrending() async {
    isTrendingLoading.value = true;

    final api = await TrendingServices().fetchTrending();

    final listResult = api.results;

    trendingMoviews = listResult!;

    isTrendingLoading.value = false;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      width: MediaQuery.of(context).size.width,
      height: 328.0,
      child: ListView.builder(
        itemCount: trendingMoviews.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var item = trendingMoviews[index];
          return Card(
            child: InkWell(
              onTap: () {
                Get.toNamed(
                  Routes.DETAIL_MOVIE,
                  arguments: item.id,
                );
              },
              child: Container(
                margin: const EdgeInsets.only(right: 2.0),
                width: 220.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width,
                        height: 220.0,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 20,
                              offset: Offset(0, 11),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FancyShimmerImage(
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w500/${item.posterPath}',
                              width: 200,
                              height: 300,
                              boxFit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  item.mediaType.toString(),
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  item.releaseDate.toString(),
                                  style: const TextStyle(
                                    fontSize: 10.0,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              item.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 6.0,
                            ),
                            const SizedBox(
                              height: 6.0,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 24.0,
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Expanded(
                                  child: Text(
                                    item.popularity.toString(),
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                                const Text(
                                  "Read more",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
