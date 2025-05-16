import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(Icons.check_circle, size: 100, color: Colors.blue),
            Text("UpTodo"),
          ],
        ),
      ),
    );
  }
}
