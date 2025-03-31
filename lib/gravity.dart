import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:pinwout_vc/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) {
                  // Change text color on hover
                },
                onExit: (_) {
                  // Revert text color when not hovering
                },
                child: GestureDetector(
                  onTap: () async {
                    FirebaseAnalytics.instance.logEvent(
                      name: 'gravity_whitepaper_clicked',
                      parameters: {
                        'source': 'gravity_widget',
                      },
                    );

                    try {
                      final url =
                          "https://firebasestorage.googleapis.com/v0/b/pinwout-bd900.firebasestorage.app/o/gravity_whitepaper_30-mar-2025.pdf?alt=media&token=14f6ba40-f986-4446-8f61-90453f37238b";
                      //print("download url: $url");
                      // Logic to download the file using the URL
                      // For example, you can use the `url_launcher` package to open the URL in a browser
                      await launchUrl(Uri.parse(url));
                    } catch (e) {
                      // Handle errors, e.g., file not found or network issues
                      print('Error downloading file: $e');
                    }
                  },
                  child: Text(
                    "Download Gravity Whitepaper",
                    style: TextStyle(
                      color: PinWoutColors.golden,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
