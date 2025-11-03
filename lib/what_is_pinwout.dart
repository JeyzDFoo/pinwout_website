import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:pinwout_vc/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatIsPinWout extends StatefulWidget {
  const WhatIsPinWout({
    super.key,
  });

  @override
  State<WhatIsPinWout> createState() => _WhatIsPinWoutState();
}

class _WhatIsPinWoutState extends State<WhatIsPinWout> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

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
              "PinWout Venture Corp is a Micro-Angel investment fund based in Calgary, Alberta, Canada. We're driven by the belief that even the smallest, most basic investments can lead to high-impact results when deployed effectively.",
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
              "As a Micro-Angel investment fund, we identify and support early-stage technologies like our flagship portfolio company, Opper. We adopt our investment ethos when tackling bigger, global problems through strategic capital deployment. With the right approach, any investment — whether energy, effort, or capital — can become something of much greater value. We're building and investing in technologies that realize this concept at every possible level of impact.\n\nPower in. Work out.\n\nPinWout Venture Corp is proudly founded and located in Calgary, Alberta, Canada.",
              style: TextStyle(
                color: PinWoutColors.beige,
              ),
            ),
            SizedBox(height: 24),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Contact Us",
                  style: TextStyle(
                      color: PinWoutColors.beige,
                      decoration: TextDecoration.underline,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 12),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: PinWoutColors.beige),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PinWoutColors.beige),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PinWoutColors.beige),
                ),
              ),
              style: TextStyle(color: PinWoutColors.beige),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _messageController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'How can we help you?',
                labelStyle: TextStyle(color: PinWoutColors.beige),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PinWoutColors.beige),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PinWoutColors.beige),
                ),
              ),
              style: TextStyle(color: PinWoutColors.beige),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      await FirebaseAnalytics.instance.logEvent(
                        name: 'submit_contact_form',
                        parameters: {
                          'email': _emailController.text,
                          'message': _messageController.text,
                          'timestamp': DateTime.now().toIso8601String(),
                        },
                      );
                      _emailController.clear();
                      _messageController.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Thank you, we will be in touch!"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Text("Submit")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
