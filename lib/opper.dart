import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:pinwout_vc/colors.dart';
import 'package:pinwout_vc/logo/opper_logo.dart';
import 'package:url_launcher/url_launcher.dart';

class Opper extends StatelessWidget {
  const Opper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: PinWoutColors.black,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 12),
              OpperLogo(size: 60, includeTagline: false),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              SizedBox(width: 12),
              Text(
                "Simplified prioritization. Faster progression.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          OpperGrid(),
          SizedBox(height: 12),
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
                  onTap: () {
                    launchUrl(Uri.parse('https://www.opper.dev'));
                  },
                  child: Text(
                    "Learn more at www.opper.dev",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OpperCard extends StatelessWidget {
  final Widget leadingIcon;
  final String title;
  final String description;

  const OpperCard({
    super.key,
    required this.title,
    required this.description,
    required this.leadingIcon,
  });

  get seedLight => null;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: PinWoutColors.purple,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                leadingIcon,
                SizedBox(width: 8),
                Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white.withAlpha(220))),
              ],
            ),
            SizedBox(height: 8),
            Expanded(
                child: Text(description,
                    style: TextStyle(color: Colors.white.withAlpha(160)))),
          ],
        ),
      ),
    );
  }
}

class OpperGrid extends StatelessWidget {
  const OpperGrid({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth < 600 ? 1 : 2;

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        List<Widget> icons = [
          HeroIcon(HeroIcons.viewfinderCircle, color: PinWoutColors.lightGreen),
          HeroIcon(HeroIcons.sparkles, color: PinWoutColors.lightGreen),
          HeroIcon(HeroIcons.academicCap, color: PinWoutColors.lightGreen),
          HeroIcon(HeroIcons.adjustmentsHorizontal,
              color: PinWoutColors.lightGreen),
        ];
        List<Map<String, String>> cardData = [
          {
            "title": "Align your organization.",
            "description":
                "Your company is the most effective when everyone is rowing in the same diretion. Opper measures and quantifies how well aligned your team is, and provides actionable insights to get everyone on the same page."
          },
          {
            "title": "Invisible intelligence.",
            "description":
                "Opper uses proven decision making frameworks and prioritization methods to bring data to your intuition and decision making. But you'd never know it. Opper's intelligence is designed to stay out of your way, so you can focus on that next high-impact to-do item."
          },
          {
            "title": "Mastered in seconds.",
            "description":
                "Zero onboarding. Zero learning curve. Opper is intentionally designed to be mastered by anyone, anywhere in seconds. Because you're sick of overly complex project management and organization platforms. And so are we."
          },
          {
            "title": "Pared down prioritization.",
            "description":
                "You provide an input, Opper intelligently quantifies your priorities with a 'score' that takes your perspective seriously. It's everything you need to make smarter decisions, and nothing you don't."
          },
        ];

        return OpperCard(
          leadingIcon: icons[index],
          title: cardData[index]["title"]!,
          description: cardData[index]["description"]!,
        );
      },
    );
  }
}
