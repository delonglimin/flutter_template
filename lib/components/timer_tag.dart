import 'dart:async';

import 'package:flutter/material.dart';

class TimerTag extends StatefulWidget {
  final int time;
  final Function? onEnd;
  const TimerTag({Key? key, this.time = 3, this.onEnd}) : super(key: key);

  @override
  State<TimerTag> createState() => _TimerTagState();
}

class _TimerTagState extends State<TimerTag> {
  int _currentTime = 0;
  @override
  void initState() {
    _currentTime = widget.time;
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_currentTime <= 0) {
          timer.cancel();
          if (widget.onEnd != null) {
            widget.onEnd!();
          }
        } else {
          _currentTime--;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black12,
      ),
      child: Text(
        "${_currentTime}s",
      ),
    );
  }
}
