import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Transaction History',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildTransactionsList(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionsList(BuildContext context) {
    return Expanded(
      child: Card(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            ListTile(
              leading: const Icon(Icons.arrow_upward, color: Colors.red),
              title: const Text('Sent'),
              subtitle: const Text('To: addr1_...xyz'),
              trailing: const Text('-5.0 ADA'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.arrow_downward, color: Colors.green),
              title: const Text('Received'),
              subtitle: const Text('From: addr1_...abc'),
              trailing: const Text('+15.5 ADA'),
            ),
          ],
        ),
      ),
    );
  }
}
