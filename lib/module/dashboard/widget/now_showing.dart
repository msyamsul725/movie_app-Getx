import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/trending.dart';
import '../../../routes/app_pages.dart';
import '../../../service/now_playing_services,.dart';

class NowShowingMovieA extends StatefulWidget {
  const NowShowingMovieA({
    Key? key,
  }) : super(key: key);

  @override
  State<NowShowingMovieA> createState() => _NowShowingMovieAState();
}

class _NowShowingMovieAState extends State<NowShowingMovieA> {
  List nowPlayingMovies = <Results>[].obs;
  @override
  void initState() {
    fetchNowPlaying();
    super.initState();
  }

  void fetchNowPlaying() async {
    final api = await NowPlayingServices().fetchNowPlaying();
    final listResult = api.results;
    nowPlayingMovies = listResult!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 160,
      child: ListView.builder(
        itemCount: nowPlayingMovies.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var item = nowPlayingMovies[index];
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
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          12.0,
                        ),
                      ),
                    ),
                    child: const Text(
                      "Show",
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
