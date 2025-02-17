import 'package:flutter/material.dart';
import 'package:pinwout_vc/colors.dart';
import 'package:pinwout_vc/logo/opper_icon.dart';

class OpperLogo extends StatefulWidget {
  const OpperLogo({super.key, this.size = 100, this.includeTagline = false});
  final double size;
  final bool includeTagline;

  @override
  _OpperLogoState createState() => _OpperLogoState();
}

class _OpperLogoState extends State<OpperLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
      reverseDuration: const Duration(seconds: 3),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: OpperIcon(size: widget.size)),
            SizedBox(width: widget.size * 0.08),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.diagonal3Values(1, 0.86, 1),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Opper",
                      style: TextStyle(
                        letterSpacing: -4,
                        fontSize: widget.size * 0.8,
                        fontWeight: FontWeight.bold,
                        color: PinWoutColors.seedLight,
                      ),
                    ),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: Offset(widget.size * 0.06, -widget.size * 0.35),
                        child: Text(
                          'TM',
                          textScaler: TextScaler.linear(widget.size * 0.006),
                          style: TextStyle(
                            color: PinWoutColors.seedLight,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (widget.includeTagline)
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return ShaderMask(
                shaderCallback: (bounds) {
                  double upperStop() {
                    if (_controller.value < 0.8) {
                      return 0.8;
                    } else {
                      return _controller.value;
                    }
                  }

                  return LinearGradient(colors: [
                    PinWoutColors.seedLight,
                    PinWoutColors.purple
                  ], stops: [
                    0.5,
                    upperStop()
                  ], tileMode: TileMode.mirror)
                      .createShader(bounds);
                },
                child: child,
              );
            },
            child: Text(
              'Get the right things done.',
              style: TextStyle(
                color: Colors.white, // This color is just a placeholder
                fontSize: widget.size * 0.2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
