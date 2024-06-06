import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:pfa/authentification/login.page.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState(){
    super.initState();
    _navigateToHome();
  }
  _navigateToHome() async{
    await Future.delayed(Duration(milliseconds: 1500),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));

  }
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 50000,
      splash: Center(
        child: Column(
            children:[Image.asset(
              'assets/LogoTIC.png',
              width: MediaQuery.of(context).size.width * 0.7,
            )]),
      ),
      nextScreen: LoginPage(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      splashIconSize: 250,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
