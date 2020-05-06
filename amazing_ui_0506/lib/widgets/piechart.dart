import 'package:amazing_ui_0506/data.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class PieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: customShadow,
            color: primaryColor),
        child: Stack(
          children: [
            CustomPaint(
              foregroundPainter: PieChartPainter(),
            ),
            Center(
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: customShadow,
                    color: primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PieChartPainter extends CustomPainter {
  final List expenses;
  final double width;

  PieChartPainter({this.expenses, this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    double total = 0;
    double startRadian = -pi / 2;

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 50;

    expenses.forEach((element) {
      total += element['amount'];
    });

    for (int i = 0; i < expenses.length; i++) {
      var currentExpenses = expenses[i];
      var sweepRadian = (currentExpenses['amount'] / total) * 2 * pi;
      paint.color = pieColors[i];
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          startRadian, sweepRadian, false, paint);
      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
