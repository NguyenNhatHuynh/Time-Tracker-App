import 'package:flutter/material.dart';
import 'package:time_tracker/screens/current_time_screen.dart';
import 'package:time_tracker/screens/countdown_screen.dart';
import 'package:time_tracker/screens/stopwatch_screen.dart';
import 'package:time_tracker/screens/world_clock_screen.dart';
import 'package:time_tracker/screens/timer_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    CurrentTimeScreen(),
    CountdownScreen(),
    StopwatchScreen(),
    WorldClockScreen(),
    TimerScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Time Management App")),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Clock',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Countdown',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stop),
            label: 'Stopwatch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'World Time',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Timer',
          ),
        ],
      ),
    );
  }
}
