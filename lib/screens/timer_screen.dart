import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Import thư viện audioplayers

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _hour = 0;
  int _minute = 0;
  int _second = 0;
  late int _totalSeconds;
  bool _isRunning = false;
  bool _isPaused = false;

  late String _timerText;

  late AudioPlayer _audioPlayer; // Khai báo AudioPlayer
  late AudioCache _audioCache; // Khai báo AudioCache

  @override
  void initState() {
    super.initState();
    _totalSeconds = 0;
    _timerText = "00:00:00";
    _audioPlayer = AudioPlayer(); // Khởi tạo AudioPlayer
    _audioCache = AudioCache(); // Khởi tạo AudioCache
  }

  void _updateTimer() {
    setState(() {
      _totalSeconds = (_hour * 3600) + (_minute * 60) + _second;
      _isRunning = true;
      _isPaused = false;
    });

    Future.delayed(Duration(seconds: 1), _countdown);
  }

  void _countdown() {
    if (_totalSeconds > 0 && _isRunning) {
      setState(() {
        _totalSeconds--;
        int hours = (_totalSeconds / 3600).floor();
        int minutes = ((_totalSeconds % 3600) / 60).floor();
        int seconds = _totalSeconds % 60;

        _timerText =
            "${_formatTime(hours)}:${_formatTime(minutes)}:${_formatTime(seconds)}";
      });
      Future.delayed(Duration(seconds: 1), _countdown);
    } else {
      setState(() {
        _isRunning = false;
        _timerText = "00:00:00";
      });

      // Phát âm thanh khi hết giờ
      _playSound();
    }
  }

  void _playSound() async {
    await _audioCache
        .play('hetgio_notification.mp3'); // Sử dụng AudioCache để phát âm thanh
    print("Audio played successfully");
  }

  String _formatTime(int time) {
    return time < 10 ? "0$time" : "$time";
  }

  void _pauseTimer() {
    setState(() {
      _isRunning = false;
      _isPaused = true;
    });
  }

  void _resumeTimer() {
    setState(() {
      _isRunning = true;
      _isPaused = false;
    });

    Future.delayed(Duration(seconds: 1), _countdown);
  }

  void _cancelTimer() {
    setState(() {
      _isRunning = false;
      _isPaused = false;
      _timerText = "00:00:00";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timer")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _timerText,
              style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            _buildTimeInput(
                "Hours", _hour, (value) => setState(() => _hour = value)),
            SizedBox(height: 10),
            _buildTimeInput(
                "Minutes", _minute, (value) => setState(() => _minute = value)),
            SizedBox(height: 10),
            _buildTimeInput(
                "Seconds", _second, (value) => setState(() => _second = value)),
            SizedBox(height: 40),
            if (_isRunning) ...[
              ElevatedButton(
                onPressed: _pauseTimer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // More visible color
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  textStyle: TextStyle(fontSize: 20),
                ),
                child: Text("Pause Timer"),
              ),
              SizedBox(height: 10),
            ] else if (_isPaused) ...[
              ElevatedButton(
                onPressed: _resumeTimer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  textStyle: TextStyle(fontSize: 20),
                ),
                child:
                    Text("Resume Timer", style: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: 10),
            ],
            ElevatedButton(
              onPressed: _isRunning ? null : _updateTimer,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                textStyle: TextStyle(fontSize: 20),
              ),
              child: Text(_isRunning ? "Stop Timer" : "Start Timer",
                  style: TextStyle(color: Colors.black)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _cancelTimer,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                textStyle: TextStyle(fontSize: 20),
              ),
              child: Text("Cancel Timer"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeInput(String label, int value, Function(int) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$label: ",
          style: TextStyle(fontSize: 20),
        ),
        Container(
          width: 100,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: label,
              border: OutlineInputBorder(),
            ),
            onChanged: (val) {
              int? parsedValue = int.tryParse(val);
              if (parsedValue != null) {
                onChanged(parsedValue);
              }
            },
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
