import 'package:flutter/material.dart';

class PortfolioOverview extends StatelessWidget {
  const PortfolioOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Portfolio Companies',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.5,
              children: [
                _buildPortfolioCard(
                  context,
                  name: 'Opper',
                  description: 'Productivity & Prioritization App',
                  color: const Color(0xFF00509E),
                ),
                _buildPortfolioCard(
                  context,
                  name: 'Gravity',
                  description: 'Mountain Gravity Energy Storage',
                  color: const Color(0xFF228B22),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioCard(
    BuildContext context, {
    required String name,
    required String description,
    required Color color,
  }) {
    return Card(
      child: InkWell(
        onTap: () {
          // TODO: Navigate to portfolio company details
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.business, color: color),
              ),
              const Spacer(),
              Text(
                name,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
