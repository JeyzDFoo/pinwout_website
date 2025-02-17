import 'package:flutter/material.dart';
import 'package:pinwout_vc/colors.dart';

class OpperIconPainter extends CustomPainter {
  final bool? hideBorder;
  final bool? zenMode;
  final bool? isLight;
  double? animationValue;

  OpperIconPainter(this.zenMode, this.isLight,
      {this.animationValue, this.hideBorder});

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = size.width * 0.06;
    animationValue ??= 1;

    final background = Paint()
      ..color = hideBorder == true
          ? Colors.transparent
          : isLight ?? false
              ? Colors.black
              : PinWoutColors.seedLight
      ..style = PaintingStyle.fill;
    canvas.drawRect(Offset.zero & size, background);

    final inlays = Paint()
      ..color = isLight ?? false ? Colors.black : PinWoutColors.seedLight
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill;

    final strokes = Paint()
      ..color = isLight ?? false ? PinWoutColors.seedLight : Colors.black
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill;

    randomAnimationValue() {
      return size.width * 0.01 * animationValue!;
    }

    Offset topLeft = Offset(size.width * 0.2 + randomAnimationValue() * 1.5,
        size.height * 0.18 + randomAnimationValue() * 3);
    Offset bottomLeft = Offset(size.width * 0.25 + randomAnimationValue() * 3,
        size.height * 0.85 - randomAnimationValue() * 2);
    Offset midRight = Offset(size.width * 0.885 - randomAnimationValue() * 1.5,
        size.height * 0.5 + randomAnimationValue() * 2);
    Offset center = Offset(size.width / 2 + randomAnimationValue(),
        size.height / 2 + randomAnimationValue());

    Offset centerRight = Offset(size.width / 2 + randomAnimationValue() * 2.5,
        size.height / 2 + randomAnimationValue() * 3);

    double centerCircleRadius = size.width * 0.25;
    double topLeftRadius = size.width * 0.12;
    double bottomLeftRadius = size.width * 0.1;
    double midRightRadius = size.width * 0.08;

    //Lines connecting the docts
    canvas.drawLine(center, bottomLeft, strokes);
    canvas.drawLine(center, topLeft, strokes);
    canvas.drawLine(center, midRight, strokes);

    //Center Circle
    canvas.drawCircle(
      center,
      centerCircleRadius,
      strokes,
    );
    canvas.drawCircle(
      center,
      centerCircleRadius * 0.72 * (1 - animationValue! * 0.05),
      inlays,
    );

    canvas.drawCircle(
      centerRight,
      centerCircleRadius * 0.3,
      strokes,
    );

    //Top Left Circle
    canvas.drawCircle(topLeft, topLeftRadius, strokes);
    canvas.drawCircle(topLeft, topLeftRadius * 0.6, inlays);

    //Bottom Left Circle
    canvas.drawCircle(bottomLeft, bottomLeftRadius, strokes);
    canvas.drawCircle(bottomLeft, bottomLeftRadius * 0.6, inlays);
    //Mid Right Circle
    canvas.drawCircle(midRight, midRightRadius, strokes);
    canvas.drawCircle(midRight, midRightRadius * 0.6, inlays);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return (oldDelegate as OpperIconPainter).animationValue != animationValue;
  }
}

class OpperIcon extends StatefulWidget {
  final double size;
  final bool? hideBorder;
  final bool? zenMode;
  final bool? isLight;
  OpperIcon(
      {super.key,
      required this.size,
      this.hideBorder,
      this.zenMode,
      this.isLight});

  @override
  State<OpperIcon> createState() => _OpperIconState();
}

class _OpperIconState extends State<OpperIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(widget.size / 5),
          child: CustomPaint(
            size: Size(widget.size, widget.size),
            painter: OpperIconPainter(widget.zenMode, widget.isLight,
                animationValue: _animation.value,
                hideBorder: widget.hideBorder),
          ),
        );
      },
    );
  }
}
