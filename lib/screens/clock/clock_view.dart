import 'dart:async';
import 'dart:math';
import 'package:alarm_clock_app/components.dart';
import 'package:alarm_clock_app/generated/assets.dart';
import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  final double size;
  const ClockView({Key? key, required this.size}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Image.asset(Assets.assetsClock, width: 280.0, height: 250.0,),
          Container(
          width: 270.0,
          height: 252.0,
          child: Transform.rotate(
            angle: -pi / 2,
            child: CustomPaint(
              painter: ClockPainter(),
            ),
          ),
        ),]
      ),
    );
  }
}
