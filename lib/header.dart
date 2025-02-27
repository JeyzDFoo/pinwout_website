import 'package:flutter/material.dart';
import 'package:pinwout_vc/colors.dart';
import 'package:pinwout_vc/logo/pinwout_logo.dart';

class Header extends StatelessWidget {
  final String title;

  const Header({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: PinWoutColors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PinwoutLogo(size: 48),
          Image.asset("assets/images/canadaflag.png", height: 28),
        ],
      ),
    );
  }
}
