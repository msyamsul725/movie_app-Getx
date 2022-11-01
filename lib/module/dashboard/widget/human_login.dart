import 'package:flutter/material.dart';

class LoginHuman extends StatefulWidget {
  const LoginHuman({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginHuman> createState() => _LoginHumanState();
}

class _LoginHumanState extends State<LoginHuman> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 176.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://i.ibb.co/PGv8ZzG/me.jpg",
                  ),
                ),
                Column(
                  children: const [
                    Text(
                      "Syamsul Ma'arif",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      "msyamsul725@gmail.com",
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const CircleAvatar(
            backgroundColor: Colors.blueGrey,
            radius: 18.0,
            child: Icon(
              Icons.notifications_active,
              size: 18.0,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
