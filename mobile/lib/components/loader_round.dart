import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';

class LoaderRound extends StatelessWidget {
  const LoaderRound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: const Center(
        child: CircularProgressIndicator(
          color: PRIMARY_COLOR,
          strokeWidth: 5,
        ),
      ),
    );
  }
}
