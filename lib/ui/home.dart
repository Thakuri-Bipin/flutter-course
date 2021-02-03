// import 'dart:ui';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
         FlatButton(onPressed: _homePressed, child: Icon(Icons.menu)),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Text("hello world"),
      ),
    );
  }

  _homePressed() {
    debugPrint('i am home');
  }
}
