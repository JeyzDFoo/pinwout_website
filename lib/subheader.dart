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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
            textAlign: TextAlign.left,
            text: TextSpan(
              text:
                  "We transform small inputs into powerful results, focusing on efficiency and impact. With our flagship app, Opper, we are redefining how business operate. As one of Alberta's fastest growing tech companies, we are strategically positioning ourselves to be a sustainable, decentralized, and diversified technology company.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
