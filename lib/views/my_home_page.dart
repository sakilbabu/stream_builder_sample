import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  Stream<int> getStream() async* {
    int i = 0;
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield i++;
      if (i == 100) {
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("STREAM BUILDER"),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: getStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.toString());
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
