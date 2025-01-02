import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _seconds = 0;

  void _startTimer() {
    setState(() {
      _seconds = 60;
    });

    Future.delayed(Duration(seconds: _seconds), () {
      setState(() {
        // Notify user when timer finishes
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timer")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$_seconds seconds"),
            ElevatedButton(
              onPressed: _startTimer,
              child: Text("Start Timer"),
            ),
          ],
        ),
      ),
    );
  }
}
