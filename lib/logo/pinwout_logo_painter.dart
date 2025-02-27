import 'package:flutter/material.dart';
import 'dart:math';

import 'package:pinwout_vc/colors.dart';

class PinWoutLogoPainter extends CustomPainter {
  final double iconSize;

  PinWoutLogoPainter(this.iconSize);

  @override
  void paint(Canvas canvas, Size size) {
    // Draw red sine wave (half cycle stretched to take up the whole space, flipped about the x-axis)
    final redPaint = Paint()
      ..color = PinWoutColors.golden.withAlpha(120)
      ..style = PaintingStyle.stroke
      ..strokeWidth = (iconSize / 50).clamp(2, 10);
    final sineStart = 0.0;
    final sineEnd = pi;

    final redSinePath = Path();
    final amplitude = -size.height / 2; // Negate the amplitude to flip the wave
    final frequency = pi / size.width;

    redSinePath.moveTo(0, size.height / 2 + amplitude * sin(sineStart));
    for (double x = 0; x <= size.width; x++) {
      final y = size.height / 2 + amplitude * sin(frequency * x + sineStart);
      redSinePath.lineTo(x, y);
      if (frequency * x + sineStart >= sineEnd) break;
    }

    canvas.drawPath(redSinePath, redPaint);

    // Draw blue sine wave (half cycle stretched)
    final bluePaint = Paint()
      ..color = PinWoutColors.green.withAlpha(200)
      ..style = PaintingStyle.stroke
      ..strokeWidth = (iconSize / 50).clamp(2, 10);

    final blueSinePath = Path();
    blueSinePath.moveTo(0, size.height / 2 + amplitude * sin(3 * pi / 2));
    for (double x = 0; x <= size.width; x++) {
      final y =
          size.height / 2 + amplitude * sin(pi * x / size.width + 3 * pi / 2);
      blueSinePath.lineTo(x, y);
    }

    canvas.drawPath(blueSinePath, bluePaint);

    // Draw green horizontal sine wave starting at the origin
    final greenPaint = Paint()
      ..color = PinWoutColors.blue.withAlpha(200)
      ..style = PaintingStyle.stroke
      ..strokeWidth = (iconSize / 50).clamp(2, 10);

    final greenSinePath = Path();
    greenSinePath.moveTo(0, size.height / 2 - amplitude * sin(3 * pi / 2));
    for (double x = 0; x <= size.width; x++) {
      final y =
          size.height / 2 - amplitude * sin(pi * x / size.width + 3 * pi / 2);
      greenSinePath.lineTo(x, y);
    }

    canvas.drawPath(greenSinePath, greenPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
