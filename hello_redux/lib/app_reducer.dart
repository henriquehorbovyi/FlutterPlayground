import 'package:hello_redux/app_state.dart';
import 'package:redux/redux.dart';

class IncrementCounter {}

class DecrementCounter {}

Store<AppState> appStore =
    Store(appReducer, initialState: AppState.initialState());

AppState appReducer(AppState state, dynamic action) {
  if (action is IncrementCounter) {
    return state.copy(counter: state.counter + 1);
  }
  return state;
}
