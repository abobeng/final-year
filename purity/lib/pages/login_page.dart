import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

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

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        // User cancelled the Google Sign-In process.
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user != null) {
        // Successfully signed in with Google. You can access the user information here.
        print('User: ${user.displayName}, Email: ${user.email}');
        Navigator.pushReplacementNamed(context, '/home'); // Navigate to the home page after successful login
      } else {
        // Sign-in process failed.
        print('Sign-in process failed.');
      }
    } catch (e) {
      print('Error during Google Sign-In: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // Background Image
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/icons/waterpic.jpeg'), // Replace 'background.jpg' with your actual background image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Opacity(
              opacity: 0.9,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 150.0),
                      child: Column(
                        children: [
                          WaterIconImage(),
                          SizedBox(height: 15),
                          Text(
                            'Purity',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 140),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.blueAccent, width: 2.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Set the text color for the input field
                            decoration: InputDecoration(
                              labelText: 'Enter your mail',
                              labelStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                
                              ),
                              border: InputBorder.none,
                            ),
                            autofillHints: [AutofillHints.email],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Container(
                        decoration: BoxDecoration(
                          
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.blueAccent, width: 2.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)), // Set the text color for the input field
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              
                              ),
                              border: InputBorder.none,
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
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: _signInWithGoogle,
                      child: const Text('Sign In'),
                    ),
                  ],
                ),
              ),
            ),
          ],
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


