import 'package:meta/meta.dart';

class AppState {
  final int counter;

  AppState({@required this.counter});

  factory AppState.initialState() {
    return AppState(counter: 0);
  }

  AppState copy({int counter}) {
    return AppState(counter: counter ?? this.counter);
  }
}
