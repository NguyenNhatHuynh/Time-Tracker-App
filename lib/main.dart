import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/screens/world_clock_screen.dart';
import 'package:time_tracker/utils/theme_manager.dart';
import 'package:time_tracker/screens/timer_screen.dart';
import 'package:time_tracker/screens/current_time_screen.dart';
import 'package:time_tracker/screens/stopwatch_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeManager(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Tracker ⏰',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: themeManager.isDark ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => BaseScreen(),
        '/timer': (context) => BaseScreen(selectedIndex: 1),
        '/current_time': (context) => BaseScreen(selectedIndex: 2),
        '/stopwatch': (context) => BaseScreen(selectedIndex: 3),
        '/world_clock': (context) => BaseScreen(selectedIndex: 4),
      },
    );
  }
}

class BaseScreen extends StatefulWidget {
  final int selectedIndex;

  BaseScreen({this.selectedIndex = 0});

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  late int _selectedIndex;

  final List<Widget> _screens = [
    HomeContent(),
    TimerScreen(),
    CurrentTimeScreen(),
    StopwatchScreen(),
    WorldClockScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              Provider.of<ThemeManager>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Hẹn Giờ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Giờ hiện tại',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_10),
            label: 'Bấm Giờ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'Giờ Thế Giới',
          ),
        ],
        selectedItemColor: isDarkMode ? Colors.amber : Colors.blue,
        unselectedItemColor: isDarkMode ? Colors.grey[400] : Colors.grey[700],
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        type: BottomNavigationBarType.fixed, // Thêm kiểu fixed để dễ căn giữa
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  double cardElevation = 6;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildFeatureCard(
            context,
            icon: Icons.timer,
            label: 'Hẹn Giờ',
            routeName: '/timer',
            color: Colors.orange,
          ),
          _buildFeatureCard(
            context,
            icon: Icons.access_time,
            label: 'Hiển thị giờ hiện tại',
            routeName: '/current_time',
            color: Colors.green,
          ),
          _buildFeatureCard(
            context,
            icon: Icons.timer_10,
            label: 'Bấm Giờ',
            routeName: '/stopwatch',
            color: Colors.blue,
          ),
          _buildFeatureCard(
            context,
            icon: Icons.language,
            label: 'Giờ Thế Giới',
            routeName: '/world_clock',
            color: Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String routeName,
    required Color color,
  }) {
    final iconColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, routeName),
      child: Card(
        elevation: cardElevation, // Dùng biến cardElevation cho hiệu ứng shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: color.withOpacity(0.8), // Màu nền thẻ
        child: MouseRegion(
          onEnter: (_) {
            setState(() {
              cardElevation = 8; // Tăng hiệu ứng shadow khi hover
            });
          },
          onExit: (_) {
            setState(() {
              cardElevation = 6; // Quay lại shadow ban đầu khi rời hover
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: iconColor),
              SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
