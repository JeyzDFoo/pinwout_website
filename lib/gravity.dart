import 'package:flutter/material.dart';
import 'package:pinwout_vc/colors.dart';

class Gravity extends StatelessWidget {
  const Gravity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [PinWoutColors.green, PinWoutColors.black],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
          ),
          Text(
            "Gravity",
            style: TextStyle(
              color: PinWoutColors.softWhite,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Sustainable Energy Storage for Today's Grids",
            style: TextStyle(
              color: PinWoutColors.softWhite,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 18),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text:
                  "Gravity is PinWout’s innovative approach to stabilizing energy grids using mountain gravity energy storage. By leveraging the natural force of gravity, this system stores excess renewable energy during peak production and releases it during periods of high demand. \n\nWith an emphasis on efficiency and sustainability, Gravity offers a cost-effective and scalable alternative to traditional energy storage methods such as Pumped Hydro and Chemical Batteries, helping to reduce grid instability while supporting the transition to a cleaner, greener future.",
              style: TextStyle(
                color: PinWoutColors.softWhite,
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
