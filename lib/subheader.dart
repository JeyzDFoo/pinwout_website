import 'package:flutter/material.dart';
import 'package:pinwout_vc/colors.dart';

class SubHeader extends StatelessWidget {
  const SubHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [PinWoutColors.black, PinWoutColors.blue],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "Power In, Work Out",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text:
                  "We transform small inputs into powerful results, focusing on efficiency and impact. With our flagship app, Opper, we help businesses turn everyday efforts into meaningful outcomes, reflecting our belief that with the right approach, any input—whether energy or investment—can create greater value.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
