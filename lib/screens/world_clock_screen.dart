import 'package:flutter/material.dart';

class WorldClockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("World Time")),
      body: Center(
        child: Text(
          "Hiển thị giờ thực của các quốc gia trên thế giới",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
