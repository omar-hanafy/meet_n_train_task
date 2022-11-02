import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final String title;

  const MyAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          const Text("Schedule"),
          IconButton(
            color: Colors.black,
            iconSize: 40,
            icon: const Icon(Icons.arrow_circle_left_outlined),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
