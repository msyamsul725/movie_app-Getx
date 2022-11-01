import 'package:flutter/material.dart';

class HeaderNowShowing extends StatefulWidget {
  const HeaderNowShowing({
    Key? key,
  }) : super(key: key);

  @override
  State<HeaderNowShowing> createState() => _HeaderNowShowingState();
}

class _HeaderNowShowingState extends State<HeaderNowShowing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      width: MediaQuery.of(context).size.width,
      child: const Text(
        "Now Showing",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
