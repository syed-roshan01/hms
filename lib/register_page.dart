import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:hms_test_app/SignInPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final ImagePicker _picker = ImagePicker();
  File? userImage;
  File? shopImage;

  bool isChecked = false;
  String? selectedLocation;

  final List<String> locations = ["Area 1", "Area 2", "Area 3"]; // Dynamically replace from admin later

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 10),
              const Text(
                "Register Now",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Sign in with email and password and all fields to continue",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              buildTextField(Icons.person, "Full Name"),
              buildTextField(Icons.email, "Email Address"),
              buildTextField(Icons.lock, "Password", obscureText: true),
              buildTextField(Icons.lock, "Confirm Password", obscureText: true),

              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.location_on,color: Colors.grey),
                  hintText: "Select Location",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20), // Makes corners round
                  borderSide: BorderSide.none, // No border outline
                   ),
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20), // Keeps round shape when focused
                  borderSide: BorderSide.none, // No border when clicked
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                value: selectedLocation,
                items: locations
                    .map((location) => DropdownMenuItem(
                          value: location,
                          child: Text(location),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLocation = value;
                  });
                },
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  imageCircle(userImage, Icons.person, true),
                  const SizedBox(width: 20),
                  imageCircle(shopImage, Icons.store, false),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  GestureDetector(
                    onTap: showTermsDialog,
                    child: const Text(
                      "Click Here to Accept Terms & Conditions",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.black,
                ),
                onPressed: () {},
                child: const Text("Sign In", style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialButton("assets/google.png"),
                  const SizedBox(width: 20),
                  socialButton("assets/apple.jpg"),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Sign in",
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignInPage()),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(IconData icon, String hint, {bool obscureText = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[200],
        border: InputBorder.none, // Removes border
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // Makes corners round
          borderSide: BorderSide.none, // No border outline
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // Keeps round shape when focused
          borderSide: BorderSide.none, // No border when clicked
        ),
      ),
    ),
  );
}


  Widget socialButton(String imagePath) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      child: Image.asset(imagePath, width: 40, height: 40), // Equal size
    );
  }

  Widget imageCircle(File? image, IconData icon, bool isUser) {
    return GestureDetector(
      onTap: () => _pickImage(isUser),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.grey[300],
        backgroundImage: image != null ? FileImage(image) : null,
        child: image == null ? Icon(icon, size: 30, color: Colors.black) : null,
      ),
    );
  }

  void showTermsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Terms & Conditions"),
        content: const Text("Here are the terms and conditions you must accept to proceed."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          )
        ],
      ),
    );
  }

  Future<void> _pickImage(bool isUser) async {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        height: 160,
        child: Column(
          children: [
            const Text(
              "Upload Image",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    Navigator.pop(context);
                    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
                    if (pickedFile != null) {
                      setState(() {
                        if (isUser) {
                          userImage = File(pickedFile.path);
                        } else {
                          shopImage = File(pickedFile.path);
                        }
                      });
                    }
                  },
                  icon: const Icon(Icons.camera_alt),
                  label: const Text("Camera"),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    Navigator.pop(context);
                    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(() {
                        if (isUser) {
                          userImage = File(pickedFile.path);
                        } else {
                          shopImage = File(pickedFile.path);
                        }
                      });
                    }
                  },
                  icon: const Icon(Icons.photo_library),
                  label: const Text("Gallery"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
