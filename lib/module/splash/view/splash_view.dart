import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        controller.view = this;

        return Builder(builder: (context) {
          Future<bool> loading() async {
            await Future.delayed(const Duration(seconds: 4));

            Navigator.push(
              context,
              //TODO: set your next widget
              MaterialPageRoute(
                  builder: (context) => const FloatMainNavigationView()),
            );
            return true;
          }

          return Scaffold(
            body: Container(
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Movie App Elements',
                    style: GoogleFonts.pacifico(
                      textStyle: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  FutureBuilder(
                    future: loading(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return const CircularProgressIndicator();
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
