import 'dart:math';
import 'package:flutter/material.dart';


class CustomRadarChart extends StatelessWidget {
  final List<String> labels;
  final List<double> values;
  final double maxValue;
  final Color lineColor;
  final Color dataPointColor;
  final Color dataLineColor;

  const CustomRadarChart({
    required this.labels,
    required this.values,
    required this.maxValue,
    this.lineColor = Colors.grey,
    this.dataPointColor = Colors.green,
    required this.dataLineColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RadarChartPainter(
        labels: labels,
        values: values,
        maxValue: maxValue,
        lineColor: lineColor,
        dataPointColor: dataPointColor,
        dataLineColor: dataLineColor,
      ),
    );
  }
}

class RadarChartPainter extends CustomPainter {
  final List<String> labels;
  final List<double> values;
  final double maxValue;
  final Color lineColor;
  final Color dataPointColor;
  final Color dataLineColor;

  RadarChartPainter({
    required this.labels,
    required this.values,
    required this.maxValue,
    this.lineColor = Colors.grey,
    this.dataPointColor = Colors.green,
    this.dataLineColor = Colors.lime,
  });

  late List<Offset> dataPoints; // 먼저 클래스 변수를 추가하세요.

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    // Draw the axis lines
    final linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final axisPoints = <Offset>[];
    final angle = 2 * pi / labels.length;
    for (var i = 0; i < labels.length; i++) {
      final x = center.dx + radius * cos(i * angle - pi / 2); // Subtract pi/2 to rotate
      final y = center.dy + radius * sin(i * angle - pi / 2); // Subtract pi/2 to rotate
      final point = Offset(x, y);
      axisPoints.add(point);

      canvas.drawLine(center, point, linePaint);
    }

    // Draw the circular border
    final borderPaint = Paint()
      ..color = lineColor
      ..strokeWidth = 5 // Increase border stroke width
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, borderPaint);

    dataPoints = <Offset>[];
    for (var i = 0; i < values.length; i++) {
      final value = values[i];
      final ratio = value / maxValue;
      final x = center.dx + radius * ratio * cos(i * angle - pi / 2); // Subtract pi/2 to rotate
      final y = center.dy + radius * ratio * sin(i * angle - pi / 2); // Subtract pi/2 to rotate
      final point = Offset(x, y);
      dataPoints.add(point);
    }

    final innerCirclePaint = Paint()
      ..color = lineColor.withOpacity(0.5) // 반투명한 테두리 색상 사용
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const numberOfCircles = 4; // 겹쳐진 원의 개수
    for (var i = 1; i <= numberOfCircles; i++) {
      canvas.drawCircle(center, radius / numberOfCircles * i, innerCirclePaint);
    }

    final dataLinePaint = Paint()
      ..color = dataLineColor
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(dataPoints[0].dx, dataPoints[0].dy);
    for (var i = 1; i < dataPoints.length; i++) {
      path.lineTo(dataPoints[i].dx, dataPoints[i].dy);
    }
    path.lineTo(dataPoints[0].dx, dataPoints[0].dy);
    canvas.drawPath(path, dataLinePaint);

    // Draw the data points
    final dataPointPaint = Paint()
      ..color = dataPointColor
      ..strokeWidth = 3
      ..style = PaintingStyle.fill;

    for (var i = 0; i < dataPoints.length; i++) {
      final point = dataPoints[i];
      canvas.drawCircle(point, 4, dataPointPaint);
    }

    // Draw the labels
    final textPaint = TextPainter(
      textDirection: TextDirection.ltr,
    );

    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: 12,
    );

    for (var i = 0; i < labels.length; i++) {
      final label = labels[i];
      final padding = (i == 0 || i == 3) ? 10.0 : 25.0;
      final x = center.dx + (radius + padding) * cos(i * angle - pi / 2); // Subtract pi/2 to rotate, add 10 or 30 as padding
      final y = center.dy + (radius + padding) * sin(i * angle - pi / 2); // Subtract pi/2 to rotate, add 10 or 30 as padding
      final labelOffset = Offset(x, y);
      textPaint.text = TextSpan(
        text: label,
        style: textStyle,
      );
      textPaint.layout(minWidth: 0, maxWidth: double.infinity);
      textPaint.paint(canvas, labelOffset - Offset(textPaint.width / 2, textPaint.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}