import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:signio/SCREENS/splash_screen.dart';
import 'package:signio/collect_cheque_screen/collect_screen.dart';
import 'package:signio/firebase_options.dart';
import 'package:signio/history/History_screen.dart';

import 'package:signio/theme.dart';
import 'package:get/get.dart';
import 'package:signio/routes.dart';

import 'init_screen.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way - Template',
      theme: AppTheme.lightTheme(context),
      initialRoute: SplashScreen.routeName,
      routes: AppRoutes.routes,
    );
  }
}