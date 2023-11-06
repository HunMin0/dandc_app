import 'package:flutter/material.dart';
import 'package:theme_sample/components/setting_themes.dart';
import 'package:theme_sample/pages/home_index.dart';
import 'package:theme_sample/pages/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deal&Connect', // 디바이스의 작업줄에 표시역할
      theme: SettingThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      //home: const HomeIndex(),
      home: SplashScreen(),

      /*
      // 기기설정 폰트 사이즈에 의존하지 않을 경우 주석해제
      builder: (context, child) => MediaQuery(
        child: child!,
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      ),
      */

    );
  }
}
