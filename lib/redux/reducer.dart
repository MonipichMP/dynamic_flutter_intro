import 'package:launcher/redux/app_state.dart';
import 'package:launcher/redux/fetch_time_action.dart';

AppState reducer(AppState prev, dynamic action) {
  if (action is FetchTimeAction) {
    return AppState(action.location, action.time);
  } else {
    return prev;
  }
}