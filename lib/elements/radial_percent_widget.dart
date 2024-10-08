import 'dart:math';

import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: RadialPercentWidget(
            percent: 0.72,
            fillColor: Colors.blue,
            lineColor: Colors.red,
            freeColor: Colors.yellow,
            lineWidth: 5,
            child: Text(
              '72%',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  MyPainter(
      {super.repaint,
      required this.percent,
      required this.fillColor,
      required this.lineColor,
      required this.freeColor,
      required this.lineWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Rect actRect = calculateArcsRect(size);

    drawBackground(canvas, size);

    drawFreeArc(canvas, actRect);

    drawFilledArc(canvas, actRect);
  }

  void drawFilledArc(Canvas canvas, Rect actRect) {
    final paint = Paint();
    paint.color = lineColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;
    paint.strokeCap = StrokeCap.round;
    canvas.drawArc(
      actRect,
      -pi / 2,
      pi * 2 * percent,
      false,
      paint,
    );
  }

  void drawFreeArc(Canvas canvas, Rect actRect) {
    final paint = Paint();
    paint.color = freeColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;
    canvas.drawArc(
      actRect,
      pi * 2 * percent - pi / 2,
      pi * 2 * (1 - percent),
      false,
      paint,
    );
  }

  void drawBackground(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = fillColor;
    canvas.drawOval(Offset.zero & size, paint);
  }

  Rect calculateArcsRect(Size size) {
    const linesMargin = 3;
    final offset = lineWidth / 2 + linesMargin;
    final actRect = Offset(offset, offset) &
        Size(
          size.width - offset * 2,
          size.height - offset * 2,
        );
    return actRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RadialPercentWidget extends StatelessWidget {
  final Widget child;
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  const RadialPercentWidget(
      {super.key,
      required this.child,
      required this.percent,
      required this.fillColor,
      required this.lineColor,
      required this.lineWidth,
      required this.freeColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: MyPainter(
            percent: percent,
            lineColor: lineColor,
            fillColor: fillColor,
            freeColor: freeColor,
            lineWidth: lineWidth,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(11),
          child: Center(child: child),
        ),
      ],
    );
  }
}
