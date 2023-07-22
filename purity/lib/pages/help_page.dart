import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Help'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Q: How do I reset my password?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'A: To reset your password, go to the login screen and click on the "Forgot password" link. Follow the instructions provided to reset your password.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Q: How can I contact customer support?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'A: If you need assistance, you can reach out to our customer support team by sending an email to support@example.com or by calling our toll-free number.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
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
            selectedIndex: 2, // Set the initial selected index to 2 for Help page
            onTabChange: (index) {
              switch (index) {
                case 0:
                  // Home button tapped
                  Navigator.pushReplacementNamed(context, '/home');
                  break;
                case 1:
                  // Settings button tapped
                  Navigator.pushReplacementNamed(context, '/settings');
                  break;
                case 2:
                  // Help button tapped (Already on Help page, do nothing)
                  break;
              }
            },
            tabs: const [
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
