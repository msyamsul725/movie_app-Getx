import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:fhe_template/core.dart';
import 'package:fhe_template/module/dashboard/widget/header_now_showing.dart';
import 'package:fhe_template/module/dashboard/widget/header_toprated.dart';
import 'package:fhe_template/module/dashboard/widget/header_trending.dart';
import 'package:fhe_template/module/dashboard/widget/header_upcoming.dart';
import 'package:fhe_template/module/dashboard/widget/human_login.dart';
import 'package:fhe_template/module/dashboard/widget/now_showing.dart';
import 'package:fhe_template/module/dashboard/widget/toprated.dart';
import 'package:fhe_template/module/dashboard/widget/upcoming.dart';
import 'package:flutter/material.dart';

import '../../../routes/app_pages.dart';
import '../widget/trending_movie.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  get ratingBintang => null;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
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
                  const LoginHuman(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6.0,
                      horizontal: 12.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey[400]!,
                      ),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => controller.search(),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.search),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            initialValue: null,
                            decoration: const InputDecoration.collapsed(
                              filled: true,
                              fillColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              hintText: "Search yuu",
                            ),
                            controller: controller.movieName,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  GetBuilder<DashboardController>(
                    init: controller,
                    builder: (_) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        child: controller.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.amber),
                              )
                            : SingleChildScrollView(
                                controller: ScrollController(),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.searchResult.length,
                                  itemBuilder: (context, index) => Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed(
                                                Routes.DETAIL_MOVIE,
                                                arguments: controller
                                                    .searchResult[index].id,
                                              );
                                            },
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              shadowColor: Colors.black,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: FancyShimmerImage(
                                                    imageUrl:
                                                        'https://image.tmdb.org/t/p/w500/${controller.searchResult[index].posterPath}',
                                                    width: 120,
                                                    height: 100,
                                                    boxFit: BoxFit.cover),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 25.0,
                                                ),
                                                Text(
                                                  controller.searchResult[index]
                                                      .title,
                                                  textAlign: TextAlign.left,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: ratingBintang,
                                                      size: 16,
                                                    ),
                                                    const SizedBox(
                                                      width: 5.0,
                                                    ),
                                                    Text(
                                                      '${controller.searchResult[index].voteAverage.toStringAsFixed(1)} / 10 IMDb',
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w200,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.calendar_month,
                                                      color: Colors.grey,
                                                      size: 16,
                                                    ),
                                                    const SizedBox(
                                                      width: 5.0,
                                                    ),
                                                    SizedBox(
                                                      width: 150,
                                                      child: Text(
                                                        DateFormat(
                                                                'dd MMMM yyyy')
                                                            .format(
                                                          DateTime.parse(
                                                              controller
                                                                  .searchResult[
                                                                      index]
                                                                  .releaseDate
                                                                  .toString()),
                                                        ),
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const HeaderTrending(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const TrendingMovieA(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const HeaderNowShowing(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const NowShowingMovieA(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const HeaderUpComing(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const UpCommingMovieA(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const HeaderTopRated(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const TopRatedMovie(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
