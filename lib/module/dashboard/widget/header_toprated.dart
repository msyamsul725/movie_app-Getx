import 'package:flutter/material.dart';

class HeaderTopRated extends StatefulWidget {
  const HeaderTopRated({
    Key? key,
  }) : super(key: key);

  @override
  State<HeaderTopRated> createState() => _HeaderTopRatedState();
}

class _HeaderTopRatedState extends State<HeaderTopRated> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      width: MediaQuery.of(context).size.width,
      child: const Text(
        "Top Rated",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
