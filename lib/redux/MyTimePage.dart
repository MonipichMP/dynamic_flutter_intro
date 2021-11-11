import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:launcher/redux/app_state.dart';

import 'middleware.dart';

class MyTimePage extends StatefulWidget {
  const MyTimePage({Key? key}) : super(key: key);

  @override
  _MyTimePageState createState() => _MyTimePageState();
}

class _MyTimePageState extends State<MyTimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Redux Demo")),
      body: Center(
        child: Container(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // display time and location
              StoreConnector<AppState, AppState>(
                converter: (store) => store.state,
                builder: (context, state) {
                  return Text(
                    'The time in ${state.location} is ${state.time}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  );
                },
              ),

              // fetch time button
              StoreConnector<AppState, FetchTime>(
                converter: (store) => () => store.dispatch(fetchTime),
                builder: (_, fetchTimeCallback) {
                  return SizedBox(
                    width: 250,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.amber,
                      textColor: Colors.brown,
                      onPressed: fetchTimeCallback,
                      child: const Text(
                        "Click to fetch time",
                        style: TextStyle(color: Colors.brown, fontWeight: FontWeight.w600, fontSize: 25),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

typedef FetchTime = void Function();
