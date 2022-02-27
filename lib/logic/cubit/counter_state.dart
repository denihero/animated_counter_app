part of 'counter_cubit.dart';

class CounterState{
  final int currentState;

  CounterState({required this.currentState});

  Map<String, dynamic> toMap() {
    return {
      'currentState': currentState,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      currentState: map['currentState'] as int,
    );
  }
}
