import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'components/profile_menu.dart';
import 'components/profile_pic.dart';
import 'package:signio/SCREENS/sign_in/sign_in_screen.dart'; // Import the sign-in screen

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  final FirebaseAuth _auth = FirebaseAuth.instance; // Create an instance

  Future<void> signOut() async {
    await _auth.signOut();
  }

   ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () => {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () async {
                await signOut();
                // Navigate to sign-in screen after successful sign-out
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}