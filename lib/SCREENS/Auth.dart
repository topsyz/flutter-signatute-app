import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:signio/SCREENS/login_success/login_success_screen.dart';
import 'package:signio/screens/sign_up/sign_up_screen.dart';
class Auth extends StatelessWidget {
  const Auth({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:((context,snapshot){
          if (snapshot.hasData){
            return const LoginSuccessScreen();
            } else{
            return const SignUpScreen();
          }
        } ),
      ),
    );
  }
}






