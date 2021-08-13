import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Art',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyPainter(),
    );
  }
}

class MyPainter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: ShapePainter(),
        child: Container(),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //canvas.drawColor(Colors.teal, BlendMode.clear);

    for (double i = 0; i <= 200; i = i + 1) {
      // ignore: non_constant_identifier_names
      Paint LinePaint = Paint()
        ..color =
            Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1)
        ..strokeWidth = 200
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      // ignore: non_constant_identifier_names
      Path LinePath = Path();
      LinePath.moveTo(i, i * i);
      LinePath.lineTo(size.width * i, size.height * (i / 2));

      // ignore: non_constant_identifier_names
      Paint CirclePaint = Paint()
        ..color =
            Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1)
        ..strokeWidth = 50
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      // ignore: non_constant_identifier_names
      Path CirclePath = Path();
      CirclePath.addOval(
        Rect.fromCircle(
          center: Offset(
            size.width,
            Random().nextDouble(),
          ),
          radius: i * i,
        ),
      );
      canvas.drawPath(LinePath, LinePaint);
      canvas.drawPath(CirclePath, CirclePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
