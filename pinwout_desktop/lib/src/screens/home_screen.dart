import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/wallet_provider.dart';
import '../widgets/sidebar.dart';
import '../widgets/wallet_card.dart';
import '../widgets/portfolio_overview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  _buildHeader(context),
                  const SizedBox(height: 32),
                  const WalletCard(),
                  const SizedBox(height: 24),
                  const PortfolioOverview(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PinWout Venture Corp',
                style: Theme.of(
                  context,
                )
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                'Cardano Blockchain Integration',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Consumer<WalletProvider>(
          builder: (context, wallet, _) {
            return ElevatedButton.icon(
              onPressed:
                  wallet.isConnected ? null : () => _showConnectDialog(context),
              icon: Icon(
                wallet.isConnected
                    ? Icons.check_circle
                    : Icons.account_balance_wallet,
              ),
              label: Text(wallet.isConnected ? 'Connected' : 'Connect Wallet'),
            );
          },
        ),
      ],
    );
  }

  void _showConnectDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Connect Wallet'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<WalletProvider>().createWallet();
                Navigator.pop(context);
              },
              child: const Text('Create New Wallet'),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                // TODO: Show restore wallet dialog
                Navigator.pop(context);
              },
              child: const Text('Restore from Recovery Phrase'),
            ),
          ],
        ),
      ),
    );
  }
}
