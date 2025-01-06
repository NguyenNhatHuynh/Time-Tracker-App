import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';

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

  // late AudioPlayer _audioPlayer;
  // late AudioCache _audioCache;

  @override
  void initState() {
    super.initState();
    _totalSeconds = 0;
    _timerText = "00:00:00";
    // _audioPlayer = AudioPlayer();
    // _audioCache = AudioCache();
  }

  void _updateTimer() {
    setState(() {
      _totalSeconds = (_hour * 3600) + (_minute * 60) + _second;
      _isRunning = true;
      _isPaused = false;
    });

    _countdown();
  }

  void _countdown() {
    if (_totalSeconds > 0 && _isRunning) {
      Future.delayed(Duration(seconds: 1), () {
        if (_isRunning) {
          setState(() {
            _totalSeconds--;
            int hours = (_totalSeconds / 3600).floor();
            int minutes = ((_totalSeconds % 3600) / 60).floor();
            int seconds = _totalSeconds % 60;

            _timerText =
                "${_formatTime(hours)}:${_formatTime(minutes)}:${_formatTime(seconds)}";
          });
          _countdown();
        }
      });
    } else if (_totalSeconds == 0 && _isRunning) {
      setState(() {
        _isRunning = false;
        _timerText = "00:00:00";
      });

      // _playSound();
      _showTimeUpDialog();
    }
  }

  // void _playSound() async {
  //   await _audioCache.play('assets/hetgio_notification.mp3');
  // }

  void _showTimeUpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Hết giờ!"),
        content: Text("Thời gian đã kết thúc."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("OK"),
          ),
        ],
      ),
    );
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

    _countdown();
  }

  void _cancelTimer() {
    setState(() {
      _isRunning = false;
      _isPaused = false;
      _totalSeconds = 0;
      _timerText = "00:00:00";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Hẹn Giờ", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blueAccent,
          automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _timerText,
              style: TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 30),
            _buildTimeInputRow(),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: _isRunning
                      ? _pauseTimer
                      : (_isPaused ? _resumeTimer : _updateTimer),
                  icon: Icon(
                    _isRunning
                        ? Icons.pause
                        : (_isPaused ? Icons.play_arrow : Icons.play_arrow),
                    color: Colors.white,
                  ),
                  label: Text(
                      _isRunning
                          ? "Tạm dừng"
                          : (_isPaused ? "Tiếp tục" : "Bắt đầu"),
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isRunning
                        ? Colors.orange
                        : (_isPaused ? Colors.green : Colors.blue),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _cancelTimer,
                  icon: Icon(Icons.stop, color: Colors.white),
                  label: Text("Hủy", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeInputRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTimeInput("Giờ", _hour, (value) => setState(() => _hour = value)),
        _buildTimeInput(
            "Phút", _minute, (value) => setState(() => _minute = value)),
        _buildTimeInput(
            "Giây", _second, (value) => setState(() => _second = value)),
      ],
    );
  }

  Widget _buildTimeInput(String label, int value, Function(int) onChanged) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          width: 80,
          child: TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "0",
            ),
            onChanged: (val) {
              int? parsedValue = int.tryParse(val);
              if (parsedValue != null) {
                onChanged(parsedValue);
              }
            },
          ),
        ),
      ],
    );
  }
}
