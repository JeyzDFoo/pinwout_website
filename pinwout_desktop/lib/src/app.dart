import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/wallet_screen.dart';
import 'screens/transactions_screen.dart';
import 'screens/settings_screen.dart';
import 'providers/theme_provider.dart';
import 'theme/app_theme.dart';

class PinWoutApp extends StatelessWidget {
  const PinWoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'PinWout - Cardano Desktop',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen(),
            '/wallet': (context) => const WalletScreen(),
            '/transactions': (context) => const TransactionsScreen(),
            '/settings': (context) => const SettingsScreen(),
          },
        );
      },
    );
  }
}
