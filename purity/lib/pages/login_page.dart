import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({Key? key, this.onTap}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: Column(
                  children: [
                    WaterIconImage(),
                    SizedBox(height: 16),
                    Text(
                      'Purity',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 140),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your mail',
                  ),
                  autofillHints: [AutofillHints.email],
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                  autofillHints: const [AutofillHints.password],
                ),
              ),

              // log in button
              GestureDetector(
                onTap: widget.onTap,
                child: const SizedBox(height: 16),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: const Text('Log in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WaterIconImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/assets/icons/waterlogo1.jpg', // Updated path here
      width: 64,
      height: 64,
    );
  }
}
