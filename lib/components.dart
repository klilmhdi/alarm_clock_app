import 'dart:math';

import 'package:flutter/material.dart';

// navigate and finish pervious screen
navAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => Widget), (route) {
      return false;
    });

// just navigate for screen
navTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));

Color primaryTextColor = Colors.white;
Color dividerColor = Colors.white54;
Color pageBackgroundColor = Color(0xFF2D2F41);
Color menuBackgroundColor = Color(0xFF242634);

Color clockBG = Color(0xFF444974);
Color clockOutline = Color(0xFFEAECFF);
Color? secHandColor = Colors.orange[300];
Color minHandStatColor = Color(0xFF748EF6);
Color minHandEndColor = Color(0xFF77DDFF);
Color hourHandStatColor = Color(0xFFC279FB);
Color hourHandEndColor = Color(0xFFEA74AB);


// build alarm card item
Widget buildItem(String date, String time) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Card(
      color: Colors.white70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alarm',
                    style: TextStyle(color: Colors.teal, fontSize: 20.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        time,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(date,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                      Container(
                        child: Switch(
                          value: true,
                          onChanged: (value) {
                            // setState(() {});
                          },
                        ),
                      )
                    ],
                  ),
                  // DateRow(alarm: 'alarm')
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    // var fillBrush = Paint()..color = Color(0xFF444974);

    // var outlineBrush = Paint()
    //   ..color = Color(0xFFEAECFF)
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 5;

    var centerFillBrush = Paint()..color = Color(0xFFEAECFF);

    // اعدادات عقرب الثواني اللي باللون البرتقالي
    var secHandBrush = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    // اعدادات عقرب الدقائق اللي باللون الازرق المدمج
    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF77DDFF)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    // اعدادات عقرب الساعات اللي باللون الزهري
    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;


    // خطوط بيضاء بتوضحلك الساعة كام
    // var dashBrush = Paint()
    //   ..color = Color(0xFFEAECFF)
    //   ..style = PaintingStyle.stroke
    //   ..strokeCap = StrokeCap.round
    //   ..strokeWidth = 3;


    // canvas.drawCircle(center, radius - 60, fillBrush);
    // canvas.drawCircle(center, radius - 60, outlineBrush);

    var hourHandX = centerX +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, 16, centerFillBrush);

    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;
    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
      // canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

