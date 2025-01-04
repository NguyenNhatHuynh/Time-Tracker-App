import 'package:flutter/material.dart';
import 'dart:async';

class CurrentTimeScreen extends StatefulWidget {
  @override
  _CurrentTimeScreenState createState() => _CurrentTimeScreenState();
}

class _CurrentTimeScreenState extends State<CurrentTimeScreen> {
  late String _currentTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _currentTime = _getCurrentTime();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _currentTime = _getCurrentTime();
      });
    });
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    return "${_formatTime(now.hour)}:${_formatTime(now.minute)}:${_formatTime(now.second)}";
  }

  String _formatTime(int time) {
    return time < 10 ? "0$time" : "$time";
  }

  @override
  void dispose() {
    _timer?.cancel(); // Hủy Timer khi màn hình bị hủy
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hiển thị giờ hiện tại",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          _currentTime,
          style: TextStyle(
            fontSize: 64, // Tăng kích thước font lên 64
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
