import 'package:confetti/confetti.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pinwout_vc/colors.dart';
import 'package:pinwout_vc/gravity.dart';
import 'package:pinwout_vc/header.dart';
import 'package:pinwout_vc/logo/pinwout_logo.dart';
import 'package:pinwout_vc/opper.dart';
import 'package:pinwout_vc/subheader.dart';
import 'package:pinwout_vc/what_is_pinwout.dart';
import 'package:pinwout_vc/who_we_are.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(LogoApp());
}

class LogoApp extends StatelessWidget {
  const LogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PinWout Venture Corp.',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Center(child: PinWoutIcon(size: 800)),
    );
  }
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Comic"),
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/about': (context) => const AboutScreen(),
        // Add more routes here
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  final ConfettiController _controllerTopCenter =
      ConfettiController(duration: const Duration(seconds: 1));

  @override
  void initState() {
    _controllerTopCenter.play();
    //_analytics.logAppOpen();
    super.initState();
  }

  @override
  void dispose() {
    _controllerTopCenter.dispose();
    //_analytics.resetAnalyticsData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 800, minHeight: 10),
                child: SingleChildScrollView(
                  child: Web(),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var i = 0; i < 10; i++)
                ConfettiWidget(
                  confettiController: _controllerTopCenter,
                  //blastDirection: -pi / 2,
                  blastDirectionality: BlastDirectionality.explosive,
                  emissionFrequency: 0.05,
                  numberOfParticles: 5,
                  maxBlastForce: 20,
                  minBlastForce: 2,
                  gravity: 0.2,
                  colors: [
                    PinWoutColors.blue,
                    PinWoutColors.green,
                    PinWoutColors.purple,
                    PinWoutColors.black,
                    PinWoutColors.primaryCyan,
                    PinWoutColors.primaryMagenta,
                    PinWoutColors.primaryYellow,
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Center(
        child: Text(
          'This is the About Us page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class WebOrMobile extends StatelessWidget {
  const WebOrMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Web();
  }
}

class Web extends StatelessWidget {
  const Web({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Header(title: 'PinWout Venture Corp.'),
        SubHeader(),
        Divider(),
        Opper(),
        Divider(),
        Gravity(),
        Team(),
        WhatIsPinWout(),
      ],
    );
  }
}
