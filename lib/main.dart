
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:test1/core/app_images.dart';
import 'package:test1/src/home_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget splashView = SplashScreenView(
      navigateRoute: home_page(),
      duration: 5000,
      imageSize: 500,
      imageSrc: AppImages.logo2,
      backgroundColor: Colors.white,
    );

    return MaterialApp(
      title: 'Splash screen Demo',
      home: splashView,
    );
  }
}


