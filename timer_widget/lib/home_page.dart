import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //variables
  int timeLeft = 5;

  //timer method
  void _startCountDown() {
    //it happens every 1 second
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              timeLeft == 0 ? 'DONE' : timeLeft.toString(),
              style: TextStyle(
                fontSize: 70,
              ),
            ),
            MaterialButton(
              onPressed: _startCountDown,
              child: Text(
                'START',
                style: TextStyle(fontSize: 50),
              ),
              color: Colors.deepOrange,
            ),
          ],
        ),
      ),
    );
  }
}
