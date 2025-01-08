import 'package:flutter/material.dart';
import 'package:pinwout_vc/colors.dart';

class Opper extends StatelessWidget {
  const Opper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: PinWoutColors.black,
      child: Column(
        children: [
          Text(
            "Opper",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "Simplified prioritization. Faster progression.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          OpperGrid(),
        ],
      ),
    );
  }
}

class OpperCard extends StatelessWidget {
  final String title;
  final String description;

  const OpperCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: PinWoutColors.purple,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 8),
            Expanded(child: Text(description)),
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
        List<Map<String, String>> cardData = [
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
            "title": "Community-driven roadmap.",
            "description":
                "We don't speculate about what to build — we talk to our users and build accordingly. Everything we create is community and user driven. We depend on a growing community to gain feedback on what to build, what to improve, and what actually matters. Join us."
          },
          {
            "title": "Pared down prioritization.",
            "description":
                "You provide an input, Opper intelligently quantifies your priorities with a 'score' that takes your perspective seriously. It's everything you need to make smarter decisions, and nothing you don't."
          },
        ];

        return OpperCard(
          title: cardData[index]["title"]!,
          description: cardData[index]["description"]!,
        );
      },
    );
  }
}
