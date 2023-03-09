import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mental_health_app/res/assets.dart';
import 'package:mental_health_app/screens/home/home_screen.dart';
import 'package:mental_health_app/screens/root/root_widget.dart';
import 'package:mental_health_app/util/navigation/navigation_service.dart';
import 'package:mental_health_app/util/navigation/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late bool isFirstTime;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const RootWidget()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.SPLASH_BACKGROUND_IMG),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
