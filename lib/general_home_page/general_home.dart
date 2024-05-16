import 'package:signio/general_home_page/components/CashbackBanner.dart';
import 'package:signio/general_home_page/components/Features.dart';
import 'package:signio/general_home_page/components/categories.dart';
import 'package:signio/general_home_page/components/home_header.dart';
import 'package:flutter/material.dart';
class GeneralHomeScreen extends StatelessWidget {
  static String routeName = "/GeneralHomeScreen";

  const GeneralHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              HomeHeader(),
              CashbackBanner(),
              Categories(),
              FeaturesPage(),
              SizedBox(height: 20),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}