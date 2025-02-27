import 'package:flutter/material.dart';
import 'package:pinwout_vc/gravity.dart';
import 'package:pinwout_vc/header.dart';
import 'package:pinwout_vc/logo/pinwout_logo.dart';
import 'package:pinwout_vc/opper.dart';
import 'package:pinwout_vc/subheader.dart';
import 'package:pinwout_vc/what_is_pinwout.dart';
import 'package:pinwout_vc/who_we_are.dart';

void main() {
  runApp(const LogoApp());
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
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Comic"),
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/about': (context) => const AboutScreen(),
        // Add more routes here
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
