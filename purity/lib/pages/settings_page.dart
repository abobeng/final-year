import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatefulWidget {
  final bool isNightMode;
  final Function(bool) toggleNightMode;
  final String selectedLanguage;
  final Function(String) changeLanguage;

  const SettingsPage({
    Key? key,
    required this.isNightMode,
    required this.toggleNightMode,
    required this.selectedLanguage,
    required this.changeLanguage,
  }) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool isNightMode;
  late String selectedLanguage;

  @override
  void initState() {
    super.initState();
    isNightMode = widget.isNightMode;
    selectedLanguage = widget.selectedLanguage;
  }

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      // After signing out, navigate the user back to the login page or any other page as needed.
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      print('Error during sign-out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text(
              'Night Mode',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Switch(
              value: isNightMode,
              onChanged: (value) {
                setState(() {
                  isNightMode = value;
                });
                widget.toggleNightMode(value);
              },
              activeColor: Colors.blueAccent,
            ),
          ),
          ListTile(
            title: const Text(
              'Language',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: DropdownButton<String>(
              value: selectedLanguage,
              items: <DropdownMenuItem<String>>[
                DropdownMenuItem<String>(
                  value: 'en',
                  child: const Text('English'),
                ),
                DropdownMenuItem<String>(
                  value: 'fr',
                  child: const Text('French'),
                ),
              ],
              onChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    selectedLanguage = value;
                  });
                  widget.changeLanguage(value);
                }
              },
            ),
          ),
          ElevatedButton(
            onPressed: _signOut, // Call the sign-out function
            child: const Text('Sign Out'),
          ),
        ],
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
            selectedIndex: 1,
            onTabChange: (index) {
              switch (index) {
                case 0:
                  Navigator.pushReplacementNamed(context, '/home');
                  break;
                case 2:
                  Navigator.pushReplacementNamed(context, '/help');
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
