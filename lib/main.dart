import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      title: 'Time Management App',
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
        title: Text('Time Management App'),
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
            icon: Icon(Icons.timer),
            label: 'Hẹn Giờ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Hiển thị giờ hiện tại',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Bấm Giờ',
          ),
        ],
        selectedItemColor: isDarkMode ? Colors.amber : Colors.blue,
        unselectedItemColor: isDarkMode ? Colors.grey[400] : Colors.grey[700],
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
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
          ),
          _buildFeatureCard(
            context,
            icon: Icons.access_time,
            label: 'Hiển thị giờ hiện tại',
            routeName: '/current_time',
          ),
          _buildFeatureCard(
            context,
            icon: Icons.access_time,
            label: 'Bấm Giờ',
            routeName: '/stopwatch',
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
  }) {
    final iconColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, routeName),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
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
    );
  }
}
