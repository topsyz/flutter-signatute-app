import 'package:flutter/material.dart';
import 'package:signio/SCREENS/forgot_password/forgot_password_screen.dart';
import 'package:signio/SCREENS/login_success/login_success_screen.dart';
import 'package:signio/SCREENS/sign_in/sign_in_screen.dart';
import 'package:signio/SCREENS/sign_up/sign_up_screen.dart';
import 'package:signio/Signpd/app/modules/view_document/bindings/view_document_binding.dart';
import 'package:signio/Signpd/app/modules/view_document/views/view_document_view.dart';
import 'package:signio/collect_cheque_screen/collect_screen.dart';
import 'package:signio/general_home_page/general_home.dart';
import 'package:signio/history/History_screen.dart';
import 'package:signio/profile/profile_screen.dart';
import 'package:signio/SCREENS/splash_screen.dart';
import 'package:signio/init_screen.dart';

import 'Signpd/app/modules/home/views/home_view.dart';

class AppRoutes {
  AppRoutes._();

  static const String initialRoute = InitScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    InitScreen.routeName: (context) => const InitScreen(),
    SplashScreen.routeName: (context) => const SplashScreen(),
    SignInScreen.routeName: (context) => const SignInScreen(),
    SignUpScreen.routeName: (context) => const SignUpScreen(),
    GeneralHomeScreen.routeName: (context) => const GeneralHomeScreen(),
    ProfileScreen.routeName: (context) => const ProfileScreen(),
    LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
    HistoryScreen.routeName: (context) =>  HistoryScreen(),
    ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
    CollectScreen.routeName: (context) => const CollectScreen(),
    HomeView.routeName: (context) => const HomeView(),
    ViewDocumentView.routeName: (context) => ViewDocumentView(),
  };
}
