import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/constants/string_constants.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/widgets/custom_text_button.dart';

class FocusTimer extends StatefulWidget {
  const FocusTimer({super.key});

  @override
  _FocusTimerState createState() => _FocusTimerState();
}

class _FocusTimerState extends State<FocusTimer> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Timer _timer;
  Duration _duration = Duration(seconds: 0);
  final Duration _maxDuration = Duration(hours: 1);

  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _maxDuration);
  }

  void _startTimer() {
    _isRunning = true;
    _controller.forward(from: 0);
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_duration < _maxDuration) {
        setState(() {
          _duration += Duration(seconds: 1);
        });
      } else {
        _stopTimer();
      }
    });
  }

  void _stopTimer() {
    _isRunning = false;
    _timer.cancel();
    _controller.stop();
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    _controller.dispose();
    if (_isRunning) _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: CircularProgressIndicator(
                value: _controller.value,
                strokeWidth: 10,
                backgroundColor: Colors.grey[800],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              ),
            ),
            Text(
              _formatDuration(_duration),
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          StringConstants.focusSubTitle,
          style: TextstyleConstants.onboardingSubTitle,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        CustomTextButton(
          label: _isRunning ? "Stop Focusing" : "Start Focusing",
          onPressed: _isRunning ? _stopTimer : _startTimer,
        ),
      ],
    );
  }
}
