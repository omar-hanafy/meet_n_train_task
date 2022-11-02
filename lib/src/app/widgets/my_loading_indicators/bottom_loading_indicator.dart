import 'package:flutter/material.dart';

class BottomLoadingIndicator extends StatelessWidget {
  const BottomLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // todo: customize your indicator
    return const Center(
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
