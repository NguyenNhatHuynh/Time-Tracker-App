import 'package:flutter/material.dart';

class CurrentTimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Current Time")),
      body: Center(
        child: Text(
          "Hiển thị giờ hiện tại (dựa trên múi giờ thiết bị)",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
