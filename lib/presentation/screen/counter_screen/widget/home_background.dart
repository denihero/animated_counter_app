import 'package:flutter/material.dart';

import '../../../../core/constant/string.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Center(
          child: Column(
          ),
        ),
      ),
    );
  }
}