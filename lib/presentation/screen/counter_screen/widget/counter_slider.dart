import 'dart:ffi';

import 'package:blocs/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// the concept of the widget inspired
/// from [Nikolay Kuchkarov](https://dribbble.com/shots/3368130-Stepper-Touch).
/// i extended  the functionality to be more useful in real world applications
class CounterSlider extends StatefulWidget {
  const CounterSlider({
    Key? key,

  }) : super(key: key);



  @override
  _CounterSliderState createState() => _CounterSliderState();
}

class _CounterSliderState extends State<CounterSlider>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late int _value;
  late double _startAnimationPosX;
  late double _startAnimationPosY;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, lowerBound: -0.5, upperBound: 0.5);
    _controller.value = 0.0;
    _controller.addListener(() {});

      _animation = Tween<Offset>(begin: const Offset(0.0, 0.0), end: const Offset(1.5, 0.0))
          .animate(_controller);

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
      _animation = Tween<Offset>(begin: const Offset(0.0, 0.0), end: const Offset(1.5, 0.0))
          .animate(_controller);

  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        width:280.0,
        height:120.0,
        child: Material(
          type: MaterialType.canvas,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(60.0),
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                left: 10,
                bottom: null,
                child:
                Icon(
                    Icons.remove,
                    size: 40.0,
                    color: Theme.of(context).iconTheme.color?.withOpacity(0.7)
                ),
              ),
              Positioned(
                right: 10,
                top: null,
                child: Icon(
                    Icons.add,
                    size: 40.0,
                    color: Theme.of(context).iconTheme.color?.withOpacity(0.7)
                ),
              ),
              GestureDetector(
                onHorizontalDragStart: _onPanStart,
                onHorizontalDragUpdate: _onPanUpdate,
                onHorizontalDragEnd: _onPanEnd,
                child: SlideTransition(
                  position: _animation,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      color: Theme.of(context).colorScheme.secondary,
                      shape: const CircleBorder(),
                      elevation: 5.0,
                      child: Center(
                        child: Icon(
                          Icons.trip_origin,
                          size: 40,
                            color: Theme.of(context).iconTheme.color?.withOpacity(0.6)
                        )
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double offsetFromGlobalPos(Offset globalPosition) {
    RenderBox box = context.findRenderObject() as RenderBox;
    Offset local = box.globalToLocal(globalPosition);
    _startAnimationPosX = ((local.dx * 0.75) / box.size.width) - 0.4;
    _startAnimationPosY = ((local.dy * 0.75) / box.size.height) - 0.4;
      return ((local.dx * 0.75) / box.size.width) - 0.4;
  }

  void _onPanStart(DragStartDetails details) {
    _controller.stop();
    _controller.value = offsetFromGlobalPos(details.globalPosition);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    _controller.value = offsetFromGlobalPos(details.globalPosition);
  }

  void _onPanEnd(DragEndDetails details) {
    _controller.stop();

    if (_controller.value <= -0.20) {
      context.read<CounterCubit>().decrement();
    } else if (_controller.value >= 0.20) {
      context.read<CounterCubit>().increment();
    }
      final SpringDescription _kDefaultSpring =
      SpringDescription.withDampingRatio(
        mass: 0.9,
        stiffness: 250.0,
        ratio: 0.6,
      );
        _controller.animateWith(
            SpringSimulation(_kDefaultSpring, _startAnimationPosX, 0.0, 0.0));






  }
}