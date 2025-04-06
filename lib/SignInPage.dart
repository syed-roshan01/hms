import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool savePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(height: 20),
              Text(
                "Welcome Back",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text("Login", style: TextStyle(color: Colors.grey[700])),
              SizedBox(height: 30),
              // Email Field
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail, color: Colors.grey),
                  hintText: 'Email Address',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 15),
              // Password Field
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: savePassword,
                    onChanged: (value) {
                      setState(() {
                        savePassword = value!;
                      });
                    },
                  ),
                  Text("Save Password"),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      // Navigate to forgot password
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle Sign In
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("Sign In"),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("Or"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 20),
              // Google Sign In
              ElevatedButton.icon(
                onPressed: () {
                  // Google Sign In logic
                },
                icon: Image.asset("assets/google.png", height: 24), // make sure image exists
                label: Text("Sign In with Google"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
              SizedBox(height: 10),
              // Apple Sign In
              ElevatedButton.icon(
                onPressed: () {
                  // Apple Sign In logic
                },
                icon: Icon(Icons.apple, size: 24),
                label: Text("Sign In with Apple"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
