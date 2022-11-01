import 'package:flutter/material.dart';

class HeaderUpComing extends StatefulWidget {
  const HeaderUpComing({
    Key? key,
  }) : super(key: key);

  @override
  State<HeaderUpComing> createState() => _HeaderUpComingState();
}

class _HeaderUpComingState extends State<HeaderUpComing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      width: MediaQuery.of(context).size.width,
      child: const Text(
        "Up Coming",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
