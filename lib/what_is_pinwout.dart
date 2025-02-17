import 'package:flutter/material.dart';
import 'package:pinwout_vc/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatIsPinWout extends StatelessWidget {
  const WhatIsPinWout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [PinWoutColors.blue, PinWoutColors.purple],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is PinWout?",
              style: TextStyle(
                color: PinWoutColors.beige,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
            SizedBox(height: 12),
            Text(
              "PinWout VC is a growing group of technical products. We're driven by the belief that even the smallest, most basic inputs can lead to high-impact results when used effectively.",
              style: TextStyle(
                color: PinWoutColors.beige,
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "With everything we build, our mission is to turn what's already available into something much greater.",
                    style: TextStyle(
                      color: PinWoutColors.beige,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              "With our flagship app, Opper, we're building a platform that empowers anyone to turn everyday, subjective inputs into high-impact, life-changing results. We adopt that same ethos when tackling bigger, global problems. With the right approach, any input — whether energy, effort, or investment — can become something of much greater value. We're building technologies that realize that concept at every possible level of impact.\n\nPower in. Work out.\n\nPinWout is proudly founded and  located in Calgary, Alberta, Canada.",
              style: TextStyle(
                color: PinWoutColors.beige,
              ),
            ),
            SizedBox(height: 24),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    onTap: () {
                      launchUrl(Uri.parse('mailto:cofounders@pinwout.com'));
                    },
                    child: Text(
                      "Contact Us",
                      style: TextStyle(
                          color: PinWoutColors.beige,
                          decoration: TextDecoration.underline,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
