import 'package:flutter/material.dart';

class HeaderTrending extends StatefulWidget {
  const HeaderTrending({
    Key? key,
  }) : super(key: key);

  @override
  State<HeaderTrending> createState() => _HeaderTrendingState();
}

class _HeaderTrendingState extends State<HeaderTrending> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      width: MediaQuery.of(context).size.width,
      child: const Text(
        "Trending",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
