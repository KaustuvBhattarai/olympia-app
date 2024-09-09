import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'home.dart'; // Import home.dart

void main() {
  runApp(MyApp()); // Call runApp with your app widget
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Olympia', // Title of the application
      theme: ThemeData(
        primarySwatch: Colors.indigo, // Primary color theme
      ),
      home: EntryScreen(), // Set the initial screen of the app
      routes: {
        '/home': (context) => HomeScreen(), // Define route for home.dart
      },
    );
  }
}

class EntryScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onGetStarted() {
    // Define what happens when 'Get Started' is pressed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/logo.png', height: 200), // Replace with your logo asset
                SizedBox(height: 20),
                Text(
                  'Welcome to The Olympia!',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Create Account',
                  style: TextStyle(fontSize: 35, color: Colors.grey[700]),
                ),
                SizedBox(height: 20),

                // Padding around the email TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      prefixIcon: Icon(Icons.email),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 48, // Minimum width for the prefix icon
                        minHeight: 24, // Optional: adjust the height if needed
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Padding around the password TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      prefixIcon: Icon(Icons.lock),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 48, // Minimum width for the prefix icon
                        minHeight: 24, // Optional: adjust the height if needed
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () {
                          // Toggle password visibility
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Get Started Button
                ElevatedButton(
                  onPressed: _onGetStarted,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white, // Set text color to white
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    textStyle: TextStyle(fontSize: 18), // Adjust text size
                  ),
                  child: Text('Get Started'),
                ),
                SizedBox(height: 16),

                // Login as Guest Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home'); // Opens home.dart
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.indigo),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                    textStyle: TextStyle(fontSize: 18), // Adjust text size
                  ),
                  child: Text(
                    'Login as Guest',
                    style: TextStyle(color: Colors.indigo),
                  ),
                ),
                SizedBox(height: 70),
                Text('Or sign up with'),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Implement Google sign-in
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.grey[300]!),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        textStyle: TextStyle(fontSize: 16), // Adjust text size
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/google_icon.png', // Replace with your Google logo asset
                            height: 24,
                          ),
                          SizedBox(width: 10),
                          Text('Continue with Google'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
