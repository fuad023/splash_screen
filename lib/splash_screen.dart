import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:splash_screen/home/account_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: const Color(0xFFF7F7F7),
      splash: LottieBuilder.asset('assets/squid-game-anim.json'),
      duration: 1800,
      splashIconSize: 2000,
      nextScreen: const AccountManagePage(),
    );
  }
}