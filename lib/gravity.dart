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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
          ),
          Text(
            "Gravity",
            style: TextStyle(
              color: PinWoutColors.softWhite,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Sustainable Energy Storage for Today's Grids",
            style: TextStyle(
              color: PinWoutColors.softWhite,
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 18),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text:
                  "Gravity is PinWout’s approach to stabilizing energy grids using mountain gravity energy storage (MGES). By leveraging the natural force of gravity, this system stores excess renewable energy during peak production and releases it during periods of high demand. \n\nWith an emphasis on efficiency and sustainability, Gravity offers a cost-effective, scalable alternative to traditional energy storage methods such as Pumped Hydro and chemical batteries such as the Tesla Megapack.",
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
