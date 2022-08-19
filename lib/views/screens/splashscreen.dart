import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:footballapp/main.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash: 
               Lottie.asset("assets/images/ball.json"),

    splashIconSize: 250,
     nextScreen: Home(),
     duration: 3000,
     
     splashTransition: SplashTransition.rotationTransition,
     animationDuration: const Duration(seconds: 3),
     
     );
  }
}