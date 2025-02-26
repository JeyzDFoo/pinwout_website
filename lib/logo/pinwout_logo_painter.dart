import 'package:flutter/material.dart';
import 'dart:math';

import 'package:pinwout_vc/colors.dart';

class PinWoutLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw red sine wave (half cycle stretched to take up the whole space, flipped about the x-axis)
    final redPaint = Paint()
      ..color = PinWoutColors.primaryYellow.withAlpha(140)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
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
      ..color = PinWoutColors.primaryCyan.withAlpha(100)
      ..style = PaintingStyle.stroke;

    final blueSinePath = Path();
    blueSinePath.moveTo(0, size.height / 2 + amplitude * sin(3 * pi / 2));
    for (double x = 0; x <= size.width; x++) {
      final y =
          size.height / 2 + amplitude * sin(pi * x / size.width + 3 * pi / 2);
      blueSinePath.lineTo(x, y);
      bluePaint.strokeWidth = 1 +
          (2 *
              (x /
                  size.width)); // Linearly iterate stroke width between 1 and 3
    }

    canvas.drawPath(blueSinePath, bluePaint);

    // Draw green horizontal sine wave starting at the origin
    final greenPaint = Paint()
      ..color = PinWoutColors.primaryMagenta.withAlpha(100)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

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
