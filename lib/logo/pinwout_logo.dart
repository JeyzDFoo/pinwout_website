import 'package:flutter/material.dart';
import 'package:pinwout_vc/colors.dart';
import 'pinwout_logo_painter.dart';

class PinWoutIcon extends StatefulWidget {
  final double size;
  const PinWoutIcon({super.key, required this.size});

  @override
  State<PinWoutIcon> createState() => _PinWoutIconState();
}

class _PinWoutIconState extends State<PinWoutIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(widget.size / 10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomPaint(
          painter: PinWoutLogoPainter(),
        ),
      ),
    );
  }
}

class PinwoutLogo extends StatefulWidget {
  final double size;
  const PinwoutLogo({super.key, required this.size});

  @override
  State<PinwoutLogo> createState() => _PinwoutLogoState();
}

class _PinwoutLogoState extends State<PinwoutLogo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size * 3.2,
      height: widget.size,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(widget.size)),
      child: Row(
        children: [
          Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(widget.size / 10)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomPaint(
                painter: PinWoutLogoPainter(),
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontStyle: FontStyle.italic),
              children: [
                TextSpan(text: 'P'),
                TextSpan(
                  text: 'in',
                  style: TextStyle(fontSize: 20),
                ),
                TextSpan(text: 'W'),
                TextSpan(
                  text: 'out',
                  style: TextStyle(fontSize: 20),
                ),
                TextSpan(
                    text: '.',
                    style: TextStyle(color: PinWoutColors.primaryYellow)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
