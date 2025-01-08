import 'package:flutter/material.dart';
import 'package:pinwout_vc/colors.dart';

class Team extends StatelessWidget {
  const Team({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            PinWoutColors.green,
            PinWoutColors.blue,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              "Who We Are",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 600, // Adjust this value as needed
                childAspectRatio: 1,
              ),
              children: <Widget>[
                TeamCard(
                  name: "Jeremy Jeys Parker",
                  role:
                      "Jeremy is a seasoned leader and engineer with expertise in process automation, software development, and machine learning. He most recently lead the technical development at ZeroSound Systems, transforming a hardware-enabled software concept into a globally commercialized product.",
                  image: "assets/john_doe.jpg",
                ),
                TeamCard(
                  name: "Jonathan Johnson",
                  role:
                      "JJ is a marketing leader with years of experience in SAAS and fintech startups. He recently grew Durable from 0 to a 15M Series A raise in 15 months, sat on the executive team at Bench Accounting, and has consulted multiple early-stage startups to successful acquisitions and VC raises.",
                  image: "assets/jane_doe.jpg",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TeamCard extends StatelessWidget {
  final String name;
  final String role;
  final String image;

  const TeamCard(
      {super.key, required this.name, required this.role, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: PinWoutColors.black,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 24,
            ),
            // Image.asset(image),
            Container(
              decoration: BoxDecoration(
                color: PinWoutColors.purple,
                shape: BoxShape.circle,
              ),
              height: 100,
              width: 100,
            ),
            Text(name),
            SizedBox(height: 12),
            Expanded(child: Text(role)),
          ],
        ),
      ),
    );
  }
}
