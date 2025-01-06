import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart'; // Thêm dòng này

class StopwatchScreen extends StatefulWidget {
  @override
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  bool _isRunning = false;
  int _elapsedTime = 0; // Elapsed time in seconds
  late Stopwatch _stopwatch;
  late Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _ticker = Ticker((elapsed) {
      if (_stopwatch.isRunning) {
        setState(() {
          _elapsedTime = _stopwatch.elapsedMilliseconds ~/ 1000;
        });
      }
    });
  }

  void _startStopwatch() {
    setState(() {
      _isRunning = true;
      _stopwatch.start();
      _ticker.start();
    });
  }

  void _stopStopwatch() {
    setState(() {
      _isRunning = false;
      _stopwatch.stop();
      _ticker.stop();
    });
  }

  void _resetStopwatch() {
    setState(() {
      _elapsedTime = 0;
      _stopwatch.reset();
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${_padZero(minutes)}:${_padZero(remainingSeconds)}';
  }

  String _padZero(int value) {
    return value.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Bấm Giờ", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blueAccent,
          automaticallyImplyLeading: false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formatTime(_elapsedTime),
              style: TextStyle(
                fontSize: 80, // Tăng kích thước hiển thị thời gian
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent, // Thêm màu cho thời gian
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isRunning ? _stopStopwatch : _startStopwatch,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.green, // Màu nền của nút "Bắt đầu/Dừng"
                    padding: EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20), // Tăng kích thước nút
                    textStyle: TextStyle(fontSize: 20), // Tăng kích thước chữ
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Bo góc
                    ),
                  ),
                  child: Text(_isRunning ? 'Dừng' : 'Bắt đầu',
                      style: TextStyle(color: Colors.white)),
                ),
                SizedBox(width: 30),
                ElevatedButton(
                  onPressed: _resetStopwatch,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Màu nền của nút "Đặt lại"
                    padding: EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20), // Tăng kích thước nút
                    textStyle: TextStyle(fontSize: 20), // Tăng kích thước chữ
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Bo góc
                    ),
                  ),
                  child: Text('Đặt lại', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
