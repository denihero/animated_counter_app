import 'package:blocs/presentation/screen/counter_screen/widget/animated_widget.dart';
import 'package:blocs/presentation/screen/counter_screen/widget/counter_slider.dart';
import 'package:blocs/presentation/screen/counter_screen/widget/counter_value.dart';
import 'package:blocs/presentation/screen/counter_screen/widget/home_background.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';


class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children:  [
          const HomeBackground(),
          const Positioned(
            bottom: 40,
            child: CounterSlider(),
          ),
          Positioned(
            top: 48,
            child: Stack(
              alignment: Alignment.center,
                children:const [
                  AnimatedCircles(),
                  CounterValue(),
                ]
            )
          )
        ],
      ),
    );
  }
}