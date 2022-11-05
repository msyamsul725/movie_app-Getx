import 'package:get/get.dart';
import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';

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
