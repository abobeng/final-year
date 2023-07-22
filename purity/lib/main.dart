import 'package:flutter/material.dart';
import 'package:purity/pages/home_page.dart';
import 'package:purity/pages/settings_page.dart';
import 'package:purity/pages/help_page.dart';
import 'package:purity/pages/login_page.dart';
import 'package:purity/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isNightModeEnabled = false;

  @override
  void initState() {
    super.initState();
    checkNightMode();
  }

  void checkNightMode() {
    var now = DateTime.now();
    var currentTime = TimeOfDay.fromDateTime(now);

    if (currentTime.hour < 6 || currentTime.hour >= 18) {
      setState(() {
        isNightModeEnabled = true;
      });
    } else {
      setState(() {
        isNightModeEnabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: isNightModeEnabled ? ThemeData.dark() : ThemeData.light(),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashPage(),
        '/home': (context) => HomePage(isNightMode: isNightModeEnabled),
        '/settings': (context) => SettingsPage(
          isNightMode: isNightModeEnabled,
          toggleNightMode: toggleNightMode,
          selectedLanguage: 'en', // Provide a default value for selectedLanguage
          changeLanguage: (language) {}, // Provide a dummy function for changeLanguage
        ),
        '/help': (context) => HelpPage(),
        '/login': (context) => LoginPage(),
      },
    );
  }

  void toggleNightMode(bool value) {
    setState(() {
      isNightModeEnabled = value;
    });
  }
}
