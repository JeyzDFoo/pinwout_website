import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:pinwout_vc/gravity.dart';
import 'package:pinwout_vc/header.dart';
import 'package:pinwout_vc/opper.dart';
import 'package:pinwout_vc/subheader.dart';
import 'package:pinwout_vc/what_is_pinwout.dart';
import 'package:pinwout_vc/who_we_are.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Comic"),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        body: Container(
          color: Colors.black,
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800, minHeight: 10),
              child: SingleChildScrollView(
                child: WebOrMobile(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WebOrMobile extends StatelessWidget {
  const WebOrMobile({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android);
    return isMobile ? const Mobile() : const Web();
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
        Opper(),
        Gravity(),
        Team(),
        WhatIsPinWout(),
      ],
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
