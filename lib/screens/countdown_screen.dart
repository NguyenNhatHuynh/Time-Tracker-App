import 'package:flutter/material.dart';

class CountdownScreen extends StatefulWidget {
  @override
  _CountdownScreenState createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  int _remainingTime = 60; // Example countdown (in seconds)
  bool _isCountingDown = false;

  void _startCountdown() {
    setState(() {
      _isCountingDown = true;
    });

    // Implement countdown logic here
    Future.delayed(Duration(seconds: _remainingTime), () {
      setState(() {
        _isCountingDown = false;
      });
    });
  }

  void _resetCountdown() {
    setState(() {
      _remainingTime = 60;
      _isCountingDown = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Countdown Timer")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Time Remaining: $_remainingTime seconds"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isCountingDown ? null : _startCountdown,
              child: Text("Start Countdown"),
            ),
            ElevatedButton(
              onPressed: _isCountingDown ? _resetCountdown : null,
              child: Text("Reset Countdown"),
            ),
          ],
        ),
      ),
    );
  }
}
