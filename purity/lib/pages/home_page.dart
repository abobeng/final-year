import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';


class HomePage extends StatefulWidget {
  final bool isNightMode;

  const HomePage({Key? key, required this.isNightMode}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double phValue = 6.5;
  double turbidityValue = 0.8;
  double conductivityValue = 300;
  bool showWaterQuality = false;

  @override
  Widget build(BuildContext context) {
    final bool isNightMode = widget.isNightMode;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Dashboard'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'pH value',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: LinearPercentIndicator(
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 40,
                    percent: phValue / 14.0,
                    progressColor: Colors.blueAccent,
                    center: Text(
                      phValue.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onAnimationEnd: () {
                      Future.delayed(const Duration(milliseconds: 500), () {
                        setState(() {
                          showWaterQuality = true;
                        });
                      });
                    },
                  ),
                ),
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Turbidity checker',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: LinearPercentIndicator(
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 40,
                    percent: turbidityValue / 14.0,
                    progressColor: Colors.blueAccent,
                    center: Text(
                      turbidityValue.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onAnimationEnd: () {
                      Future.delayed(const Duration(milliseconds: 500), () {
                        setState(() {
                          showWaterQuality = true;
                        });
                      });
                    },
                  ),
                ),
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Conductivity checker',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: LinearPercentIndicator(
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 40,
                    percent: conductivityValue / 1000.0,
                    progressColor: Colors.blueAccent,
                    center: Text(
                      conductivityValue.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onAnimationEnd: () {
                      Future.delayed(const Duration(milliseconds: 500), () {
                        setState(() {
                          showWaterQuality = true;
                        });
                      });
                    },
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 26),
          child: GNav(
            backgroundColor: Colors.blueAccent,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade400,
            gap: 8,
            padding: EdgeInsets.all(16),
            selectedIndex: 0,
            onTabChange: (index) {
              switch (index) {
                case 0:
                  // Home button tapped
                  break;
                case 1:
                  // Settings button tapped
                  Navigator.pushNamed(context, '/settings');
                  break;
                case 2:
                  // Help button tapped
                  Navigator.pushNamed(context, '/help');
                  break;
              }
            }, // Set the initial selected index here
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
              GButton(
                icon: Icons.help,
                text: 'Help',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
