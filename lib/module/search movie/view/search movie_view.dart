import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:fhe_template/common/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../controller/search movie_controller.dart';

import 'package:get/get.dart';

class SearchMovieView extends StatelessWidget {
  const SearchMovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchMovieController>(
      init: SearchMovieController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("SearchMovie"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  //body
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          icon: const Icon(Icons.search),
                          label: const Text("Search"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blueBanget,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {
                            controller.search();
                          },
                        ),
                        SizedBox(
                          width: 180.0,
                          child: TextFormField(
                            initialValue: null,
                            decoration: const InputDecoration.collapsed(
                              filled: true,
                              fillColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              hintText: "Ketik Judul ..",
                            ),
                            controller: controller.movieName,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  GetBuilder<SearchMovieController>(
                    init: controller,
                    builder: (_) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: controller.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.amber),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.searchResult.length,
                                itemBuilder: (context, index) => Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {},
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
                                                  width: 200,
                                                  height: 300,
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
                                                controller
                                                    .searchResult[index].title,
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: ratingBintang,
                                                    size: 30,
                                                  ),
                                                  const SizedBox(
                                                    width: 5.0,
                                                  ),
                                                  Text(
                                                    '${controller.searchResult[index].voteAverage.toStringAsFixed(1)} / 10 IMDb',
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w200,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  // Calendar icon
                                                  const Icon(
                                                    Icons.calendar_month,
                                                    color: Colors.grey,
                                                    size: 30,
                                                  ),
                                                  const SizedBox(
                                                    width: 5.0,
                                                  ),

                                                  SizedBox(
                                                    width: 150,
                                                    child: Text(
                                                      DateFormat('dd MMMM yyyy')
                                                          .format(
                                                        DateTime.parse(
                                                            controller
                                                                .searchResult[
                                                                    index]
                                                                .releaseDate
                                                                .toString()),
                                                      ),
                                                      style: const TextStyle(
                                                        fontSize: 20,
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
