import 'package:blocs/logic/cubit/counter_cubit.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedCircles extends StatelessWidget {
  const AnimatedCircles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit,CounterState>(
      builder: (context,state){
        final counter =  context.select((CounterCubit counterCubit) => counterCubit.state.currentState);
        return SizedBox(
            width: counter >= 10 ? 380: 300,
            height: counter >= 10 ? 380: 300,
            child: FlareActor(
              'assets/flare/circle.flr',
              animation: 'Alarm',
              color: Theme.of(context).colorScheme.secondary,
            )
        );
      }

    );
  }
}
