import 'dart:async';

import 'package:flutter/material.dart';
import 'package:theme_sample/components/layout/default_layout.dart';
import 'package:theme_sample/components/setting_colors.dart';
import 'package:theme_sample/pages/home_index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: SettingColors.primaryMeterialColor,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png',
              width: MediaQuery.of(context).size.width /2,),
            const SizedBox(height: 20.0,),
            Container(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Color(0xFF75a8e4),
                strokeWidth: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startTimer() {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeIndex()), // 이동할 화면을 설정합니다.
      );
    });
  }

}


