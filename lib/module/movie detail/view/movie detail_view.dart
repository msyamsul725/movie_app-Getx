import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:fhe_template/common/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../service/cast_services.dart';
import '../../../service/details_movie_services.dart';
import '../../../service/video.services.dart';
import '../../../utils/url_launcher.dart';
import '../controller/movie detail_controller.dart';

import 'package:get/get.dart';

// ignore: must_be_immutable
class MovieDetailView extends StatelessWidget {
  MovieDetailView({Key? key}) : super(key: key);
  final id = Get.arguments;

  List<Widget> genres = [];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieDetailController>(
        init: MovieDetailController(),
        builder: (controller) {
          controller.view = this;

          return Scaffold(
            bottomNavigationBar: SizedBox(
              height: 50.0,
              width: 280.0,
              child: ElevatedButton.icon(
                  icon: const Icon(Icons.movie),
                  label: const Text("Add to List"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.withOpacity(0.8),
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () => controller.addToList()),
            ),
            body: FutureBuilder(
              future: MovieDetailsService().fetchMovieDetails(id),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(0),
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(100),
                                  topRight: Radius.circular(100),
                                ),
                                color: Colors.white),
                            padding: const EdgeInsets.only(bottom: 10, top: 5),
                            width: double.maxFinite,
                          ),
                        ),
                        expandedHeight: 300,
                        pinned: true,
                        flexibleSpace: FlexibleSpaceBar(
                          background: FancyShimmerImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500/${snapshot.data.backdropPath}',
                            height: 200,
                            width: double.maxFinite,
                            boxFit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  snapshot.data.title,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: ratingBintang,
                                      size: 24,
                                    ),
                                    const SizedBox(
                                      width: 4.0,
                                    ),
                                    Text(
                                      '${snapshot.data.voteAverage.toStringAsFixed(1)} / 10 IMDb',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),

                            const SizedBox(
                              height: 16.0,
                            ),
                            // make chips from list of genres

                            const SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Length'),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        controller.convertMinutesToHours(
                                            snapshot.data.runtime),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Language'),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        '${snapshot.data.spokenLanguages[0].name}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Status'),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        '${snapshot.data.status}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Description',
                                    style: GoogleFonts.merriweather(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                              ),
                              child: Text(
                                '${snapshot.data.overview}',
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                    height: 1.5),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                              ),
                              child: Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                // children: snapshot.data.genres
                                //     .map(
                                //       (genre) => Chip(
                                //         label: Text(genre.name),
                                //         backgroundColor: Colors.grey[200],
                                //       ),
                                //     )
                                //     .toList() as List<Widget>,
                                children: [
                                  for (var genre in snapshot.data.genres)
                                    Chip(
                                      label: Text(
                                        '${genre.name}'.toUpperCase(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      backgroundColor: Colors.orange,
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cast',
                                    style: GoogleFonts.merriweather(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),

                            FutureBuilder(
                              future: CastService().fetchCast(id),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return Flexible(
                                    fit: FlexFit.loose,
                                    child: Container(
                                      height: 160,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 50,
                                      ),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapshot.data.cast.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {},
                                                      child: CircleAvatar(
                                                        radius: 28.0,
                                                        backgroundImage:
                                                            NetworkImage(
                                                          "https://image.tmdb.org/t/p/w500/${snapshot.data.cast[index].profilePath}",
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                SizedBox(
                                                  width: 150,
                                                  child: Text(
                                                    '${snapshot.data.cast[index].name}',
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: blueBanget,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5.0,
                                                ),
                                                SizedBox(
                                                  width: 130,
                                                  child: Text(
                                                    'as ${snapshot.data.cast[index].character}',
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Videos',
                                    style: GoogleFonts.merriweather(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            FutureBuilder(
                              future: VideoServices().fetchVideo(id),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 50,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 500,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount:
                                                snapshot.data.results.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 10,
                                                ),
                                                child: Column(
                                                  children: [
                                                    // Make video thumbnail
                                                    GestureDetector(
                                                      onTap: () => Utils.launchURL(
                                                          'https://www.youtube.com/watch?v=${snapshot.data.results[index].key}'),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Column(
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                FancyShimmerImage(
                                                                  imageUrl:
                                                                      'https://img.youtube.com/vi/${snapshot.data.results[index].key}/0.jpg',
                                                                  width: 500,
                                                                  height: 200,
                                                                  boxFit: BoxFit
                                                                      .cover,
                                                                  errorWidget:
                                                                      FancyShimmerImage(
                                                                    imageUrl:
                                                                        'https://i.pinimg.com/474x/56/51/92/565192fc7848fbb8abd85136497a095b.jpg',
                                                                    width: 150,
                                                                    height: 150,
                                                                    boxFit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                // Make play button
                                                                Positioned(
                                                                  top: 75,
                                                                  right: 175,
                                                                  child:
                                                                      Container(
                                                                    width: 50,
                                                                    height: 50,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              500),
                                                                    ),
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .play_arrow,
                                                                      color: Colors
                                                                          .red,
                                                                      size: 30,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              '${snapshot.data.results[index].name}',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          );
        });
  }
}
