import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launcher/intro/intro.dart';
import 'package:launcher/redux/app_state.dart';
import 'package:launcher/redux/reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final store = Store<AppState>(
    reducer,
    initialState: AppState.initialState(),
    middleware: [thunkMiddleware],
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.green,
        ),
        home: IntroPage(),
      ),
    );
  }
}
